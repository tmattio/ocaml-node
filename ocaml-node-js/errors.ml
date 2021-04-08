open Js_of_ocaml

let opt_string x ~if_missing =
  Js.Optdef.case x (fun () -> if_missing) (fun x -> Js.to_string x)

module Error = struct
  type t =
    { message : string  (** Error message *)
    ; name : string  (** Error name *)
    }

  let of_js_error (error : Js.error Js.t) =
    let name = Js_of_ocaml.Js.to_string error##.name in
    let message = Js_of_ocaml.Js.to_string error##.message in
    { message; name }

  let of_node_error (error : Node.Error.t) =
    let name = Node.Error.name error in
    let message = Node.Error.message error in
    { message; name }
end

exception Error of Error.t

module System_error = struct
  include Error
end

exception System_error of System_error.t
