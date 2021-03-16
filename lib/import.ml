let undefined = Ojs.variable "undefined"

type 'a or_undefined = 'a option

let or_undefined_of_js ml_of_js js_val =
  if js_val != undefined && js_val != Ojs.null then
    Some (ml_of_js js_val)
  else
    None

let or_undefined_to_js ml_to_js = function
  | Some ml_val ->
    ml_to_js ml_val
  | None ->
    undefined

module Dict = struct
  module StringMap = Map.Make (String)

  let t_of_js value_of_js js_obj =
    let ml_map = ref StringMap.empty in
    let iter key =
      let value = value_of_js (Ojs.get js_obj key) in
      ml_map := StringMap.add key value !ml_map
    in
    Ojs.iter_properties js_obj iter;
    !ml_map

  let t_to_js value_to_js ml_map =
    let to_js (k, v) = k, value_to_js v in
    StringMap.to_seq ml_map |> Seq.map to_js |> Array.of_seq |> Ojs.obj

  let of_alist alist = StringMap.of_seq (List.to_seq alist)

  include StringMap
end

module Error = struct
  type t = Promise.error [@@js]

  let message (error : t) =
    let js_error = [%js.of: t] error in
    if Ojs.has_property js_error "message" then
      [%js.to: string] (Ojs.get js_error "message")
    else
      "Unknown error"
end

module ArrayBuffer = struct
  type t = private Ojs.t [@@js]
end

module Uint8Array = struct
  type t = private Ojs.t [@@js]

  val new_ : ArrayBuffer.t -> t [@@js.new]

  val to_string : t -> string [@@js.cast]
end

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

  val raw : t -> Buffer.t [@@js.get]

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

  val pubkey : t -> Buffer.t or_undefined [@@js.get]

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
