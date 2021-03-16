open Import

module SecureContext = struct
  type t = private Ojs.t [@@js]
end

module TLSSocket = struct
  type t = private Ojs.t [@@js]

  val on : t -> string -> Ojs.t -> unit [@@js.call]

  let on t = function
    | `Keylog f ->
      on t "keylog" @@ [%js.of: Buffer.t -> unit] f
    | `OCSPResponse f ->
      on t "OCSPResponse" @@ [%js.of: Buffer.t -> unit] f
    | `SecureConnect f ->
      on t "secureConnect" @@ [%js.of: unit -> unit] f
    | `Session f ->
      on t "session" @@ [%js.of: Buffer.t -> unit] f

  module Certificate = Certificate

  module Cipher = struct
    type t = private Ojs.t [@@js]

    val name : t -> string [@@js.get]

    val standardName : t -> string [@@js.get]

    val version : t -> string [@@js.get]
  end

  module EphemeralKeyInfo = struct
    type t = private Ojs.t [@@js]

    val type_ : t -> string [@@js.get "type"]

    val name : t -> string [@@js.get]

    val size : t -> string [@@js.get]
  end

  val address : t -> Address.t [@@js.get]

  val authorizationError : t -> Error.t [@@js.get]

  val authorized : t -> bool [@@js.get]

  val disableRenegotiation : t -> unit [@@js.call]

  val enableTrace : t -> unit [@@js.call]

  val encrypted : t -> bool [@@js.get]

  val exportKeyingMaterial : t -> int -> string -> Buffer.t -> Buffer.t
    [@@js.call]

  val getCertificate : t -> Certificate.t [@@js.get]

  val getCipher : t -> Cipher.t [@@js.get]

  val getEphemeralKeyInfo : t -> EphemeralKeyInfo.t [@@js.get]

  val getFinished : t -> Buffer.t or_undefined [@@js.get]

  val getPeerCertificate : t -> ?detailed:bool -> unit -> Certificate.t
    [@@js.call]

  val getPeerFinished : t -> Buffer.t or_undefined [@@js.get]

  val getPeerX509Certificate : t -> Crypto.X509Certificate.t [@@js.get]

  val getProtocol : t -> string or_undefined [@@js.get]

  val getSession : t -> Buffer.t [@@js.get]

  (* TODO: Not sure of the return type here *)
  val getSharedSigalgs : t -> string list [@@js.get]

  val getTLSTicket : t -> Buffer.t [@@js.get]

  val getX509Certificate : t -> Crypto.X509Certificate.t [@@js.get]

  val isSessionReused : t -> bool [@@js.get]

  val localAddress : t -> string [@@js.get]

  val localPort : t -> int [@@js.get]

  val remoteAddress : t -> string [@@js.get]

  val remoteFamily : t -> string [@@js.get]

  val remotePort : t -> int [@@js.get]

  module RenegotiateOptions = struct
    type t = private Ojs.t [@@js]

    val rejectUnauthorized : t -> bool [@@js.get]

    (* TODO: Not sure about the return type here, maybe it's a
       Crypto.X509Certificate.t *)
    val requestCert : t -> Certificate.t [@@js.get]
  end

  val renegotiate : t -> ?options:RenegotiateOptions.t -> (unit -> unit) -> unit
    [@@js.call]

  val setMaxSendFragment : t -> int -> bool [@@js.call]

  module Options = struct
    type t = private Ojs.t [@@js]

    val create
      :  ?enableTrace:bool
      -> ?isServer:bool
      -> ?server:Net.Server.t
      -> ?requestCert:bool
      -> ?rejectUnauthorized:bool
      -> ?alpnprotocols:
           ([ `Strings of string list
            | `Buffer of Buffer.t
            | `Buffers of Buffer.t list
            ][@js.union])
      -> ?snicallback:
           (string -> (Error.t -> SecureContext.t or_undefined -> unit) -> unit)
      -> ?session:Buffer.t
      -> ?requestOCSP:bool
      -> ?secureContext:SecureContext.t
      -> ?ca:
           ([ `String of string
            | `Strings of string list
            | `Buffer of Buffer.t
            | `Buffers of Buffer.t list
            ][@js.union])
      -> ?cert:
           ([ `String of string
            | `Strings of string list
            | `Buffer of Buffer.t
            | `Buffers of Buffer.t list
            ][@js.union])
      -> ?sigalgs:string
      -> ?ciphers:string
      -> ?clientCertEngine:string
      -> ?crl:
           ([ `String of string
            | `Strings of string list
            | `Buffer of Buffer.t
            | `Buffers of Buffer.t list
            ][@js.union])
      -> ?dhparam:string
      -> ?ecdhCurve:string
      -> ?honorCipherOrder:bool
      -> ?key:
           ([ `String of string
            | `Strings of string list
            | `Buffer of Buffer.t
            | `Buffers of Buffer.t list
            ][@js.union])
      -> ?privateKeyEngine:string
      -> ?privateKeyIdentifier:string
      -> ?maxVersion:string
      -> ?minVersion:string
      -> ?passphrase:string
      -> ?pfx:
           ([ `String of string
            | `Strings of string list
            | `Buffer of Buffer.t
            | `Buffers of Buffer.t list
            ][@js.union])
      -> ?secureOptions:int
      -> ?secureProtocol:string
      -> ?sessionIdContext:string
      -> ?ticketKeys:Buffer.t
      -> ?sessionTimeout:int
      -> unit
      -> t
      [@@js.builder]
  end

  val create
    :  socket:([ `Socket of Net.Socket.t | `Stream of Stream.Duplex.t ]
         [@js.union])
    -> ?options:Options.t
    -> unit
    -> t
    [@@js.builder]
end

module CreateSecureContextOptions = struct
  type t = private Ojs.t [@@js]

  val ca
    :  t
    -> (* TODO: [ `String of string | `Strings of string list | `Buffer of
          Buffer.t | `Buffers of Buffer.t list] *)
       Buffer.t or_undefined
    [@@js.get]

  val cert
    :  t
    -> (* TODO: [ `String of string | `Strings of string list | `Buffer of
          Buffer.t | `Buffers of Buffer.t list] *)
       Buffer.t or_undefined
    [@@js.get]

  val sigalgs : t -> string or_undefined [@@js.get]

  val ciphers : t -> string or_undefined [@@js.get]

  val clientCertEngine : t -> string or_undefined [@@js.get]

  val crl
    :  t
    -> (* TODO: [ `String of string | `Strings of string list | `Buffer of
          Buffer.t | `Buffers of Buffer.t list] *)
       Buffer.t or_undefined
    [@@js.get]

  val dhparam : t -> string or_undefined [@@js.get]

  val ecdhCurve : t -> string or_undefined [@@js.get]

  val honorCipherOrder : t -> bool or_undefined [@@js.get]

  val key
    :  t
    -> (* TODO: [ `String of string | `Strings of string list | `Buffer of
          Buffer.t | `Buffers of Buffer.t list] *)
       Buffer.t or_undefined
    [@@js.get]

  val privateKeyEngine : t -> string or_undefined [@@js.get]

  val privateKeyIdentifier : t -> string or_undefined [@@js.get]

  val maxVersion : t -> string or_undefined [@@js.get]

  val minVersion : t -> string or_undefined [@@js.get]

  val passphrase : t -> string or_undefined [@@js.get]

  val pfx
    :  t
    -> (* TODO: [ `String of string | `Strings of string list | `Buffer of
          Buffer.t | `Buffers of Buffer.t list] *)
       Buffer.t or_undefined
    [@@js.get]

  val secureOptions : t -> int or_undefined [@@js.get]

  val secureProtocol : t -> string or_undefined [@@js.get]

  val sessionIdContext : t -> string or_undefined [@@js.get]

  val ticketKeys : t -> Buffer.t or_undefined [@@js.get]

  val sessionTimeout : t -> int or_undefined [@@js.get]

  val create
    :  ?ca:
         ([ `String of string
          | `Strings of string list
          | `Buffer of Buffer.t
          | `Buffers of Buffer.t list
          ][@js.union])
    -> ?cert:
         ([ `String of string
          | `Strings of string list
          | `Buffer of Buffer.t
          | `Buffers of Buffer.t list
          ][@js.union])
    -> ?sigalgs:string
    -> ?ciphers:string
    -> ?clientCertEngine:string
    -> ?crl:
         ([ `String of string
          | `Strings of string list
          | `Buffer of Buffer.t
          | `Buffers of Buffer.t list
          ][@js.union])
    -> ?dhparam:string
    -> ?ecdhCurve:string
    -> ?honorCipherOrder:bool
    -> ?key:
         ([ `String of string
          | `Strings of string list
          | `Buffer of Buffer.t
          | `Buffers of Buffer.t list
          ][@js.union])
    -> ?privateKeyEngine:string
    -> ?privateKeyIdentifier:string
    -> ?maxVersion:string
    -> ?minVersion:string
    -> ?passphrase:string
    -> ?pfx:
         ([ `String of string
          | `Strings of string list
          | `Buffer of Buffer.t
          | `Buffers of Buffer.t list
          ][@js.union])
    -> ?secureOptions:int
    -> ?secureProtocol:string
    -> ?sessionIdContext:string
    -> ?ticketKeys:Buffer.t
    -> ?sessionTimeout:int
    -> unit
    -> t
    [@@js.builder]
end

module Server = struct
  include Net.Server

  val on : t -> string -> Ojs.t -> unit [@@js.call]

  let on t = function
    | `Connection f ->
      on t "connection" @@ [%js.of: Stream.Duplex.t -> unit] f
    | `Keylog f ->
      on t "keylog" @@ [%js.of: Buffer.t -> TLSSocket.t -> unit] f
    | `NewSession f ->
      on t "newSession"
      @@ [%js.of: Buffer.t -> Buffer.t -> (unit -> unit) -> unit] f
    | `OCSPRequest f ->
      on t "OCSPRequest"
      @@ [%js.of:
           Buffer.t -> Buffer.t -> (Error.t or_undefined -> Buffer.t) -> unit]
           f
    | `ResumeSession f ->
      on t "resumeSession"
      @@ [%js.of: Buffer.t -> (Error.t or_undefined -> Buffer.t) -> unit] f
    | `SecureConnection f ->
      on t "secureConnection" @@ [%js.of: TLSSocket.t -> unit] f
    | `TlsClientError f ->
      on t "tlsClientError" @@ [%js.of: Error.t -> TLSSocket.t -> unit] f
    | `Close f ->
      on t "close" @@ [%js.of: unit -> unit] f
    | `Error f ->
      on t "error" @@ [%js.of: Error.t -> unit] f
    | `Listening f ->
      on t "listening" @@ [%js.of: unit -> unit] f

  val addContext : t -> string -> CreateSecureContextOptions.t -> unit
    [@@js.call]

  val address : t -> Address.t [@@js.get]

  val close : t -> ?callback:(unit -> unit) -> unit -> t [@@js.call]

  val getTicketKeys : t -> Buffer.t [@@js.get]

  val listen : t -> unit [@@js.call]

  val setSecureContext
    :  t
    -> ?options:CreateSecureContextOptions.t
    -> unit
    -> unit
    [@@js.call]

  val setTicketKeys : t -> Buffer.t [@@js.get]
end

module CreateServerOptions = struct
  type t = private Ojs.t [@@js]

  val create
    :  ?alpnprotocols:
         ([ `Strings of string list
          | `Buffer of Buffer.t
          | `Buffers of Buffer.t list
          ][@js.union])
    -> ?clientCertEngine:string
    -> ?enableTrace:bool
    -> ?handshakeTimeout:int
    -> ?rejectUnauthorized:bool
    -> ?requestCert:bool
    -> ?sessionTimeout:int
    -> ?snicallback:
         (string -> (Error.t -> SecureContext.t or_undefined -> unit) -> unit)
    -> ?ticketKeys:Buffer.t
    -> ?pskCallback:(TLSSocket.t -> string -> Buffer.t or_undefined)
    -> ?pskIdentityHint:string
    -> ?ca:
         ([ `String of string
          | `Strings of string list
          | `Buffer of Buffer.t
          | `Buffers of Buffer.t list
          ][@js.union])
    -> ?cert:
         ([ `String of string
          | `Strings of string list
          | `Buffer of Buffer.t
          | `Buffers of Buffer.t list
          ][@js.union])
    -> ?sigalgs:string
    -> ?ciphers:string
    -> ?clientCertEngine:string
    -> ?crl:
         ([ `String of string
          | `Strings of string list
          | `Buffer of Buffer.t
          | `Buffers of Buffer.t list
          ][@js.union])
    -> ?dhparam:string
    -> ?ecdhCurve:string
    -> ?honorCipherOrder:bool
    -> ?key:
         ([ `String of string
          | `Strings of string list
          | `Buffer of Buffer.t
          | `Buffers of Buffer.t list
          ][@js.union])
    -> ?privateKeyEngine:string
    -> ?privateKeyIdentifier:string
    -> ?maxVersion:string
    -> ?minVersion:string
    -> ?passphrase:string
    -> ?pfx:
         ([ `String of string
          | `Strings of string list
          | `Buffer of Buffer.t
          | `Buffers of Buffer.t list
          ][@js.union])
    -> ?secureOptions:int
    -> ?secureProtocol:string
    -> ?sessionIdContext:string
    -> ?ticketKeys:Buffer.t
    -> ?sessionTimeout:int
    -> ?insecureHTTPParser:bool
    -> ?maxHeaderSize:int
    -> unit
    -> t
    [@@js.builder]
