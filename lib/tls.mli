open Import

module SecureContext : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t
end

module TLSSocket : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val on
    :  t
    -> [< `Keylog of Buffer.Buffer.t -> unit
       | `OCSPResponse of Buffer.Buffer.t -> unit
       | `SecureConnect of unit -> unit
       | `Session of Buffer.Buffer.t -> unit
       ]
    -> unit

  module Certificate = Global.Certificate

  module Cipher : sig
    type t

    val t_of_js : Ojs.t -> t

    val t_to_js : t -> Ojs.t

    val name : t -> string

    val standardName : t -> string

    val version : t -> string
  end

  module EphemeralKeyInfo : sig
    type t

    val t_of_js : Ojs.t -> t

    val t_to_js : t -> Ojs.t

    val type_ : t -> string

    val name : t -> string

    val size : t -> string
  end

  val address : t -> Global.Address.t

  val authorizationError : t -> Error.t

  val authorized : t -> bool

  val disableRenegotiation : t -> unit

  val enableTrace : t -> unit

  val encrypted : t -> bool

  val exportKeyingMaterial
    :  t
    -> int
    -> string
    -> Buffer.Buffer.t
    -> Buffer.Buffer.t

  val getCertificate : t -> Certificate.t

  val getCipher : t -> Cipher.t

  val getEphemeralKeyInfo : t -> EphemeralKeyInfo.t

  val getFinished : t -> Buffer.Buffer.t or_undefined

  val getPeerCertificate : t -> ?detailed:bool -> unit -> Certificate.t

  val getPeerFinished : t -> Buffer.Buffer.t or_undefined

  val getPeerX509Certificate : t -> Crypto.X509Certificate.t

  val getProtocol : t -> string or_undefined

  val getSession : t -> Buffer.Buffer.t

  (* TODO: Not sure of the return type here *)
  val getSharedSigalgs : t -> string list

  val getTLSTicket : t -> Buffer.Buffer.t

  val getX509Certificate : t -> Crypto.X509Certificate.t

  val isSessionReused : t -> bool

  val localAddress : t -> string

  val localPort : t -> int

  val remoteAddress : t -> string

  val remoteFamily : t -> string

  val remotePort : t -> int

  module RenegotiateOptions : sig
    type t

    val t_of_js : Ojs.t -> t

    val t_to_js : t -> Ojs.t

    val rejectUnauthorized : t -> bool

    val requestCert : t -> Certificate.t
  end

  val renegotiate : t -> ?options:t -> (unit -> unit) -> unit

  val setMaxSendFragment : t -> int -> bool

  module Options : sig
    type t

    val t_of_js : Ojs.t -> t

    val t_to_js : t -> Ojs.t

    val create
      :  ?enableTrace:bool
      -> ?isServer:bool
      -> ?server:Net.Server.t
      -> ?requestCert:bool
      -> ?rejectUnauthorized:bool
      -> ?alpnprotocols:
           [ `Buffer of Buffer.Buffer.t
           | `Buffers of Buffer.Buffer.t list
           | `Strings of string list
           ]
      -> ?snicallback:(string -> (Error.t -> t option -> unit) -> unit)
      -> ?session:Buffer.Buffer.t
      -> ?requestOCSP:bool
      -> ?secureContext:t
      -> ?ca:
           [ `Buffer of Buffer.Buffer.t
           | `Buffers of Buffer.Buffer.t list
           | `String of string
           | `Strings of string list
           ]
      -> ?cert:
           [ `Buffer of Buffer.Buffer.t
           | `Buffers of Buffer.Buffer.t list
           | `String of string
           | `Strings of string list
           ]
      -> ?sigalgs:string
      -> ?ciphers:string
      -> ?clientCertEngine:string
      -> ?crl:
           [ `Buffer of Buffer.Buffer.t
           | `Buffers of Buffer.Buffer.t list
           | `String of string
           | `Strings of string list
           ]
      -> ?dhparam:string
      -> ?ecdhCurve:string
      -> ?honorCipherOrder:bool
      -> ?key:
           [ `Buffer of Buffer.Buffer.t
           | `Buffers of Buffer.Buffer.t list
           | `String of string
           | `Strings of string list
           ]
      -> ?privateKeyEngine:string
      -> ?privateKeyIdentifier:string
      -> ?maxVersion:string
      -> ?minVersion:string
      -> ?passphrase:string
      -> ?pfx:
           [ `Buffer of Buffer.Buffer.t
           | `Buffers of Buffer.Buffer.t list
           | `String of string
           | `Strings of string list
           ]
      -> ?secureOptions:int
      -> ?secureProtocol:string
      -> ?sessionIdContext:string
      -> ?ticketKeys:Buffer.Buffer.t
      -> ?sessionTimeout:int
      -> unit
      -> t
  end

  val create
    :  socket:[ `Socket of Net.Socket.t | `Stream of Stream.Duplex.t ]
    -> ?options:t
    -> unit
    -> t
end

module CreateSecureContextOptions : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val ca : t -> Buffer.Buffer.t or_undefined

  val cert : t -> Buffer.Buffer.t or_undefined

  val sigalgs : t -> string or_undefined

  val ciphers : t -> string or_undefined

  val clientCertEngine : t -> string or_undefined

  val crl : t -> Buffer.Buffer.t or_undefined

  val dhparam : t -> string or_undefined

  val ecdhCurve : t -> string or_undefined

  val honorCipherOrder : t -> bool or_undefined

  val key : t -> Buffer.Buffer.t or_undefined

  val privateKeyEngine : t -> string or_undefined

  val privateKeyIdentifier : t -> string or_undefined

  val maxVersion : t -> string or_undefined

  val minVersion : t -> string or_undefined

  val passphrase : t -> string or_undefined

  val pfx : t -> Buffer.Buffer.t or_undefined

  val secureOptions : t -> int or_undefined

  val secureProtocol : t -> string or_undefined

  val sessionIdContext : t -> string or_undefined

  val ticketKeys : t -> Buffer.Buffer.t or_undefined

  val sessionTimeout : t -> int or_undefined

  val create
    :  ?ca:
         [ `Buffer of Buffer.Buffer.t
         | `Buffers of Buffer.Buffer.t list
         | `String of string
         | `Strings of string list
         ]
    -> ?cert:
         [ `Buffer of Buffer.Buffer.t
         | `Buffers of Buffer.Buffer.t list
         | `String of string
         | `Strings of string list
         ]
    -> ?sigalgs:string
    -> ?ciphers:string
    -> ?clientCertEngine:string
    -> ?crl:
         [ `Buffer of Buffer.Buffer.t
         | `Buffers of Buffer.Buffer.t list
         | `String of string
         | `Strings of string list
         ]
    -> ?dhparam:string
    -> ?ecdhCurve:string
    -> ?honorCipherOrder:bool
    -> ?key:
         [ `Buffer of Buffer.Buffer.t
         | `Buffers of Buffer.Buffer.t list
         | `String of string
         | `Strings of string list
         ]
    -> ?privateKeyEngine:string
    -> ?privateKeyIdentifier:string
    -> ?maxVersion:string
    -> ?minVersion:string
    -> ?passphrase:string
    -> ?pfx:
         [ `Buffer of Buffer.Buffer.t
         | `Buffers of Buffer.Buffer.t list
         | `String of string
         | `Strings of string list
         ]
    -> ?secureOptions:int
    -> ?secureProtocol:string
    -> ?sessionIdContext:string
    -> ?ticketKeys:Buffer.Buffer.t
    -> ?sessionTimeout:int
    -> unit
    -> t
end

module Server : sig
  type t = Net.Server.t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val getConnections : t -> (unit -> unit) -> t

  module ListenOptions = Net.Server.ListenOptions

  val listening : t -> bool

  val maxConnections : t -> int

  val ref : t -> t

  val unref : t -> t

  module Options = Net.Server.Options

  val create : ?options:t -> ?connectionListener:(t -> unit) -> unit -> t

  val on
    :  t
    -> [< `Close of unit -> unit
       | `Connection of Stream.Duplex.t -> unit
       | `Error of Import.Error.t -> unit
       | `Keylog of Buffer.Buffer.t -> TLSSocket.t -> unit
       | `Listening of unit -> unit
       | `NewSession of
         Buffer.Buffer.t -> Buffer.Buffer.t -> (unit -> unit) -> unit
       | `OCSPRequest of
         Buffer.Buffer.t
         -> Buffer.Buffer.t
         -> (Import.Error.t option -> Buffer.Buffer.t)
         -> unit
       | `ResumeSession of
         Buffer.Buffer.t -> (Import.Error.t option -> Buffer.Buffer.t) -> unit
       | `SecureConnection of TLSSocket.t -> unit
       | `TlsClientError of Import.Error.t -> TLSSocket.t -> unit
       ]
    -> unit

  val addContext : t -> string -> CreateSecureContextOptions.t -> unit

  val address : t -> Global.Address.t

  val close : t -> ?callback:(unit -> unit) -> unit -> t

  val getTicketKeys : t -> Buffer.Buffer.t

  val listen : t -> unit

  val setSecureContext
    :  t
    -> ?options:CreateSecureContextOptions.t
    -> unit
    -> unit

  val setTicketKeys : t -> Buffer.Buffer.t
end

module CreateServerOptions : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val create
    :  ?alpnprotocols:
         [ `Buffer of Buffer.Buffer.t
         | `Buffers of Buffer.Buffer.t list
         | `Strings of string list
         ]
    -> ?clientCertEngine:string
    -> ?enableTrace:bool
    -> ?handshakeTimeout:int
    -> ?rejectUnauthorized:bool
    -> ?requestCert:bool
    -> ?sessionTimeout:int
    -> ?snicallback:(string -> (Error.t -> t option -> unit) -> unit)
    -> ?ticketKeys:Buffer.Buffer.t
    -> ?pskCallback:(t -> string -> Buffer.Buffer.t option)
    -> ?pskIdentityHint:string
    -> ?ca:
         [ `Buffer of Buffer.Buffer.t
         | `Buffers of Buffer.Buffer.t list
         | `String of string
         | `Strings of string list
         ]
    -> ?cert:
         [ `Buffer of Buffer.Buffer.t
         | `Buffers of Buffer.Buffer.t list
         | `String of string
         | `Strings of string list
         ]
    -> ?sigalgs:string
    -> ?ciphers:string
    -> ?clientCertEngine:string
    -> ?crl:
         [ `Buffer of Buffer.Buffer.t
         | `Buffers of Buffer.Buffer.t list
         | `String of string
         | `Strings of string list
         ]
    -> ?dhparam:string
    -> ?ecdhCurve:string
    -> ?honorCipherOrder:bool
    -> ?key:
         [ `Buffer of Buffer.Buffer.t
         | `Buffers of Buffer.Buffer.t list
         | `String of string
         | `Strings of string list
         ]
    -> ?privateKeyEngine:string
    -> ?privateKeyIdentifier:string
    -> ?maxVersion:string
    -> ?minVersion:string
    -> ?passphrase:string
    -> ?pfx:
         [ `Buffer of Buffer.Buffer.t
         | `Buffers of Buffer.Buffer.t list
         | `String of string
         | `Strings of string list
         ]
    -> ?secureOptions:int
    -> ?secureProtocol:string
    -> ?sessionIdContext:string
    -> ?ticketKeys:Buffer.Buffer.t
    -> ?sessionTimeout:int
    -> ?insecureHTTPParser:bool
    -> ?maxHeaderSize:int
    -> unit
    -> t
