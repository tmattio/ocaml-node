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

  val new_ : ArrayBuffer.t -> t [@@js.new "Uint8Array"]

  val to_string : t -> string [@@js.cast]
end
