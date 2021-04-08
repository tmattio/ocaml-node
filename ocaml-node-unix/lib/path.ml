let basename = Filename.basename

let delimiter = match Sys.os_type with "Win32" -> ";" | _ -> ":"

let dirname = Filename.dirname

let extname = Filename.extension

let is_absolute s = not (Filename.is_relative s)

let join ls = List.fold_left Filename.concat "" ls

let normalize _ = failwith "TODO"

type parsed_path =
  { dir : string
  ; root : string
  ; base : string
  ; name : string
  ; ext : string
  }

let parse _ = failwith "TODO"

let relative _ = failwith "TODO"

let resolve _ = failwith "TODO"

let sep = match Sys.os_type with "Win32" -> "\\" | _ -> "/"

let to_namespaced_path _ = failwith "TODO"
