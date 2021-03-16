module Options : sig
  type t

  val create : ?cwd:string -> ?env:string Import.Dict.t -> unit -> t
end

type return =
  { exitCode : int
  ; stdout : string
  ; stderr : string
  }

type event =
  | Spawned
  | Stdout of string
  | Stderr of string
  | Closed

val exec
  :  ?logger:(event -> unit)
  -> ?stdin:string
  -> ?options:Options.t
  -> string
  -> return Promise.t

val spawn
  :  ?logger:(event -> unit)
  -> ?stdin:string
  -> ?options:Options.t
  -> string
  -> string array
  -> return Promise.t
