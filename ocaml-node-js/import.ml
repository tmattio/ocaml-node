module Result = struct
  include Stdlib.Result

  module Syntax = struct
    let ( let+ ) f t = map t f

    let ( let* ) = bind
  end
end

let ( let@ ) f x = f x

let handle_sys_error f =
  try f () with
  | Js_of_ocaml.Js.Error e ->
    raise (Errors.System_error (Errors.System_error.of_js_error e))

module String_map = Map.Make (String)
