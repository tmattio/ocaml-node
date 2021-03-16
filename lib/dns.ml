open Import

module LookupOptions = struct
  type t = private Ojs.t [@@js]

  val create
    :  ?family:int
    -> ?hints:int
    -> ?all:bool
    -> ?verbatim:bool
    -> unit
    -> t
    [@@js.builder]
end

val lookup
  :  string
  -> ?options:LookupOptions.t
  -> ?callback:(Error.t -> string -> int -> unit)
  -> unit
  -> unit
  [@@js.global "dns.lookup"]
