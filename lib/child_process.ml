open Import

module ChildProcess = struct
  type t = private Ojs.t [@@js]

  val on : t -> string -> Ojs.t -> unit [@@js.call]

  let on t = function
    | `Close f ->
      on t "close" @@ [%js.of: code:int -> signal:string -> unit] f
    | `Disconnect f ->
      on t "disconnect" @@ [%js.of: unit -> unit] f
    | `Error f ->
      on t "error" @@ [%js.of: err:Error.t -> unit] f
    | `Exit f ->
      on t "exit" @@ [%js.of: code:int -> signal:string -> unit] f
    | `Message f ->
      on t "message" @@ [%js.of: message:Ojs.t -> sendHandle:Ojs.t -> unit] f
    | `Spawn f ->
      on t "spawn" @@ [%js.of: unit -> unit] f

  module Channel = struct
    type t = private Ojs.t [@@js]

    val ref : t -> t [@@js.call]

    val unref : t -> t [@@js.call]
  end

  val channel : t -> Channel.t [@@js.get]

  val connected : t -> bool [@@js.get]

  val disconnect : t -> unit [@@js.call]

  val exitCode : t -> int [@@js.get]

  val kill
    :  t
    -> ?signal:([ `String of string | `Int of int ][@js.union])
    -> unit
    -> bool
    [@@js.call]

  val killed : t -> bool [@@js.get]

  val pid : t -> int or_undefined [@@js.get]

  val ref : t -> unit [@@js.call]

  module SendOptions = struct
    type t = private Ojs.t [@@js]

    val create : ?keepOpen:bool -> unit -> t [@@js.builder]
  end

  val send
    :  t
    -> Ojs.t
    -> ?sendHandle:([ `Server of Net.Server.t | `Socket of Net.Socket.t ]
         [@js.union])
    -> ?options:SendOptions.t
    -> ?callback:(Error.t or_undefined -> unit)
    -> unit
    -> bool
    [@@js.call]

  val signalCode : t -> string or_undefined [@@js.get]

  val spawnargs : t -> string list [@@js.get]

  val spawnfile : t -> string [@@js.get]

  val stderr : t -> Stream.Readable.t [@@js.get]

  val stdin : t -> Stream.Writable.t [@@js.get]

  val stdout : t -> Stream.Readable.t [@@js.get]

  val unref : t -> unit [@@js.call]
end

module ExecOptions = struct
  type t = private Ojs.t [@@js]

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
    [@@js.builder]
end

val exec
  :  string
  -> ?options:ExecOptions.t
  -> ?callback:(Error.t or_undefined -> string -> string -> unit)
  -> unit
  -> ChildProcess.t
  [@@js.global "child_process.exec"]

module ExecFileOptions = struct
  type t = private Ojs.t [@@js]

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
    [@@js.builder]
end

val execFile
  :  string
  -> ?args:string list
  -> ?options:ExecFileOptions.t
  -> ?callback:(Error.t or_undefined -> string -> string -> unit)
  -> unit
  -> ChildProcess.t
  [@@js.global "child_process.execFile"]

module ForkOptions = struct
  type t = private Ojs.t [@@js]

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
    [@@js.builder]
end

val fork
  :  string
  -> ?args:string list
  -> ?options:ForkOptions.t
  -> unit
  -> ChildProcess.t
  [@@js.global "child_process.fork"]

module SpawnOptions = struct
  type t = private Ojs.t [@@js]

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
    [@@js.builder]
end

val spawn
  :  string
  -> ?args:string list
  -> ?options:SpawnOptions.t
  -> unit
  -> ChildProcess.t
  [@@js.global "child_process.spawn"]

module ExecFileSyncOptions = struct
  type t = private Ojs.t [@@js]

  val create
    :  ?cwd:string
    -> ?input:([ `String of string | `Buffer of Buffer.Buffer.t ][@js.union])
    -> ?stdio:string list
    -> ?env:string Dict.t
    -> ?uid:int
    -> ?gid:int
    -> ?timeout:int
    -> ?killSignal:([ `String of string | `Int of int ][@js.union])
    -> ?maxBuffer:int
    -> ?encoding:string
    -> ?windowsHide:bool
    -> ?shell:([ `String of string | `Bool of bool ][@js.union])
    -> unit
    -> t
    [@@js.builder]
end

val execFileSync
  :  string
  -> ?args:string list
  -> ?options:ExecFileSyncOptions.t
  -> unit
  -> string
  [@@js.global "child_process.execFileSync"]

module SpawnSyncOptions = struct
  type t = private Ojs.t [@@js]

  val create
    :  ?cwd:string
    -> ?input:([ `String of string | `Buffer of Buffer.Buffer.t ][@js.union])
    -> ?argv0:string
    -> ?stdio:string list
    -> ?env:string Dict.t
    -> ?uid:int
    -> ?gid:int
    -> ?timeout:int
    -> ?killSignal:([ `String of string | `Int of int ][@js.union])
    -> ?maxBuffer:int
    -> ?encoding:string
    -> ?shell:([ `String of string | `Bool of bool ][@js.union])
    -> ?windowsVerbatimArguments:bool
    -> ?windowsHide:bool
    -> ?killSignal:string
    -> unit
    -> t
    [@@js.builder]
end

module SpawnSyncReturn = struct
  type t = private Ojs.t [@@js]

  val pid : t -> int [@@js.get]

  val output : t -> string list [@@js.get]

  val stdout : t -> string [@@js.get]

  val stderr : t -> string [@@js.get]

  val status : t -> int or_undefined [@@js.get]

  val signal : t -> string or_undefined [@@js.get]

  val error : t -> Error.t or_undefined [@@js.get]
end

val spawnSync
  :  string
  -> ?options:SpawnSyncOptions.t
  -> unit
  -> SpawnSyncReturn.t
  [@@js.global "child_process.spawnSync"]
