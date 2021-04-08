open Import

module Dirent = struct
  type t =
    { name : string
    ; kind :
        [ `UNKNOWN | `FILE | `DIR | `LINK | `FIFO | `SOCKET | `CHAR | `BLOCK ]
    }
end

type flag =
  [ `a  (** ["a"] *)
  | `ax  (** ["ax"] *)
  | `a'  (** ["a+"] *)
  | `ax'  (** ["ax+"] *)
  | `as_  (** ["as"] *)
  | `as'  (** ["as+"] *)
  | `r  (** ["r"] *)
  | `r'  (** ["r+"] *)
  | `rs'  (** ["rs+"] *)
  | `w  (** ["w"] *)
  | `wx  (** ["wx"] *)
  | `w'  (** ["w+"] *)
  | `wx'  (** ["wx+"] *)
  ]

let flag_to_luv_flags = function
  | `a ->
    [ `APPEND; `CREAT; `WRONLY ]
  | `ax ->
    [ `APPEND; `CREAT; `WRONLY; `EXCL ]
  | `a' ->
    [ `APPEND; `CREAT; `RDWR ]
  | `ax' ->
    [ `APPEND; `CREAT; `RDWR; `EXCL ]
  | `as_ ->
    [ `APPEND; `CREAT; `WRONLY; `SYNC ]
  | `as' ->
    [ `APPEND; `CREAT; `RDWR; `SYNC ]
  | `r ->
    [ `RDONLY ]
  | `r' ->
    [ `RDWR ]
  | `rs' ->
    [ `RDWR; `SYNC ]
  | `w ->
    [ `TRUNC; `CREAT; `WRONLY ]
  | `w' ->
    [ `TRUNC; `CREAT; `RDWR ]
  | `wx ->
    [ `TRUNC; `CREAT; `WRONLY; `EXCL ]
  | `wx' ->
    [ `TRUNC; `CREAT; `RDWR; `EXCL ]

let exists_sync = Sys.file_exists

let read_file_sync ?encoding:_ ?(flag = `r) path =
  (* TODO: Support encoding *)
  let open Result.Syntax in
  let@ () = handle_sys_error in
  let flags = flag_to_luv_flags flag in
  let* stat = Luv.File.Sync.stat path in
  let* file = Luv.File.Sync.open_ path flags in
  let buffer =
    Luv.Buffer.create (Unsigned.UInt64.to_int stat.Luv.File.Stat.size)
  in
  let _length = Luv.File.Sync.read file [ buffer ] in
  let+ () = Luv.File.Sync.close file in
  buffer

let write_file_sync ?encoding:_ ?mode:_ ?(flag = `w) path buffer =
  (* TODO: Support encoding *)
  let open Result.Syntax in
  let@ () = handle_sys_error in
  let flags = flag_to_luv_flags flag in
  let* file = Luv.File.Sync.open_ path flags in
  let* _ = Luv.File.Sync.write file [ buffer ] in
  Luv.File.Sync.close file

let mkdir_sync ?(recursive = false) ?mode path =
  let mode = Option.map (fun mode -> [ `NUMERIC mode ]) mode in
  if not recursive then
    let@ () = handle_sys_error in
    Luv.File.Sync.mkdir ?mode path
  else
    let rec aux p acc =
      let dirname = Path.dirname p in
      if dirname = p then
        List.rev acc
      else if Sys.file_exists dirname then
        List.rev acc
      else
        aux dirname (dirname :: acc)
    in
    let dirs_to_create = aux path [] in
    List.iter
      (fun x -> handle_sys_error (fun () -> Luv.File.Sync.mkdir ?mode x))
      dirs_to_create

let unlink_sync path =
  let@ () = handle_sys_error in
  Luv.File.Sync.unlink path

let readdir_sync ?encoding:_ path =
  (* TODO: Support encoding *)
  let open Result.Syntax in
  let@ () = handle_sys_error in
  let* dir = Luv.File.Sync.opendir path in
  let+ entries = Luv.File.Sync.readdir dir in
  Array.to_list entries
  |> List.map (fun dirent ->
         Dirent.
           { name = dirent.Luv.File.Dirent.name
           ; kind = dirent.Luv.File.Dirent.kind
           })

let chmod_sync path mode =
  let@ () = handle_sys_error in
  let mode = [ `NUMERIC mode ] in
  Luv.File.Sync.chmod path mode
