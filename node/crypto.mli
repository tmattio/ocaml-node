open Js

[@@@js.scope Import.crypto]

module KeyObject : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  val from : Web_crypto.CryptoKey.t -> t [@@js.global "KeyObject.from"]

  module AsymmetricKeyDetails : sig
    type t

    val t_to_js : t -> Ojs.t

    val t_of_js : Ojs.t -> t

    val modulusLength : t -> int [@@js.get]

    val publicExponent : t -> int [@@js.get]

    val divisorLength : t -> int [@@js.get]

    val namedCurve : t -> string [@@js.get]
  end

  val asymmetricKeyDetails : t -> AsymmetricKeyDetails.t [@@js.get]

  val asymmetricKeyType : t -> string [@@js.get]

  (* val export: t -> ?options:ExportOptions.t -> unit -> ([ `String of string |
     `Buffer of Buffer.Buffer.t ][@js.union]) [@@js.get] *)

  val symmetricKeySize : t -> int [@@js.get]

  val type_ : t -> string [@@js.get]
end

module X509Certificate : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  module CheckOptions : sig
    type t

    val t_to_js : t -> Ojs.t

    val t_of_js : Ojs.t -> t

    val create
      :  ?subject:string
      -> ?wildcards:bool
      -> ?partialWildcards:bool
      -> ?multiLabelWildcards:bool
      -> ?singleLabelSubdomains:bool
      -> unit
      -> t
      [@@js.builder]
  end

  val ca : t -> bool [@@js.get]

  val checkEmail
    :  t
    -> string
    -> ?options:CheckOptions.t
    -> unit
    -> string option
    [@@js.call]

  val checkHost
    :  t
    -> string
    -> ?options:CheckOptions.t
    -> unit
    -> string option
    [@@js.call]

  val checkIP : t -> string -> ?options:CheckOptions.t -> unit -> string option
    [@@js.call]

  val checkIssued : t -> t -> bool [@@js.call]

  val checkPrivateKey : t -> KeyObject.t -> bool [@@js.call]

  val fingerprint : t -> string [@@js.get]

  val fingerprint256 : t -> string [@@js.get]

  val infoAccess : t -> string [@@js.get]

  val issuer : t -> string [@@js.get]

  val issuerCertificate : t -> t option [@@js.get]

  val keyUsage : t -> string list [@@js.get]

  val publicKey : t -> KeyObject.t [@@js.get]

  val raw : t -> Buffer.Buffer.t [@@js.get]

  val serialNumber : t -> string [@@js.get]

  val subject : t -> string [@@js.get]

  val subjectAltName : t -> string [@@js.get]

  val toJSON : t -> string [@@js.get]

  val toLegacyObject : t -> Global.Certificate.t [@@js.get]

  val toString : t -> string [@@js.get]

  val validFrom : t -> string [@@js.get]

  val validTo : t -> string [@@js.get]

  val verify : t -> KeyObject.t -> string [@@js.call]

  val create
    :  buffer:([ `String of string | `Buffer of Buffer.Buffer.t ][@js.union])
    -> t
    [@@js.builder]
end
