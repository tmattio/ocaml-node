open Import

module Address = struct
  type t = private Ojs.t [@@js]

  val port : t -> int [@@js.get]

  val family : t -> string [@@js.get]

  val address : t -> string [@@js.get]
end

module Certificate = struct
  type t = private Ojs.t [@@js]

  module Subject = struct
    type t = private Ojs.t [@@js]

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

  val bits : t -> int or_undefined [@@js.get]

  val exponent : t -> string or_undefined [@@js.get]

  val modulus : t -> string or_undefined [@@js.get]

  val pubkey : t -> Buffer.Buffer.t or_undefined [@@js.get]

  val asn1Curve : t -> string or_undefined [@@js.get]

  val nistCurve : t -> string or_undefined [@@js.get]
end

module AbortSignal = struct
  type t = private Ojs.t [@@js]

  val on : t -> string -> Ojs.t -> unit [@@js.call]

  let on t = function `Abort f -> on t "abort" @@ [%js.of: unit -> unit] f

  val aborted : t -> bool [@@js.get]

  val onabort : t -> (unit -> unit) -> unit [@@js.call]
end

let __filename () =
  Js_of_ocaml.Js.Unsafe.eval_string "__filename" |> Js_of_ocaml.Js.to_string

let __dirname () =
  Js_of_ocaml.Js.Unsafe.eval_string "__dirname" |> Js_of_ocaml.Js.to_string

val console : Console.t [@@js.global "console"]

let setInterval = Timers.setInterval

let setTimeout = Timers.setTimeout
