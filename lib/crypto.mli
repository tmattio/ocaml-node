open Import

module KeyObject : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val from : Web_crypto.CryptoKey.t -> t

  module AsymmetricKeyDetails : sig
    type t

    val t_of_js : Ojs.t -> t

    val t_to_js : t -> Ojs.t

    val modulusLength : t -> int

    val publicExponent : t -> int

    val divisorLength : t -> int

    val namedCurve : t -> string
  end

  val asymmetricKeyDetails : t -> t

  val asymmetricKeyType : t -> string

  val symmetricKeySize : t -> int

  val type_ : t -> string
end

module X509Certificate : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  module CheckOptions : sig
    type t

    val t_of_js : Ojs.t -> t

    val t_to_js : t -> Ojs.t

    val create
      :  ?subject:string
      -> ?wildcards:bool
      -> ?partialWildcards:bool
      -> ?multiLabelWildcards:bool
      -> ?singleLabelSubdomains:bool
      -> unit
      -> t
  end

  val ca : t -> bool

  val checkEmail
    :  t
    -> string
    -> ?options:CheckOptions.t
    -> unit
    -> string or_undefined

  val checkHost
    :  t
    -> string
    -> ?options:CheckOptions.t
    -> unit
    -> string or_undefined

  val checkIP
    :  t
    -> string
    -> ?options:CheckOptions.t
    -> unit
    -> string or_undefined

  val checkIssued : t -> t -> bool

  val checkPrivateKey : t -> KeyObject.t -> bool

  val fingerprint : t -> string

  val fingerprint256 : t -> string

  val infoAccess : t -> string

  val issuer : t -> string

  val issuerCertificate : t -> t or_undefined

  val keyUsage : t -> string list

  val publicKey : t -> KeyObject.t

  val raw : t -> Buffer.Buffer.t

  val serialNumber : t -> string

  val subject : t -> string

  val subjectAltName : t -> string

  val toJSON : t -> string

  val toLegacyObject : t -> Global.Certificate.t

  val toString : t -> string

  val validFrom : t -> string

  val validTo : t -> string

  val verify : t -> KeyObject.t -> string

  val create
    :  buffer:([ `String of string | `Buffer of Buffer.Buffer.t ][@js.union])
    -> t
end
