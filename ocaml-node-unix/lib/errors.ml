module Error = struct
  type t =
    { message : string  (** Error message *)
    ; name : string  (** Error name *)
    }
end

exception Error of Error.t

module System_error = struct
  include Error

  let of_luv_error (err : Luv.Error.t) =
    { name = Luv.Error.err_name err; message = Luv.Error.strerror err }
end

exception System_error of System_error.t
