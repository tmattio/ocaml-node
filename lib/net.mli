open Js

module BlockList : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  val addAddress : t -> string -> ?type_:string -> unit -> unit [@@js.call]

  val addRange : t -> string -> string -> ?type_:string -> unit -> unit
    [@@js.call]

  val addSubnet : t -> string -> int -> ?type_:string -> unit -> unit
    [@@js.call]

  val check : t -> string -> ?type_:string -> unit -> bool [@@js.call]

  val rules : t -> string list [@@js.get]
end

module Socket : sig
  include module type of struct
    include Stream.Duplex
  end

  [@@@js.stop]

  val on
    :  t
    -> [< `Close of hadError:bool -> unit
       | `Connect of unit -> unit
       | `Data of Buffer.Buffer.t -> unit
       | `Drain of unit -> unit
       | `End of unit -> unit
       | `Error of Js.Error.t -> unit
       | `Lookup of
         err:Js.Error.t option
         -> address:string
         -> family:string option
         -> host:string
         -> unit
       | `Ready of unit -> unit
       | `Timeout of unit -> unit
       ]
    -> unit

  [@@@js.start]

  [@@@js.implem
  val on : t -> string -> Ojs.t -> unit [@@js.call]

  let on t = function
    | `Close f ->
      on t "close" @@ [%js.of: hadError:bool -> unit] f
    | `Connect f ->
      on t "connect" @@ [%js.of: unit -> unit] f
    | `Data f ->
      (* TODO: Can also be [string -> unit] depending on Socket.setEncoding() *)
      on t "connect" @@ [%js.of: Buffer.Buffer.t -> unit] f
    | `Drain f ->
      on t "drain" @@ [%js.of: unit -> unit] f
    | `End f ->
      on t "end" @@ [%js.of: unit -> unit] f
    | `Error f ->
      on t "error" @@ [%js.of: Error.t -> unit] f
    | `Lookup f ->
      on t "lookup"
      @@ [%js.of:
           err:Error.t option
           -> address:string
           -> family:string option
           -> host:string
           -> unit]
           f
    | `Ready f ->
      on t "ready" @@ [%js.of: unit -> unit] f
    | `Timeout f ->
      on t "timeout" @@ [%js.of: unit -> unit] f]

  val address : t -> Global.Address.t [@@js.get]

  val bytesRead : t -> int [@@js.get]

  val bytesWritten : t -> int [@@js.get]

  module ConnectOptions : sig
    module OnReadOptions : sig
      type t

      val t_to_js : t -> Ojs.t

      val t_of_js : Ojs.t -> t

      val create
        :  ?buffer:Buffer.Buffer.t
        -> ?callback:(int -> Buffer.Buffer.t -> unit)
        -> unit
        -> t
        [@@js.builder]
    end

    type t

    val t_to_js : t -> Ojs.t

    val t_of_js : Ojs.t -> t

    val create
      :  ?port:int
      -> ?host:string
      -> ?localAddress:string
      -> ?localPort:int
      -> ?family:int
      -> ?hints:int
      -> ?lookup:
           (err:Error.t option
            -> address:string
            -> family:string option
            -> host:string
            -> unit)
      -> ?path:string
      -> ?onread:OnReadOptions.t
      -> unit
      -> t
      [@@js.builder]
  end

  val connect : t -> ConnectOptions.t -> t [@@js.call]

  val connecting : t -> bool [@@js.get]

  val destroy : t -> ?error:Error.t -> unit -> unit [@@js.call]

  val destroyed : t -> bool [@@js.get]

  val end_
    :  t
    -> ?data:
         ([ `String of string
          | `Buffer of Buffer.Buffer.t
          | `Uint8Array of Uint8Array.t
          ]
         [@js.union])
    -> ?encoding:string
    -> ?callback:(unit -> unit)
    -> unit
    -> t
    [@@js.call "end"]

  val localAddress : t -> string [@@js.get]

  val localPort : t -> int [@@js.get]

  val pause : t -> t [@@js.get]

  val pending : t -> bool [@@js.get]

  val ref : t -> t [@@js.get]

  val remoteAddress : t -> string [@@js.get]

  val remoteFamily : t -> string [@@js.get]

  val remotePort : t -> int [@@js.get]

  val resume : t -> t [@@js.get]

  val setEncoding : t -> string -> t [@@js.call]

  val setKeepAlive : t -> ?enable:bool -> ?initialDelay:int -> unit -> t
    [@@js.call]

  val setNoDelay : t -> ?noDelay:bool -> unit -> t [@@js.call]

  val setTimeout : t -> int -> ?callback:(unit -> unit) -> unit -> t [@@js.call]

  val timeout : t -> int option [@@js.get]

  val unref : t -> t [@@js.get]

  val write
    :  t
    -> ?data:
         ([ `String of string
          | `Buffer of Buffer.Buffer.t
          | `Uint8Array of Uint8Array.t
          ]
         [@js.union])
    -> ?encoding:string
    -> ?callback:(unit -> unit)
    -> unit
    -> bool
    [@@js.call]

  val readyState : t -> string [@@js.get]

  module Options : sig
    type t

    val t_to_js : t -> Ojs.t

    val t_of_js : Ojs.t -> t

    val create
      :  ?fd:int
      -> ?allowHalfOpen:bool
      -> ?readable:bool
      -> ?writable:bool
      -> unit
      -> t
      [@@js.builder]
  end

  val create : ?options:Options.t -> unit -> t [@@js.builder]
