open Import

module IncomingMessage = struct
  include Stream.Readable

  val aborted : t -> bool [@@js.get]

  val complete : t -> bool [@@js.get]

  val destroy : t -> unit [@@js.call]

  val headers : t -> string Dict.t [@@js.get]

  val httpVersion : t -> string [@@js.get]

  val method_ : t -> string [@@js.get "method"]

  val rawHeaders : t -> string list [@@js.get]

  val rawTrailers : t -> string list [@@js.get]

  val setTimeout : int -> t [@@js.call]

  val socket : t -> Stream.Duplex.t [@@js.get]
end

module ClientRequest = struct
  type t = private Ojs.t [@@js]

  module Info = struct
    type t = private Ojs.t [@@js]

    val httpVersion : t -> string [@@js.get]

    val httpVersionMajor : t -> int [@@js.get]

    val httpVersionMinor : t -> int [@@js.get]

    val statusCode : t -> int [@@js.get]

    val statusMessage : t -> string [@@js.get]

    val headers : t -> string Dict.t [@@js.get]

    val rawHeaders : t -> string list [@@js.get]
  end

  val on : t -> string -> Ojs.t -> unit [@@js.call]

  let on t = function
    | `Abort f ->
      on t "abort" @@ [%js.of: unit -> unit] f
    | `Connect f ->
      on t "connect"
      @@ [%js.of: IncomingMessage.t -> Stream.Duplex.t -> Buffer.t -> unit] f
    | `Continue f ->
      on t "continue" @@ [%js.of: unit -> unit] f
    | `Information f ->
      on t "information" @@ [%js.of: Info.t -> unit] f
    | `Response f ->
      on t "response" @@ [%js.of: IncomingMessage.t -> unit] f
    | `Socket f ->
      on t "socket" @@ [%js.of: Stream.Duplex.t -> unit] f
    | `Timeout f ->
      on t "timeout" @@ [%js.of: unit -> unit] f
    | `Upgrade f ->
      on t "upgrade"
      @@ [%js.of: IncomingMessage.t -> Stream.Duplex.t -> Buffer.t -> unit] f

  val aborted : t -> bool [@@js.get]

  val end_
    :  t
    -> ?data:([ `String of string | `Buffer of Buffer.t ][@js.union])
    -> ?encoding:string
    -> ?callback:(unit -> unit)
    -> unit
    -> t
    [@@js.call "end"]

  val destroy : t -> ?error:Error.t -> unit -> t [@@js.call]

  val destroyed : t -> bool [@@js.get]

  val flushHeaders : t -> unit [@@js.call]

  val getHeader : t -> string -> Ojs.t [@@js.call]

  val maxHeadersCount : t -> int [@@js.get]

  val path : t -> string [@@js.get]

  val method_ : t -> string [@@js.get "method"]

  val host : t -> string [@@js.get]

  val protocol : t -> string [@@js.get]

  val removeHeader : t -> string -> unit [@@js.call]

  val reusedSocket : t -> bool [@@js.get]

  val setHeader : t -> string -> Ojs.t -> unit [@@js.call]

  val setNoDelay : t -> ?noDelay:bool -> unit -> unit [@@js.call]

  val setSocketKeepAlive
    :  t
    -> ?enable:bool
    -> ?initialDelay:int
    -> unit
    -> unit
    [@@js.call]

  val setTimeout : t -> int -> ?callback:(unit -> unit) -> unit -> t [@@js.call]

  val socket : t -> Stream.Duplex.t [@@js.get]

  val writableEnded : t -> bool [@@js.get]

  val writableFinished : t -> bool [@@js.get]

  val write
    :  t
    -> ([ `String of string | `Buffer of Buffer.t ][@js.union])
    -> ?encoding:string
    -> ?callback:(unit -> unit)
    -> unit
    -> bool
    [@@js.call]
end

module Agent = struct
  type t = private Ojs.t [@@js]

  module Options = struct
    type t = private Ojs.t [@@js]

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
      [@@js.builder]
  end

  module CreateConnectionOptions = struct
    module OnReadOptions = struct
      type t = private Ojs.t [@@js]

      val create
        :  ?buffer:Buffer.t
        -> ?callback:(int -> Buffer.t -> unit)
        -> unit
        -> t
        [@@js.builder]
    end

    type t = private Ojs.t [@@js]

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
      [@@js.builder]
  end

  val createConnection : t -> CreateConnectionOptions.t -> Stream.Duplex.t
    [@@js.call]

  val keepSocketAlive : t -> Stream.Duplex.t -> unit [@@js.call]

  val reuseSocket : t -> Stream.Duplex.t -> ClientRequest.t -> unit [@@js.call]

  val destroy : t -> unit [@@js.call]

  val freeSockets : t -> Stream.Duplex.t list [@@js.get]

  module GetNameOptions = struct
    type t = private Ojs.t [@@js]

    val create
      :  ?host:string
      -> ?port:int
      -> ?localAddress:string
      -> ?family:int
      -> unit
      -> t
      [@@js.builder]
  end

  val getName : t -> GetNameOptions.t -> string [@@js.call]

  val maxFreeSockets : t -> int [@@js.get]

  val maxSockets : t -> int [@@js.get]

  val maxTotalSockets : t -> int [@@js.get]

  val requests : t -> ClientRequest.t list [@@js.get]

  val sockets : t -> Stream.Duplex.t list [@@js.get]

  val create : ?options:Options.t -> unit -> t [@@js.builder]
end

