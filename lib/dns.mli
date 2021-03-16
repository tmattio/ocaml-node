open Import

module LookupOptions : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val create
    :  ?family:int
    -> ?hints:int
    -> ?all:bool
    -> ?verbatim:bool
    -> unit
    -> t
end

val lookup
  :  string
  -> ?options:LookupOptions.t
  -> ?callback:(Error.t -> string -> int -> unit)
  -> unit
  -> unit
