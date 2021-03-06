open Js

[@@@js.scope Import.tls]

module SecureContext : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t
end

module TLSSocket : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  [@@@js.stop]

  val on
    :  t
    -> [< `Keylog of Buffer.Buffer.t -> unit
       | `OCSPResponse of Buffer.Buffer.t -> unit
       | `SecureConnect of unit -> unit
       | `Session of Buffer.Buffer.t -> unit
       ]
    -> unit

  [@@@js.start]

  [@@@js.implem
  val on : t -> string -> Ojs.t -> unit [@@js.call]

  let on t = function
    | `Keylog f ->
      on t "keylog" @@ [%js.of: Buffer.Buffer.t -> unit] f
    | `OCSPResponse f ->
      on t "OCSPResponse" @@ [%js.of: Buffer.Buffer.t -> unit] f
    | `SecureConnect f ->
      on t "secureConnect" @@ [%js.of: unit -> unit] f
    | `Session f ->
      on t "session" @@ [%js.of: Buffer.Buffer.t -> unit] f]

  module Certificate : sig
    include module type of Global.Certificate
  end

  module Cipher : sig
    type t

    val t_to_js : t -> Ojs.t

    val t_of_js : Ojs.t -> t

    val name : t -> string [@@js.get]

    val standardName : t -> string [@@js.get]

    val version : t -> string [@@js.get]
  end

  module EphemeralKeyInfo : sig
    type t

    val t_to_js : t -> Ojs.t

    val t_of_js : Ojs.t -> t

    val type_ : t -> string [@@js.get "type"]

    val name : t -> string [@@js.get]

    val size : t -> string [@@js.get]
  end

  val address : t -> Global.Address.t [@@js.get]

  val authorizationError : t -> Error.t [@@js.get]

  val authorized : t -> bool [@@js.get]

  val disableRenegotiation : t -> unit [@@js.call]

  val enableTrace : t -> unit [@@js.call]

  val encrypted : t -> bool [@@js.get]

  val exportKeyingMaterial
    :  t
    -> int
    -> string
    -> Buffer.Buffer.t
    -> Buffer.Buffer.t
    [@@js.call]

  val getCertificate : t -> Global.Certificate.t [@@js.get]

  val getCipher : t -> Cipher.t [@@js.get]

  val getEphemeralKeyInfo : t -> EphemeralKeyInfo.t [@@js.get]

  val getFinished : t -> Buffer.Buffer.t option [@@js.get]

  val getPeerCertificate : t -> ?detailed:bool -> unit -> Global.Certificate.t
    [@@js.call]

  val getPeerFinished : t -> Buffer.Buffer.t option [@@js.get]

  val getPeerX509Certificate : t -> Crypto.X509Certificate.t [@@js.get]

  val getProtocol : t -> string option [@@js.get]

  val getSession : t -> Buffer.Buffer.t [@@js.get]

  (* TODO: Not sure of the return type here *)
  val getSharedSigalgs : t -> string list [@@js.get]

  val getTLSTicket : t -> Buffer.Buffer.t [@@js.get]

  val getX509Certificate : t -> Crypto.X509Certificate.t [@@js.get]

  val isSessionReused : t -> bool [@@js.get]

  val localAddress : t -> string [@@js.get]

  val localPort : t -> int [@@js.get]

  val remoteAddress : t -> string [@@js.get]

  val remoteFamily : t -> string [@@js.get]

  val remotePort : t -> int [@@js.get]

  module RenegotiateOptions : sig
    type t

    val t_to_js : t -> Ojs.t

    val t_of_js : Ojs.t -> t

    val rejectUnauthorized : t -> bool [@@js.get]

    (* TODO: Not sure about the return type here, maybe it's a
       Crypto.X509Certificate.t *)
    val requestCert : t -> Global.Certificate.t [@@js.get]
  end

  val renegotiate : t -> ?options:RenegotiateOptions.t -> (unit -> unit) -> unit
    [@@js.call]

  val setMaxSendFragment : t -> int -> bool [@@js.call]

  module Options : sig
    type t

    val t_to_js : t -> Ojs.t

    val t_of_js : Ojs.t -> t

    val create
      :  ?enableTrace:bool
      -> ?isServer:bool
      -> ?server:Net.Server.t
      -> ?requestCert:bool
      -> ?rejectUnauthorized:bool
      -> ?alpnprotocols:
           ([ `Strings of string list
            | `Buffer of Buffer.Buffer.t
            | `Buffers of Buffer.Buffer.t list
            ]
           [@js.union])
      -> ?snicallback:
           (string -> (Error.t -> SecureContext.t option -> unit) -> unit)
      -> ?session:Buffer.Buffer.t
      -> ?requestOCSP:bool
      -> ?secureContext:SecureContext.t
      -> ?ca:
           ([ `String of string
            | `Strings of string list
            | `Buffer of Buffer.Buffer.t
            | `Buffers of Buffer.Buffer.t list
            ]
           [@js.union])
      -> ?cert:
           ([ `String of string
            | `Strings of string list
            | `Buffer of Buffer.Buffer.t
            | `Buffers of Buffer.Buffer.t list
            ]
           [@js.union])
      -> ?sigalgs:string
      -> ?ciphers:string
      -> ?clientCertEngine:string
      -> ?crl:
           ([ `String of string
            | `Strings of string list
            | `Buffer of Buffer.Buffer.t
            | `Buffers of Buffer.Buffer.t list
            ]
           [@js.union])
      -> ?dhparam:string
      -> ?ecdhCurve:string
      -> ?honorCipherOrder:bool
      -> ?key:
           ([ `String of string
            | `Strings of string list
            | `Buffer of Buffer.Buffer.t
            | `Buffers of Buffer.Buffer.t list
            ]
           [@js.union])
      -> ?privateKeyEngine:string
      -> ?privateKeyIdentifier:string
      -> ?maxVersion:string
      -> ?minVersion:string
      -> ?passphrase:string
      -> ?pfx:
           ([ `String of string
            | `Strings of string list
            | `Buffer of Buffer.Buffer.t
            | `Buffers of Buffer.Buffer.t list
            ]
           [@js.union])
      -> ?secureOptions:int
      -> ?secureProtocol:string
      -> ?sessionIdContext:string
      -> ?ticketKeys:Buffer.Buffer.t
      -> ?sessionTimeout:int
      -> unit
      -> t
      [@@js.builder]
  end

  val create
    :  socket:
         ([ `Socket of Net.Socket.t | `Stream of Stream.Duplex.t ][@js.union])
    -> ?options:Options.t
    -> unit
    -> t
    [@@js.builder]
end

module CreateSecureContextOptions : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  val ca
    :  t
    -> (* TODO: [ `String of string | `Strings of string list | `Buffer of
          Buffer.Buffer.t | `Buffers of Buffer.Buffer.t list] *)
       Buffer.Buffer.t option
    [@@js.get]

  val cert
    :  t
    -> (* TODO: [ `String of string | `Strings of string list | `Buffer of
          Buffer.Buffer.t | `Buffers of Buffer.Buffer.t list] *)
       Buffer.Buffer.t option
    [@@js.get]

  val sigalgs : t -> string option [@@js.get]

  val ciphers : t -> string option [@@js.get]

  val clientCertEngine : t -> string option [@@js.get]

  val crl
    :  t
    -> (* TODO: [ `String of string | `Strings of string list | `Buffer of
          Buffer.Buffer.t | `Buffers of Buffer.Buffer.t list] *)
       Buffer.Buffer.t option
    [@@js.get]

  val dhparam : t -> string option [@@js.get]

  val ecdhCurve : t -> string option [@@js.get]

  val honorCipherOrder : t -> bool option [@@js.get]

  val key
    :  t
    -> (* TODO: [ `String of string | `Strings of string list | `Buffer of
          Buffer.Buffer.t | `Buffers of Buffer.Buffer.t list] *)
       Buffer.Buffer.t option
    [@@js.get]

  val privateKeyEngine : t -> string option [@@js.get]

  val privateKeyIdentifier : t -> string option [@@js.get]

  val maxVersion : t -> string option [@@js.get]

  val minVersion : t -> string option [@@js.get]

  val passphrase : t -> string option [@@js.get]

  val pfx
    :  t
    -> (* TODO: [ `String of string | `Strings of string list | `Buffer of
          Buffer.Buffer.t | `Buffers of Buffer.Buffer.t list] *)
       Buffer.Buffer.t option
    [@@js.get]

  val secureOptions : t -> int option [@@js.get]

  val secureProtocol : t -> string option [@@js.get]

  val sessionIdContext : t -> string option [@@js.get]

  val ticketKeys : t -> Buffer.Buffer.t option [@@js.get]

  val sessionTimeout : t -> int option [@@js.get]

  val create
    :  ?ca:
         ([ `String of string
          | `Strings of string list
          | `Buffer of Buffer.Buffer.t
          | `Buffers of Buffer.Buffer.t list
          ]
         [@js.union])
    -> ?cert:
         ([ `String of string
          | `Strings of string list
          | `Buffer of Buffer.Buffer.t
          | `Buffers of Buffer.Buffer.t list
          ]
         [@js.union])
    -> ?sigalgs:string
    -> ?ciphers:string
    -> ?clientCertEngine:string
    -> ?crl:
         ([ `String of string
          | `Strings of string list
          | `Buffer of Buffer.Buffer.t
          | `Buffers of Buffer.Buffer.t list
          ]
         [@js.union])
    -> ?dhparam:string
    -> ?ecdhCurve:string
    -> ?honorCipherOrder:bool
    -> ?key:
         ([ `String of string
          | `Strings of string list
          | `Buffer of Buffer.Buffer.t
          | `Buffers of Buffer.Buffer.t list
          ]
         [@js.union])
    -> ?privateKeyEngine:string
    -> ?privateKeyIdentifier:string
    -> ?maxVersion:string
    -> ?minVersion:string
    -> ?passphrase:string
    -> ?pfx:
         ([ `String of string
          | `Strings of string list
          | `Buffer of Buffer.Buffer.t
          | `Buffers of Buffer.Buffer.t list
          ]
         [@js.union])
    -> ?secureOptions:int
    -> ?secureProtocol:string
    -> ?sessionIdContext:string
    -> ?ticketKeys:Buffer.Buffer.t
    -> ?sessionTimeout:int
    -> unit
    -> t
    [@@js.builder]
end

module Server : sig
  include module type of struct
    include Net.Server
  end

  [@@@js.stop]

  val on
    :  t
    -> [< `Close of unit -> unit
       | `Connection of Stream.Duplex.t -> unit
       | `Error of Js.Error.t -> unit
       | `Keylog of Buffer.Buffer.t -> TLSSocket.t -> unit
       | `Listening of unit -> unit
       | `NewSession of
         Buffer.Buffer.t -> Buffer.Buffer.t -> (unit -> unit) -> unit
       | `OCSPRequest of
         Buffer.Buffer.t
         -> Buffer.Buffer.t
         -> (Js.Error.t option -> Buffer.Buffer.t)
         -> unit
       | `ResumeSession of
         Buffer.Buffer.t -> (Js.Error.t option -> Buffer.Buffer.t) -> unit
       | `SecureConnection of TLSSocket.t -> unit
       | `TlsClientError of Js.Error.t -> TLSSocket.t -> unit
       ]
    -> unit

  [@@@js.start]

  [@@@js.implem
  val on : t -> string -> Ojs.t -> unit [@@js.call]

  let on t = function
    | `Connection f ->
      on t "connection" @@ [%js.of: Stream.Duplex.t -> unit] f
    | `Keylog f ->
      on t "keylog" @@ [%js.of: Buffer.Buffer.t -> TLSSocket.t -> unit] f
    | `NewSession f ->
      on t "newSession"
      @@ [%js.of: Buffer.Buffer.t -> Buffer.Buffer.t -> (unit -> unit) -> unit]
           f
    | `OCSPRequest f ->
      on t "OCSPRequest"
      @@ [%js.of:
           Buffer.Buffer.t
           -> Buffer.Buffer.t
           -> (Error.t option -> Buffer.Buffer.t)
           -> unit]
           f
    | `ResumeSession f ->
      on t "resumeSession"
      @@ [%js.of:
           Buffer.Buffer.t -> (Error.t option -> Buffer.Buffer.t) -> unit]
           f
    | `SecureConnection f ->
      on t "secureConnection" @@ [%js.of: TLSSocket.t -> unit] f
    | `TlsClientError f ->
      on t "tlsClientError" @@ [%js.of: Error.t -> TLSSocket.t -> unit] f
    | `Close f ->
      on t "close" @@ [%js.of: unit -> unit] f
    | `Error f ->
      on t "error" @@ [%js.of: Error.t -> unit] f
    | `Listening f ->
      on t "listening" @@ [%js.of: unit -> unit] f]

  val addContext : t -> string -> CreateSecureContextOptions.t -> unit
    [@@js.call]

  val address : t -> Global.Address.t [@@js.get]

  val close : t -> ?callback:(unit -> unit) -> unit -> t [@@js.call]

  val getTicketKeys : t -> Buffer.Buffer.t [@@js.get]

  val listen : t -> unit [@@js.call]

  val setSecureContext
    :  t
    -> ?options:CreateSecureContextOptions.t
    -> unit
    -> unit
    [@@js.call]

  val setTicketKeys : t -> Buffer.Buffer.t [@@js.get]
end

module CreateServerOptions : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  val create
    :  ?alpnprotocols:
         ([ `Strings of string list
          | `Buffer of Buffer.Buffer.t
          | `Buffers of Buffer.Buffer.t list
          ]
         [@js.union])
    -> ?clientCertEngine:string
    -> ?enableTrace:bool
    -> ?handshakeTimeout:int
    -> ?rejectUnauthorized:bool
    -> ?requestCert:bool
    -> ?sessionTimeout:int
    -> ?snicallback:
         (string -> (Error.t -> SecureContext.t option -> unit) -> unit)
    -> ?ticketKeys:Buffer.Buffer.t
    -> ?pskCallback:(TLSSocket.t -> string -> Buffer.Buffer.t option)
    -> ?pskIdentityHint:string
    -> ?ca:
         ([ `String of string
          | `Strings of string list
          | `Buffer of Buffer.Buffer.t
          | `Buffers of Buffer.Buffer.t list
          ]
         [@js.union])
    -> ?cert:
         ([ `String of string
          | `Strings of string list
          | `Buffer of Buffer.Buffer.t
          | `Buffers of Buffer.Buffer.t list
          ]
         [@js.union])
    -> ?sigalgs:string
    -> ?ciphers:string
    -> ?clientCertEngine:string
    -> ?crl:
         ([ `String of string
          | `Strings of string list
          | `Buffer of Buffer.Buffer.t
          | `Buffers of Buffer.Buffer.t list
          ]
         [@js.union])
    -> ?dhparam:string
    -> ?ecdhCurve:string
    -> ?honorCipherOrder:bool
    -> ?key:
         ([ `String of string
          | `Strings of string list
          | `Buffer of Buffer.Buffer.t
          | `Buffers of Buffer.Buffer.t list
          ]
         [@js.union])
    -> ?privateKeyEngine:string
    -> ?privateKeyIdentifier:string
    -> ?maxVersion:string
    -> ?minVersion:string
    -> ?passphrase:string
    -> ?pfx:
         ([ `String of string
          | `Strings of string list
          | `Buffer of Buffer.Buffer.t
          | `Buffers of Buffer.Buffer.t list
          ]
         [@js.union])
    -> ?secureOptions:int
    -> ?secureProtocol:string
    -> ?sessionIdContext:string
    -> ?ticketKeys:Buffer.Buffer.t
    -> ?sessionTimeout:int
    -> ?insecureHTTPParser:bool
    -> ?maxHeaderSize:int
    -> unit
    -> t
    [@@js.builder]
