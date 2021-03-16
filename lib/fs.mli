module FileHandle : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t
end

val readDir : string -> (string list, string) result Promise.t

val readFile : string -> string Promise.t

val exists : string -> bool Promise.t

module CreateWriteStreamOptions : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val create
    :  ?flags:string
    -> ?encoding:string
    -> ?fd:int
    -> ?mode:int
    -> ?autoClose:bool
    -> ?emitClose:bool
    -> ?start:int
    -> ?fs:t
    -> unit
    -> t
end

val createWriteStream
  :  string
  -> ?options:CreateWriteStreamOptions.t
  -> unit
  -> Stream.Writable.t

module CreateReadStreamOptions : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

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
    -> ?fs:t
    -> unit
    -> t
end

val createReadStream
  :  string
  -> ?options:CreateReadStreamOptions.t
  -> unit
  -> Stream.Readable.t
