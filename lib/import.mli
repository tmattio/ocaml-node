type 'a or_undefined = 'a option

val or_undefined_of_js : (Ojs.t -> 'a) -> Ojs.t -> 'a or_undefined

val or_undefined_to_js : ('a -> Ojs.t) -> 'a or_undefined -> Ojs.t

module Dict : sig
  include Map.S with type key = string

  val t_of_js : (Ojs.t -> 'a) -> Ojs.t -> 'a t

  val t_to_js : ('a -> Ojs.t) -> 'a t -> Ojs.t

  val of_alist : (string * 'a) list -> 'a t
end

module Error : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val message : t -> string
end

module ArrayBuffer : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t
end

module Uint8Array : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val new_ : t -> t

  val to_string : t -> string
end

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

  val raw : t -> Buffer.t

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

  val pubkey : t -> Buffer.t or_undefined

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
