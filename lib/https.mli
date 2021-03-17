open Import

module Agent : sig
  include module type of Http.Agent

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
      -> ?maxCachedSessions:int
      -> ?servername:string
      -> unit
      -> t
  end

  val create : ?options:Options.t -> unit -> t

  val on
    :  t
    -> [< `Keylog of Buffer.Buffer.t -> Tls.TLSSocket.t -> unit ]
    -> unit
end

module Server : sig
  include module type of Http.Server
end

val createServer
  :  ?options:Tls.CreateServerOptions.t
  -> ?requestListener:(Http.IncomingMessage.t -> Http.ServerResponse.t -> unit)
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
  -> ?callback:(Http.IncomingMessage.t -> unit)
  -> unit
  -> Http.ClientRequest.t

val globalAgent : Agent.t

val request
  :  string
  -> ?options:RequestOptions.t
  -> ?callback:(Http.IncomingMessage.t -> unit)
  -> unit
  -> Http.ClientRequest.t