end

module ConnectOptions : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

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

  val create
    :  ?enableTrace:bool
    -> ?host:string
    -> ?port:int
    -> ?path:string
    -> ?socket:Stream.Duplex.t
    -> ?allowHalfOpen:bool
    -> ?rejectUnauthorized:bool
    -> ?pskCallback:(string -> Buffer.Buffer.t)
    -> ?alpnprotocols:
         ([ `Strings of string list
          | `Buffer of Buffer.Buffer.t
          | `Buffers of Buffer.Buffer.t list
          | `Uint8Array of Uint8Array.t
          ]
         [@js.union])
    -> ?servername:string
    -> ?checkServerIdentity:(string -> Global.Certificate.t -> unit)
    -> ?session:Buffer.Buffer.t
    -> ?minDHSize:int
    -> ?highWaterMark:int
    -> ?secureContext:SecureContext.t
    -> ?onread:OnReadOptions.t
    -> ?ca:
         ([ `String of string
          | `Strings of string list
          | `Buffer of Buffer.Buffer.t
          | `Buffers of Buffer.Buffer.t list
          ]
         [@js.union])
    -> ?cert:
         ([ `String of string
          | `Strings of string list
          | `Buffer of Buffer.Buffer.t
          | `Buffers of Buffer.Buffer.t list
          ]
         [@js.union])
    -> ?sigalgs:string
    -> ?ciphers:string
    -> ?clientCertEngine:string
    -> ?crl:
         ([ `String of string
          | `Strings of string list
          | `Buffer of Buffer.Buffer.t
          | `Buffers of Buffer.Buffer.t list
          ]
         [@js.union])
    -> ?dhparam:string
    -> ?ecdhCurve:string
    -> ?honorCipherOrder:bool
    -> ?key:
         ([ `String of string
          | `Strings of string list
          | `Buffer of Buffer.Buffer.t
          | `Buffers of Buffer.Buffer.t list
          ]
         [@js.union])
    -> ?privateKeyEngine:string
    -> ?privateKeyIdentifier:string
    -> ?maxVersion:string
    -> ?minVersion:string
    -> ?passphrase:string
    -> ?pfx:
         ([ `String of string
          | `Strings of string list
          | `Buffer of Buffer.Buffer.t
          | `Buffers of Buffer.Buffer.t list
          ]
         [@js.union])
    -> ?secureOptions:int
    -> ?secureProtocol:string
    -> ?sessionIdContext:string
    -> ?ticketKeys:Buffer.Buffer.t
    -> ?sessionTimeout:int
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
    -> unit
    -> t
    [@@js.builder]
end

val checkServerIdentity : string -> Global.Certificate.t -> Error.t option
  [@@js.global "checkServerIdentity"]

val connect : ConnectOptions.t -> ?callback:(unit -> unit) -> unit -> Server.t
  [@@js.global "connect"]

val createSecureContext
  :  ?options:CreateSecureContextOptions.t
  -> unit
  -> SecureContext.t
  [@@js.global "createSecureContext"]

val createServer
  :  ?options:CreateServerOptions.t
  -> ?secureConnectionListener:(unit -> unit)
  -> unit
  -> SecureContext.t
  [@@js.global "createServer"]

val getCiphers : unit -> string list [@@js.global "getCiphers"]

val rootCertificates : string list [@@js.global "rootCertificates"]

val default_ecdh_curve : string [@@js.global "DEFAULT_ECDH_CURVE"]

val default_max_version : string [@@js.global "DEFAULT_MAX_VERSION"]

val default_min_version : string [@@js.global "DEFAULT_MIN_VERSION"]
