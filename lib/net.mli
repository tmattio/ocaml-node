open Import

module BlockList : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val addAddress : t -> string -> ?type_:string -> unit -> unit

  val addRange : t -> string -> string -> ?type_:string -> unit -> unit

  val addSubnet : t -> string -> int -> ?type_:string -> unit -> unit

  val check : t -> string -> ?type_:string -> unit -> bool

  val rules : t -> string list
end

module Socket : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val on
    :  t
    -> [< `Close of hadError:bool -> unit
       | `Connect of unit -> unit
       | `Data of Buffer.Buffer.t -> unit
       | `Drain of unit -> unit
       | `End of unit -> unit
       | `Error of Import.Error.t -> unit
       | `Lookup of
         err:Import.Error.t option
         -> address:string
         -> family:string option
         -> host:string
         -> unit
       | `Ready of unit -> unit
       | `Timeout of unit -> unit
       ]
    -> unit

  val address : t -> Global.Address.t

  val bytesRead : t -> int

  val bytesWritten : t -> int

  module ConnectOptions : sig
    module OnReadOptions : sig
      type t

      val t_of_js : Ojs.t -> t

      val t_to_js : t -> Ojs.t

      val create
        :  ?buffer:Buffer.Buffer.t
        -> ?callback:(int -> Buffer.Buffer.t -> unit)
        -> unit
        -> t
    end

    type t

    val t_of_js : Ojs.t -> t

    val t_to_js : t -> Ojs.t

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
      -> ?onread:t
      -> unit
      -> t
  end

  val connect : t -> t -> t

  val connecting : t -> bool

  val destroy : t -> ?error:Error.t -> unit -> unit

  val destroyed : t -> bool

  val end_
    :  t
    -> ?data:
         [ `Buffer of Buffer.Buffer.t
         | `String of string
         | `Uint8Array of Uint8Array.t
         ]
    -> ?encoding:string
    -> ?callback:(unit -> unit)
    -> unit
    -> t

  val localAddress : t -> string

  val localPort : t -> int

  val pause : t -> t

  val pending : t -> bool

  val ref : t -> t

  val remoteAddress : t -> string

  val remoteFamily : t -> string

  val remotePort : t -> int

  val resume : t -> t

  val setEncoding : t -> string -> t

  val setKeepAlive : t -> ?enable:bool -> ?initialDelay:int -> unit -> t

  val setNoDelay : t -> ?noDelay:bool -> unit -> t

  val setTimeout : t -> int -> ?callback:(unit -> unit) -> unit -> t

  val timeout : t -> int option

  val unref : t -> t

  val write
    :  t
    -> ?data:
         [ `Buffer of Buffer.Buffer.t
         | `String of string
         | `Uint8Array of Uint8Array.t
         ]
    -> ?encoding:string
    -> ?callback:(unit -> unit)
    -> unit
    -> bool

  val readyState : t -> string

  module Options : sig
    type t

    val t_of_js : Ojs.t -> t

    val t_to_js : t -> Ojs.t

    val create
      :  ?fd:int
      -> ?allowHalfOpen:bool
      -> ?readable:bool
      -> ?writable:bool
      -> unit
      -> t
  end

  val create : ?options:t -> unit -> t
end

module Server : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val on
    :  t
    -> [< `Close of unit -> unit
       | `Connection of t -> unit
       | `Error of Error.t -> unit
       | `Listening of unit -> unit
       ]
    -> unit

  val address : t -> Global.Address.t option

  val close : t -> ?callback:(unit -> unit) -> unit -> t

  val getConnections : t -> (unit -> unit) -> t

  module ListenOptions : sig
    type t

    val t_of_js : Ojs.t -> t

    val t_to_js : t -> Ojs.t

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
  end

  val listen : t -> t -> t

  val listening : t -> bool

  val maxConnections : t -> int

  val ref : t -> t

  val unref : t -> t

  module Options : sig
    type t

    val t_of_js : Ojs.t -> t

    val t_to_js : t -> Ojs.t

    val fd : t -> int

    val allowHalfOpen : t -> bool

    val readable : t -> bool

    val writable : t -> bool
  end

  val create : ?options:t -> ?connectionListener:(t -> unit) -> unit -> t
end

module ConnectOptions : sig
  module OnReadOptions : sig
    type t

    val t_of_js : Ojs.t -> t

    val t_to_js : t -> Ojs.t

    val create
      :  ?buffer:Buffer.Buffer.t
      -> ?callback:(int -> Buffer.Buffer.t -> unit)
      -> unit
      -> t
  end

  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

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
    -> ?onread:t
    -> unit
    -> t
end

val connect
  :  ConnectOptions.t
  -> ?connectionListener:(Buffer.Buffer.t -> unit)
  -> unit
  -> Socket.t

val createConnection
  :  ConnectOptions.t
  -> ?connectionListener:(Buffer.Buffer.t -> unit)
  -> unit
  -> Socket.t

module CreateServerOptions : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val allowHalfOpen : t -> bool

  val pauseOnConnect : t -> bool
end

val createServer
  :  Server.Options.t
  -> ?connectionListener:(Socket.t -> unit)
  -> unit
  -> Server.t

val isIP : string -> bool

val isIPv4 : string -> bool

val isIPv6 : string -> bool
