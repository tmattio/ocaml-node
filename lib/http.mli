open Import

module IncomingMessage : sig
  include module type of Stream.Readable

  val aborted : t -> bool

  val complete : t -> bool

  val destroy : t -> unit

  val headers : t -> string Dict.t

  val httpVersion : t -> string

  val method_ : t -> string

  val rawHeaders : t -> string list

  val rawTrailers : t -> string list

  val setTimeout : int -> t

  val socket : t -> Stream.Duplex.t
end

module ClientRequest : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  module Info : sig
    type t

    val t_of_js : Ojs.t -> t

    val t_to_js : t -> Ojs.t

    val httpVersion : t -> string

    val httpVersionMajor : t -> int

    val httpVersionMinor : t -> int

    val statusCode : t -> int

    val statusMessage : t -> string

    val headers : t -> string Dict.t

    val rawHeaders : t -> string list
  end

  val on
    :  t
    -> [< `Abort of unit -> unit
       | `Connect of
         IncomingMessage.t -> Stream.Duplex.t -> Buffer.Buffer.t -> unit
       | `Continue of unit -> unit
       | `Information of t -> unit
       | `Response of IncomingMessage.t -> unit
       | `Socket of Stream.Duplex.t -> unit
       | `Timeout of unit -> unit
       | `Upgrade of
         IncomingMessage.t -> Stream.Duplex.t -> Buffer.Buffer.t -> unit
       ]
    -> unit

  val aborted : t -> bool

  val end_
    :  t
    -> ?data:([ `String of string | `Buffer of Buffer.Buffer.t ][@js.union])
    -> ?encoding:string
    -> ?callback:(unit -> unit)
    -> unit
    -> t

  val destroy : t -> ?error:Error.t -> unit -> t

  val destroyed : t -> bool

  val flushHeaders : t -> unit

  val getHeader : t -> string -> Ojs.t

  val maxHeadersCount : t -> int

  val path : t -> string

  val method_ : t -> string

  val host : t -> string

  val protocol : t -> string

  val removeHeader : t -> string -> unit

  val reusedSocket : t -> bool

  val setHeader : t -> string -> Ojs.t -> unit

  val setNoDelay : t -> ?noDelay:bool -> unit -> unit

  val setSocketKeepAlive
    :  t
    -> ?enable:bool
    -> ?initialDelay:int
    -> unit
    -> unit

  val setTimeout : t -> int -> ?callback:(unit -> unit) -> unit -> t

  val socket : t -> Stream.Duplex.t

  val writableEnded : t -> bool

  val writableFinished : t -> bool

  val write
    :  t
    -> ([ `String of string | `Buffer of Buffer.Buffer.t ][@js.union])
    -> ?encoding:string
    -> ?callback:(unit -> unit)
    -> unit
    -> bool
end

module Agent : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  module Options : sig
    type t

    val t_of_js : Ojs.t -> t

    val t_to_js : t -> Ojs.t

    val create
      :  ?keepAlive:bool
      -> ?keepAliveMsecs:int
      -> ?maxSockets:int
      -> ?maxTotalSockets:int
      -> ?maxFreeSockets:int
      -> ?scheduling:string
      -> ?timeout:int
      -> unit
      -> t
  end

  module CreateConnectionOptions : sig
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
           (err:Error.t or_undefined
            -> address:string
            -> family:string or_undefined
            -> host:string
            -> unit)
      -> ?path:string
      -> ?onread:OnReadOptions.t
      -> unit
      -> t
  end

  val createConnection : t -> CreateConnectionOptions.t -> Stream.Duplex.t

  val keepSocketAlive : t -> Stream.Duplex.t -> unit

  val reuseSocket : t -> Stream.Duplex.t -> ClientRequest.t -> unit

  val destroy : t -> unit

  val freeSockets : t -> Stream.Duplex.t list

  module GetNameOptions : sig
    type t

    val t_of_js : Ojs.t -> t

    val t_to_js : t -> Ojs.t

    val create
      :  ?host:string
      -> ?port:int
      -> ?localAddress:string
      -> ?family:int
      -> unit
      -> t
  end

  val getName : t -> GetNameOptions.t -> string

  val maxFreeSockets : t -> int

  val maxSockets : t -> int

  val maxTotalSockets : t -> int

  val requests : t -> ClientRequest.t list

  val sockets : t -> Stream.Duplex.t list

  val create : ?options:Options.t -> unit -> t
