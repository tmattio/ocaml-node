open Import

module Address : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val port : t -> int

  val family : t -> string

  val address : t -> string
end

module Certificate : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  module Subject : sig
    type t

    val t_of_js : Ojs.t -> t

    val t_to_js : t -> Ojs.t

    val c : t -> string

    val st : t -> string

    val l : t -> string

    val o : t -> string

    val ou : t -> string

    val cn : t -> string
  end

  val raw : t -> Buffer.Buffer.t

  val subject : t -> Subject.t

  val issuer : t -> Subject.t

  val valid_from : t -> string

  val valid_to : t -> string

  val serialNumber : t -> string

  val fingerprint : t -> string

  val fingerprint256 : t -> string

  val ext_key_usage : t -> Ojs.t list

  val subjectaltname : t -> string

  val infoAccess : t -> Ojs.t list

  val issuerCertificate : t -> t

  val bits : t -> int or_undefined

  val exponent : t -> string or_undefined

  val modulus : t -> string or_undefined

  val pubkey : t -> Buffer.Buffer.t or_undefined

  val asn1Curve : t -> string or_undefined

  val nistCurve : t -> string or_undefined
end

module AbortSignal : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val on : t -> [< `Abort of unit -> 'a ] -> unit

  val aborted : t -> bool

  val onabort : t -> (unit -> unit) -> unit
end

val __filename : unit -> string

val __dirname : unit -> string

val console : Console.t

val setInterval : (unit -> unit) -> int -> Timers.Timeout.t

val setTimeout : (unit -> unit) -> int -> Timers.Timeout.t
