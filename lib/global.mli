val console : Console.t [@@js.global "console"]

[@@@js.stop]

val __filename : unit -> string

val __dirname : unit -> string

[@@@js.start]

[@@@js.implem
let __filename () =
  Ojs.get_prop_ascii Ojs.global "__filename" |> Ojs.string_of_js

let __dirname () = Ojs.get_prop_ascii Ojs.global "__dirname" |> Ojs.string_of_js]

module Address : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  val port : t -> int [@@js.get]

  val family : t -> string [@@js.get]

  val address : t -> string [@@js.get]
end

module Certificate : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  module Subject : sig
    type t

    val t_to_js : t -> Ojs.t

    val t_of_js : Ojs.t -> t

    val c : t -> string [@@js.get "C"]

    val st : t -> string [@@js.get "ST"]

    val l : t -> string [@@js.get "L"]

    val o : t -> string [@@js.get "O"]

    val ou : t -> string [@@js.get "OU"]

    val cn : t -> string [@@js.get "CN"]
  end

  val raw : t -> Buffer.Buffer.t [@@js.get]

  val subject : t -> Subject.t [@@js.get]

  val issuer : t -> Subject.t [@@js.get]

  val valid_from : t -> string [@@js.get]

  val valid_to : t -> string [@@js.get]

  val serialNumber : t -> string [@@js.get]

  val fingerprint : t -> string [@@js.get]

  val fingerprint256 : t -> string [@@js.get]

  val ext_key_usage : t -> Ojs.t list [@@js.get]

  val subjectaltname : t -> string [@@js.get]

  val infoAccess : t -> Ojs.t list [@@js.get]

  val issuerCertificate : t -> t [@@js.get]

  val bits : t -> int option [@@js.get]

  val exponent : t -> string option [@@js.get]

  val modulus : t -> string option [@@js.get]

  val pubkey : t -> Buffer.Buffer.t option [@@js.get]

  val asn1Curve : t -> string option [@@js.get]

  val nistCurve : t -> string option [@@js.get]
end

module AbortSignal : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  [@@@js.stop]

  val on : t -> [< `Abort of unit -> unit ] -> unit

  [@@@js.start]

  [@@@js.implem
  val on : t -> string -> Ojs.t -> unit [@@js.call]

  let on t = function `Abort f -> on t "abort" @@ [%js.of: unit -> unit] f]

  val aborted : t -> bool [@@js.get]

  val onabort : t -> (unit -> unit) -> unit [@@js.call]
end
