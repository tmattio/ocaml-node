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

let flag_to_string = function
  | `a ->
    "a"
  | `ax ->
    "ax"
  | `a' ->
    "a+"
  | `ax' ->
    "ax+"
  | `as_ ->
    "as"
  | `as' ->
    "as+"
  | `r ->
    "r"
  | `r' ->
    "r+"
  | `rs' ->
    "rs+"
  | `w ->
    "w"
  | `wx ->
    "wx"
  | `w' ->
    "w+"
  | `wx' ->
    "wx+"

let exists_sync = Node.Fs.existsSync

let read_file_sync ?encoding ?(flag = `r) path =
  let@ () = handle_sys_error in
  let flag = flag_to_string flag in
  let options = Node.Fs.ReadFileOptions.create ?encoding ~flag () in
  Node.Fs.readFileSync ~options path ()

let write_file_sync ?encoding ?mode ?(flag = `w) path buffer =
  let@ () = handle_sys_error in
  let flag = flag_to_string flag in
  let options = Node.Fs.WriteFileOptions.create ?encoding ?mode ~flag () in
  Node.Fs.writeFileSync ~options path buffer ()

let mkdir_sync ?recursive ?mode path =
  let@ () = handle_sys_error in
  let options = Node.Fs.MkdirOptions.create ?recursive ?mode () in
  Node.Fs.mkdirSync ~options path ()

let _rm_sync ?force ?max_retries ?recursive ?retry_delay path =
  let@ () = handle_sys_error in
  let options =
    Node.Fs.RmOptions.create
      ?force
      ?maxRetries:max_retries
      ?recursive
      ?retryDelay:retry_delay
      ()
  in
  Node.Fs.rmSync ~options path ()

let unlink_sync path =
  let@ () = handle_sys_error in
  Node.Fs.unlinkSync path ()

let dirent_kind dirent =
  if Node.Fs.Dirent.isBlockDevice dirent then
    `BLOCK
  else if Node.Fs.Dirent.isCharacterDevice dirent then
    `CHAR
  else if Node.Fs.Dirent.isDirectory dirent then
    `DIR
  else if Node.Fs.Dirent.isFIFO dirent then
    `FIFO
  else if Node.Fs.Dirent.isFile dirent then
    `FILE
  else if Node.Fs.Dirent.isSocket dirent then
    `SOCKET
  else if Node.Fs.Dirent.isSymbolicLink dirent then
    `LINK
  else
    `UNKNOWN

let readdir_sync ?encoding path =
  let@ () = handle_sys_error in
  let options =
    Node.Fs.ReaddirOptions.create ?encoding ~withFileTypes:true ()
  in
  Node.Fs.readdirSync' ~options path ()
  |> List.map (fun dirent ->
         Dirent.{ name = Node.Fs.Dirent.name dirent; kind = dirent_kind dirent })

let chmod_sync path mode =
  let@ () = handle_sys_error in
  Node.Fs.chmodSync path mode
