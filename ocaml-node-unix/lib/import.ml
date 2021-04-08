module Result = struct
  include Stdlib.Result

  module Syntax = struct
    let ( let+ ) f t = map t f

    let ( let* ) = bind
  end
end

let ( let@ ) f x = f x

let handle_sys_error f =
  match f () with
  | Ok x ->
    x
  | Error err ->
    raise (Errors.System_error (Errors.System_error.of_luv_error err))

module String_map = Map.Make (String)