module ServerResponse = struct
  type t = private Ojs.t [@@js]

  val on : t -> string -> Ojs.t -> unit [@@js.call]

  let on t = function
    | `Close f ->
      on t "close" @@ [%js.of: unit -> unit] f
    | `Finish f ->
      on t "finish" @@ [%js.of: unit -> unit] f

  val addTrailers : t -> string Dict.t [@@js.get]

  val cork : t -> unit [@@js.call]

  val end_
    :  t
    -> ?data:([ `String of string | `Buffer of Buffer.t ][@js.union])
    -> ?encoding:string
    -> ?callback:(unit -> unit)
    -> unit
    -> t
    [@@js.call "end"]

  val finished : t -> bool [@@js.get]

  val flushHeaders : t -> unit [@@js.call]

  val getHeader : t -> string -> Ojs.t [@@js.call]

  val getHeaderNames : t -> string list [@@js.get]

  val getHeaders : t -> Ojs.t Dict.t [@@js.get]

  val hasHeader : t -> string -> bool [@@js.call]

  val headersSent : t -> bool [@@js.get]

  val removeHeader : t -> string -> unit [@@js.call]

  val req : t -> IncomingMessage.t [@@js.get]

  val sendDate : t -> bool [@@js.get]

  val setHeader : t -> string -> Ojs.t -> t [@@js.call]

  val setTimeout : t -> int -> ?callback:(unit -> unit) -> unit -> t [@@js.call]

  val socket : t -> Stream.Duplex.t [@@js.get]

  val statusCode : t -> int [@@js.get]

  val statusMessage : t -> string [@@js.get]

  val uncork : t -> unit [@@js.call]

  val writableEnded : t -> bool [@@js.get]

  val writableFinished : t -> bool [@@js.get]

  val write
    :  t
    -> ([ `String of string | `Buffer of Buffer.t ][@js.union])
    -> ?encoding:string
    -> ?callback:(unit -> unit)
    -> unit
    -> bool
    [@@js.call]

  val writeContinue : t -> unit [@@js.call]

  val writeHead
    :  t
    -> statusCode:int
    -> ?statusMessage:string
    -> ?headers:Ojs.t Dict.t
    -> unit
    -> t
    [@@js.call]

  val writeProcessing : t -> unit [@@js.call]
end

module Server = struct
  type t = private Ojs.t [@@js]

  val on : t -> string -> Ojs.t -> unit [@@js.call]

  let on t = function
    | `CheckContinue f ->
      on t "checkContinue"
      @@ [%js.of: IncomingMessage.t -> ServerResponse.t -> unit] f
    | `CheckExpectation f ->
      on t "checkExpectation"
      @@ [%js.of: IncomingMessage.t -> ServerResponse.t -> unit] f
    | `ClientError f ->
      on t "clientError" @@ [%js.of: Error.t -> Stream.Duplex.t -> unit] f
    | `Close f ->
      on t "close" @@ [%js.of: unit -> unit] f
    | `Connect f ->
      on t "connect"
      @@ [%js.of: IncomingMessage.t -> Stream.Duplex.t -> Buffer.t -> unit] f
    | `Connection f ->
      on t "connection" @@ [%js.of: Stream.Duplex.t -> unit] f
    | `Request f ->
      on t "request"
      @@ [%js.of: IncomingMessage.t -> ServerResponse.t -> unit] f
    | `Upgrade f ->
      on t "upgrade"
      @@ [%js.of: IncomingMessage.t -> Stream.Duplex.t -> Buffer.t -> unit] f

  val close : t -> ?callback:(unit -> unit) -> unit -> unit [@@js.call]

  val headersTimeout : t -> int [@@js.get]

  val listen : t -> unit [@@js.call]

  val listening : t -> bool [@@js.get]

  val maxHeadersCount : t -> int [@@js.get]

  val requestTimeout : t -> int [@@js.get]

  val setTimeout : t -> int -> ?callback:(unit -> unit) -> unit -> unit
    [@@js.call]

  val timeout : t -> int [@@js.get]

  val keepAliveTimeout : t -> int [@@js.get]
end

val methods : string list [@@js.global "http.METHODS"]

(* val status_code : string IntDict.t [@@js.global "http.STATUS_CODES"] *)

module CreateServerOptions = struct
  type t = private Ojs.t [@@js]

  val create : ?insecureHTTPParser:bool -> ?maxHeaderSize:int -> unit -> t
    [@@js.builder]
end

val createServer
  :  ?options:CreateServerOptions.t
  -> ?requestListener:(IncomingMessage.t -> ServerResponse.t -> unit)
  -> unit
  -> unit
  [@@js.global "http.createServer"]

module RequestOptions = struct
  type t = private Ojs.t [@@js]

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
    -> ?signal:AbortSignal.t
    -> unit
    -> t
    [@@js.builder]
end

val get
  :  string
  -> ?options:RequestOptions.t
  -> ?callback:(IncomingMessage.t -> unit)
  -> unit
  -> ClientRequest.t
  [@@js.global "http.get"]

val globalAgent : Agent.t [@@js.global "http.globalAgent"]

val maxHeaderSize : int [@@js.global "http.maxHeaderSize"]

val request
  :  string
  -> ?options:RequestOptions.t
  -> ?callback:(IncomingMessage.t -> unit)
  -> unit
  -> ClientRequest.t
  [@@js.global "http.request"]

val validateHeaderName : string -> unit [@@js.global "http.validateHeaderName"]

val validateHeaderValue : string -> Ojs.t -> unit
  [@@js.global "http.validateHeaderValue"]
