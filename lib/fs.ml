open Import

module FileHandle = struct
  type t = private Ojs.t [@@js]
end

val readDir : string -> string list Promise.t [@@js.global "fs.readDir"]

let readDir path =
  readDir path
  |> Promise.then_ ~fulfilled:Promise.Result.return ~rejected:(fun error ->
         Promise.return
           (Error
              (error |> Promise.error_to_js |> Error.t_of_js |> Error.message)))

val readFile : string -> encoding:string -> string Promise.t
  [@@js.global "fs.readFile"]

let readFile = readFile ~encoding:"utf8"

val exists : string -> bool Promise.t [@@js.global "fs.exists"]

module CreateWriteStreamOptions = struct
  type t = private Ojs.t [@@js]

  val create
    :  ?flags:string
    -> ?encoding:string
    -> ?fd:int
    -> ?mode:int
    -> ?autoClose:bool
    -> ?emitClose:bool
    -> ?start:int
    -> ?fs:Ojs.t
    -> unit
    -> t
    [@@js.builder]
end

val createWriteStream
  :  string
  -> ?options:CreateWriteStreamOptions.t
  -> unit
  -> Stream.Writable.t
  [@@js.global "fs.createWriteStream"]

module CreateReadStreamOptions = struct
  type t = private Ojs.t [@@js]

  val create
    :  ?flags:string
    -> ?encoding:string
    -> ?fd:int
    -> ?mode:int
    -> ?autoClose:bool
    -> ?emitClose:bool
    -> ?start:int
    -> ?end_:int
    -> ?highWaterMark:int
    -> ?fs:Ojs.t
    -> unit
    -> t
    [@@js.builder]
end

val createReadStream
  :  string
  -> ?options:CreateReadStreamOptions.t
  -> unit
  -> Stream.Readable.t
  [@@js.global "fs.createReadStream"]
