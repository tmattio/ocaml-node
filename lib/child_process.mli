open Import

module ChildProcess : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val on
    :  t
    -> [< `Close of code:int -> signal:string -> unit
       | `Disconnect of unit -> unit
       | `Error of err:Error.t -> unit
       | `Exit of code:int -> signal:string -> unit
       | `Message of message:t -> sendHandle:'e -> unit
       | `Spawn of unit -> unit
       ]
    -> unit

  module Channel : sig
    type t

    val t_of_js : Ojs.t -> t

    val t_to_js : t -> Ojs.t

    val ref : t -> t

    val unref : t -> t
  end

  val channel : t -> t

  val connected : t -> bool

  val disconnect : t -> unit

  val exitCode : t -> int

  val kill : t -> ?signal:[ `Int of int | `String of string ] -> unit -> bool

  val killed : t -> bool

  val pid : t -> int option

  val ref : t -> unit

  module SendOptions : sig
    type t

    val t_of_js : Ojs.t -> t

    val t_to_js : t -> Ojs.t

    val create : ?keepOpen:bool -> unit -> t
  end

  val send
    :  t
    -> t
    -> ?sendHandle:[ `Server of Net.Server.t | `Socket of Net.Socket.t ]
    -> ?options:t
    -> ?callback:(Error.t option -> unit)
    -> unit
    -> bool

  val signalCode : t -> string option

  val spawnargs : t -> string list

  val spawnfile : t -> string

  val stderr : t -> Stream.Readable.t

  val stdin : t -> Stream.Writable.t

  val stdout : t -> Stream.Readable.t

  val unref : t -> unit
end

module ExecOptions : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val create
    :  ?cwd:string
    -> ?env:string Dict.t
    -> ?encoding:string
    -> ?shell:string
    -> ?timeout:int
    -> ?maxBuffer:int
    -> ?killSignal:string
    -> ?uid:int
    -> ?gid:int
    -> ?windowsHide:bool
    -> unit
    -> t
end

val exec
  :  string
  -> ?options:ExecOptions.t
  -> ?callback:(Error.t option -> string -> string -> unit)
  -> unit
  -> ChildProcess.t

module ExecFileOptions : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val create
    :  ?cwd:string
    -> ?env:string Dict.t
    -> ?encoding:string
    -> ?shell:([ `String of string | `Bool of bool ][@js.union])
    -> ?timeout:int
    -> ?maxBuffer:int
    -> ?killSignal:string
    -> ?uid:int
    -> ?gid:int
    -> ?windowsHide:bool
    -> ?signal:Global.AbortSignal.t
    -> unit
    -> t
end

val execFile
  :  string
  -> ?args:string list
  -> ?options:ExecFileOptions.t
  -> ?callback:(Error.t option -> string -> string -> unit)
  -> unit
  -> ChildProcess.t

module ForkOptions : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val create
    :  ?cwd:string
    -> ?detached:bool
    -> ?env:string Dict.t
    -> ?execPath:string
    -> ?execArgv:string list
    -> ?gid:int
    -> ?serialization:string
    -> ?signal:Global.AbortSignal.t
    -> ?killSignal:string
    -> ?silent:bool
    -> ?stdio:string list
    -> ?uid:int
    -> ?windowsVerbatimArguments:bool
    -> unit
    -> t
end

val fork
  :  string
  -> ?args:string list
  -> ?options:ForkOptions.t
  -> unit
  -> ChildProcess.t

module SpawnOptions : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val create
    :  ?cwd:string
    -> ?env:string Dict.t
    -> ?argv0:string
    -> ?stdio:string list
    -> ?detached:bool
    -> ?uid:int
    -> ?gid:int
    -> ?serialization:string
    -> ?shell:([ `String of string | `Bool of bool ][@js.union])
    -> ?windowsVerbatimArguments:bool
    -> ?windowsHide:bool
    -> ?signal:Global.AbortSignal.t
    -> ?killSignal:string
    -> unit
    -> t
end

val spawn
  :  string
  -> ?args:string list
  -> ?options:SpawnOptions.t
  -> unit
  -> ChildProcess.t

module ExecFileSyncOptions : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val create
    :  ?cwd:string
    -> ?input:[ `Buffer of Buffer.Buffer.t | `String of string ]
    -> ?stdio:string list
    -> ?env:string Dict.t
    -> ?uid:int
    -> ?gid:int
    -> ?timeout:int
    -> ?killSignal:[ `Int of int | `String of string ]
    -> ?maxBuffer:int
    -> ?encoding:string
    -> ?windowsHide:bool
    -> ?shell:[ `Bool of bool | `String of string ]
    -> unit
    -> t
end

val execFileSync
  :  string
  -> ?args:string list
  -> ?options:ExecFileSyncOptions.t
  -> unit
  -> string

module SpawnSyncOptions : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val create
    :  ?cwd:string
    -> ?input:[ `Buffer of Buffer.Buffer.t | `String of string ]
    -> ?argv0:string
    -> ?stdio:string list
    -> ?env:string Dict.t
    -> ?uid:int
    -> ?gid:int
    -> ?timeout:int
    -> ?killSignal:[ `Int of int | `String of string ]
    -> ?maxBuffer:int
    -> ?encoding:string
    -> ?shell:[ `Bool of bool | `String of string ]
    -> ?windowsVerbatimArguments:bool
    -> ?windowsHide:bool
    -> ?killSignal:string
    -> unit
    -> t
end

module SpawnSyncReturn : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val pid : t -> int

  val output : t -> string list

  val stdout : t -> string

  val stderr : t -> string

  val status : t -> int option

  val signal : t -> string option

  val error : t -> Error.t option
end

val spawnSync
  :  string
  -> ?options:SpawnSyncOptions.t
  -> unit
  -> SpawnSyncReturn.t