end

module ConnectOptions = struct
  type t = private Ojs.t [@@js]

  module OnReadOptions = struct
    type t = private Ojs.t [@@js]

    val create
      :  ?buffer:Buffer.t
      -> ?callback:(int -> Buffer.t -> unit)
      -> unit
      -> t
      [@@js.builder]
  end

  val create
    :  ?enableTrace:bool
    -> ?host:string
    -> ?port:int
    -> ?path:string
    -> ?socket:Stream.Duplex.t
    -> ?allowHalfOpen:bool
    -> ?rejectUnauthorized:bool
    -> ?pskCallback:(string -> Buffer.t)
    -> ?alpnprotocols:
         ([ `Strings of string list
          | `Buffer of Buffer.t
          | `Buffers of Buffer.t list
          | `Uint8Array of Uint8Array.t
          ][@js.union])
    -> ?servername:string
    -> ?checkServerIdentity:(string -> Certificate.t -> unit)
    -> ?session:Buffer.t
    -> ?minDHSize:int
    -> ?highWaterMark:int
    -> ?secureContext:SecureContext.t
    -> ?onread:OnReadOptions.t
    -> ?ca:
         ([ `String of string
          | `Strings of string list
          | `Buffer of Buffer.t
          | `Buffers of Buffer.t list
          ][@js.union])
    -> ?cert:
         ([ `String of string
          | `Strings of string list
          | `Buffer of Buffer.t
          | `Buffers of Buffer.t list
          ][@js.union])
    -> ?sigalgs:string
    -> ?ciphers:string
    -> ?clientCertEngine:string
    -> ?crl:
         ([ `String of string
          | `Strings of string list
          | `Buffer of Buffer.t
          | `Buffers of Buffer.t list
          ][@js.union])
    -> ?dhparam:string
    -> ?ecdhCurve:string
    -> ?honorCipherOrder:bool
    -> ?key:
         ([ `String of string
          | `Strings of string list
          | `Buffer of Buffer.t
          | `Buffers of Buffer.t list
          ][@js.union])
    -> ?privateKeyEngine:string
    -> ?privateKeyIdentifier:string
    -> ?maxVersion:string
    -> ?minVersion:string
    -> ?passphrase:string
    -> ?pfx:
         ([ `String of string
          | `Strings of string list
          | `Buffer of Buffer.t
          | `Buffers of Buffer.t list
          ][@js.union])
    -> ?secureOptions:int
    -> ?secureProtocol:string
    -> ?sessionIdContext:string
    -> ?ticketKeys:Buffer.t
    -> ?sessionTimeout:int
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
    -> unit
    -> t
    [@@js.builder]
end

val checkServerIdentity : string -> Certificate.t -> Error.t or_undefined
  [@@js.global "tls.checkServerIdentity"]

val connect : ConnectOptions.t -> ?callback:(unit -> unit) -> unit -> Server.t
  [@@js.global "tls.connect"]

val createSecureContext
  :  ?options:CreateSecureContextOptions.t
  -> unit
  -> SecureContext.t
  [@@js.global "tls.createSecureContext"]

val createServer
  :  ?options:CreateServerOptions.t
  -> ?secureConnectionListener:(unit -> unit)
  -> unit
  -> SecureContext.t
  [@@js.global "tls.createServer"]

val getCiphers : unit -> string list [@@js.global "tls.getCiphers"]

val rootCertificates : string list [@@js.global "tls.rootCertificates"]

val default_ecdh_curve : string [@@js.global "tls.DEFAULT_ECDH_CURVE"]

val default_max_version : string [@@js.global "tls.DEFAULT_MAX_VERSION"]

val default_min_version : string [@@js.global "tls.DEFAULT_MIN_VERSION"]
