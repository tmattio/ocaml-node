open Js

[@@@js.scope Import.https]

module Agent : sig
  include module type of struct
    include Http.Agent
  end

  module Options : sig
    type t

    val t_to_js : t -> Ojs.t

    val t_of_js : Ojs.t -> t

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

  [@@@js.stop]

  val on
    :  t
    -> [< `Keylog of Buffer.Buffer.t -> Tls.TLSSocket.t -> unit ]
    -> unit

  [@@@js.start]

  [@@@js.implem
  val on : t -> string -> Ojs.t -> unit [@@js.call]

  let on t = function
    | `Keylog f ->
      on t "keylog" @@ [%js.of: Buffer.Buffer.t -> Tls.TLSSocket.t -> unit] f]
end

module Server : sig
  include module type of struct
    include Http.Server
  end
end

val createServer
  :  ?options:Tls.CreateServerOptions.t
  -> ?requestListener:(Http.IncomingMessage.t -> Http.ServerResponse.t -> unit)
  -> unit
  -> unit
  [@@js.global "http.createServer"]

module RequestOptions : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

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
  [@@js.global "get"]

val globalAgent : Agent.t [@@js.global "globalAgent"]

val request
  :  string
  -> ?options:RequestOptions.t
  -> ?callback:(Http.IncomingMessage.t -> unit)
  -> unit
  -> Http.ClientRequest.t
  [@@js.global "request"]
