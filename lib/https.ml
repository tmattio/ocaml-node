open Import

module Agent = struct
  include Http.Agent

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
      -> ?maxCachedSessions:int
      -> ?servername:string
      -> unit
      -> t
      [@@js.builder]
  end

  val create : ?options:Options.t -> unit -> t [@@js.builder]

  val on : t -> string -> Ojs.t -> unit [@@js.call]

  let on t = function
    | `Keylog f ->
      on t "keylog" @@ [%js.of: Buffer.Buffer.t -> Tls.TLSSocket.t -> unit] f
end

module Server = struct
  include Http.Server
end

val createServer
  :  ?options:Tls.CreateServerOptions.t
  -> ?requestListener:(Http.IncomingMessage.t -> Http.ServerResponse.t -> unit)
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
    -> ?signal:Global.AbortSignal.t
    -> unit
    -> t
    [@@js.builder]
end

val get
  :  string
  -> ?options:RequestOptions.t
  -> ?callback:(Http.IncomingMessage.t -> unit)
  -> unit
  -> Http.ClientRequest.t
  [@@js.global "https.get"]

val globalAgent : Agent.t [@@js.global "https.globalAgent"]

val request
  :  string
  -> ?options:RequestOptions.t
  -> ?callback:(Http.IncomingMessage.t -> unit)
  -> unit
  -> Http.ClientRequest.t
  [@@js.global "https.request"]