end

module Server : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  [@@@js.stop]

  val on
    :  t
    -> [< `Close of unit -> unit
       | `Connection of Socket.t -> unit
       | `Error of Js.Error.t -> unit
       | `Listening of unit -> unit
       ]
    -> unit

  [@@@js.start]

  [@@@js.implem
  val on : t -> string -> Ojs.t -> unit [@@js.call]

  let on t = function
    | `Close f ->
      on t "close" @@ [%js.of: unit -> unit] f
    | `Connection f ->
      on t "connection" @@ [%js.of: Socket.t -> unit] f
    | `Error f ->
      on t "error" @@ [%js.of: Error.t -> unit] f
    | `Listening f ->
      on t "listening" @@ [%js.of: unit -> unit] f]

  (* TODO: For a server listening on a pipe or Unix domain socket, the name is
     returned as a string. *)
  val address : t -> Global.Address.t option [@@js.get]

  val close : t -> ?callback:(unit -> unit) -> unit -> t [@@js.call]

  val getConnections : t -> (unit -> unit) -> t [@@js.call]

  module ListenOptions : sig
    type t

    val t_to_js : t -> Ojs.t

    val t_of_js : Ojs.t -> t

    val create
      :  ?port:int
      -> ?host:string
      -> ?path:string
      -> ?backlog:int
      -> ?exclusive:bool
      -> ?readableAll:bool
      -> ?writableAll:bool
      -> ?ipv6Only:bool
      -> ?signal:Global.AbortSignal.t
      -> unit
      -> t
      [@@js.builder]
  end

  val listen : t -> ListenOptions.t -> t [@@js.call]

  val listening : t -> bool [@@js.get]

  val maxConnections : t -> int [@@js.get]

  val ref : t -> t [@@js.get]

  val unref : t -> t [@@js.get]

  module Options : sig
    type t

    val t_to_js : t -> Ojs.t

    val t_of_js : Ojs.t -> t

    val fd : t -> int [@@js.get]

    val allowHalfOpen : t -> bool [@@js.get]

    val readable : t -> bool [@@js.get]

    val writable : t -> bool [@@js.get]
  end

  val create
    :  ?options:Options.t
    -> ?connectionListener:(Socket.t -> unit)
    -> unit
    -> t
    [@@js.builder]
end

module ConnectOptions : sig
  module OnReadOptions : sig
    type t

    val t_to_js : t -> Ojs.t

    val t_of_js : Ojs.t -> t

    val create
      :  ?buffer:Buffer.Buffer.t
      -> ?callback:(int -> Buffer.Buffer.t -> unit)
      -> unit
      -> t
      [@@js.builder]
  end

  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  val create
    :  ?fd:int
    -> ?allowHalfOpen:bool
    -> ?readable:bool
    -> ?writable:bool
    -> ?port:int
    -> ?host:string
    -> ?localAddress:string
    -> ?localPort:int
    -> ?family:int
    -> ?hints:int
    -> ?lookup:
         (err:Error.t option
          -> address:string
          -> family:string option
          -> host:string
          -> unit)
    -> ?path:string
    -> ?onread:OnReadOptions.t
    -> unit
    -> t
    [@@js.builder]
end

val connect
  :  ConnectOptions.t
  -> ?connectionListener:(Buffer.Buffer.t -> unit)
  -> unit
  -> Socket.t
  [@@js.global "connect"]

val createConnection
  :  ConnectOptions.t
  -> ?connectionListener:(Buffer.Buffer.t -> unit)
  -> unit
  -> Socket.t
  [@@js.global "createConnection"]

module CreateServerOptions : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  val allowHalfOpen : t -> bool [@@js.get]

  val pauseOnConnect : t -> bool [@@js.get]
end

val createServer
  :  Server.Options.t
  -> ?connectionListener:(Socket.t -> unit)
  -> unit
  -> Server.t
  [@@js.global "createServer"]

val isIP : string -> bool [@@js.global "isIP"]

val isIPv4 : string -> bool [@@js.global "isIPv4"]

val isIPv6 : string -> bool [@@js.global "isIPv6"]