end

module ServerResponse : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val on : t -> [< `Close of unit -> unit | `Finish of unit -> unit ] -> unit

  val addTrailers : t -> string Dict.t

  val cork : t -> unit

  val end_
    :  t
    -> ?data:([ `String of string | `Buffer of Buffer.Buffer.t ][@js.union])
    -> ?encoding:string
    -> ?callback:(unit -> unit)
    -> unit
    -> t

  val finished : t -> bool

  val flushHeaders : t -> unit

  val getHeader : t -> string -> Ojs.t

  val getHeaderNames : t -> string list

  val getHeaders : t -> Ojs.t Dict.t

  val hasHeader : t -> string -> bool

  val headersSent : t -> bool

  val removeHeader : t -> string -> unit

  val req : t -> IncomingMessage.t

  val sendDate : t -> bool

  val setHeader : t -> string -> Ojs.t -> t

  val setTimeout : t -> int -> ?callback:(unit -> unit) -> unit -> t

  val socket : t -> Stream.Duplex.t

  val statusCode : t -> int

  val statusMessage : t -> string

  val uncork : t -> unit

  val writableEnded : t -> bool

  val writableFinished : t -> bool

  val write
    :  t
    -> ([ `String of string | `Buffer of Buffer.Buffer.t ][@js.union])
    -> ?encoding:string
    -> ?callback:(unit -> unit)
    -> unit
    -> bool

  val writeContinue : t -> unit

  val writeHead
    :  t
    -> statusCode:int
    -> ?statusMessage:string
    -> ?headers:Ojs.t Dict.t
    -> unit
    -> t

  val writeProcessing : t -> unit
end

module Server : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val on
    :  t
    -> [< `CheckContinue of IncomingMessage.t -> t -> unit
       | `CheckExpectation of IncomingMessage.t -> t -> unit
       | `ClientError of Import.Error.t -> Stream.Duplex.t -> unit
       | `Close of unit -> unit
       | `Connect of
         IncomingMessage.t -> Stream.Duplex.t -> Buffer.Buffer.t -> unit
       | `Connection of Stream.Duplex.t -> unit
       | `Request of IncomingMessage.t -> t -> unit
       | `Upgrade of
         IncomingMessage.t -> Stream.Duplex.t -> Buffer.Buffer.t -> unit
       ]
    -> unit

  val close : t -> ?callback:(unit -> unit) -> unit -> unit

  val headersTimeout : t -> int

  val listen : t -> unit

  val listening : t -> bool

  val maxHeadersCount : t -> int

  val requestTimeout : t -> int

  val setTimeout : t -> int -> ?callback:(unit -> unit) -> unit -> unit

  val timeout : t -> int

  val keepAliveTimeout : t -> int
end

val methods : string list

module CreateServerOptions : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val create : ?insecureHTTPParser:bool -> ?maxHeaderSize:int -> unit -> t
end

val createServer
  :  ?options:CreateServerOptions.t
  -> ?requestListener:(IncomingMessage.t -> ServerResponse.t -> unit)
  -> unit
  -> unit

module RequestOptions : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val create
    :  ?agent:Agent.t
    -> ?auth:string
    -> ?createConnection:(unit -> Stream.Duplex.t)
    -> ?defaultPort:int
    -> ?family:int
    -> ?headers:string Dict.t
    -> ?host:string
    -> ?hostname:string
    -> ?insecureHTTPParser:bool
    -> ?localAddress:string
    -> ?lookup:
         (string
          -> ?options:Dns.LookupOptions.t
          -> ?callback:(Error.t -> string -> int -> unit)
          -> unit)
    -> ?maxHeaderSize:int
    -> ?method_:string
    -> ?path:string
    -> ?port:int
    -> ?protocol:string
    -> ?setHost:bool
    -> ?socketPath:string
    -> ?timeout:int
    -> ?signal:Global.AbortSignal.t
    -> unit
    -> t
end

val get
  :  string
  -> ?options:RequestOptions.t
  -> ?callback:(IncomingMessage.t -> unit)
  -> unit
  -> ClientRequest.t

val globalAgent : Agent.t

val maxHeaderSize : int

val request
  :  string
  -> ?options:RequestOptions.t
  -> ?callback:(IncomingMessage.t -> unit)
  -> unit
  -> ClientRequest.t

val validateHeaderName : string -> unit

val validateHeaderValue : string -> Ojs.t -> unit