end

module ConnectOptions : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

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
         [ `Buffer of Buffer.Buffer.t
         | `Buffers of Buffer.Buffer.t list
         | `Strings of string list
         | `Uint8Array of Import.Uint8Array.t
         ]
    -> ?servername:string
    -> ?checkServerIdentity:(string -> TLSSocket.Certificate.t -> unit)
    -> ?session:Buffer.Buffer.t
    -> ?minDHSize:int
    -> ?highWaterMark:int
    -> ?secureContext:t
    -> ?onread:t
    -> ?ca:
         [ `Buffer of Buffer.Buffer.t
         | `Buffers of Buffer.Buffer.t list
         | `String of string
         | `Strings of string list
         ]
    -> ?cert:
         [ `Buffer of Buffer.Buffer.t
         | `Buffers of Buffer.Buffer.t list
         | `String of string
         | `Strings of string list
         ]
    -> ?sigalgs:string
    -> ?ciphers:string
    -> ?clientCertEngine:string
    -> ?crl:
         [ `Buffer of Buffer.Buffer.t
         | `Buffers of Buffer.Buffer.t list
         | `String of string
         | `Strings of string list
         ]
    -> ?dhparam:string
    -> ?ecdhCurve:string
    -> ?honorCipherOrder:bool
    -> ?key:
         [ `Buffer of Buffer.Buffer.t
         | `Buffers of Buffer.Buffer.t list
         | `String of string
         | `Strings of string list
         ]
    -> ?privateKeyEngine:string
    -> ?privateKeyIdentifier:string
    -> ?maxVersion:string
    -> ?minVersion:string
    -> ?passphrase:string
    -> ?pfx:
         [ `Buffer of Buffer.Buffer.t
         | `Buffers of Buffer.Buffer.t list
         | `String of string
         | `Strings of string list
         ]
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
end

val checkServerIdentity
  :  string
  -> Global.Certificate.t
  -> Import.Error.t option

val connect : ConnectOptions.t -> ?callback:(unit -> unit) -> unit -> Server.t

val createSecureContext
  :  ?options:CreateSecureContextOptions.t
  -> unit
  -> SecureContext.t

val createServer
  :  ?options:CreateServerOptions.t
  -> ?secureConnectionListener:(unit -> unit)
  -> unit
  -> SecureContext.t

val getCiphers : unit -> string list

val rootCertificates : string list

val default_ecdh_curve : string

val default_max_version : string

val default_min_version : string
