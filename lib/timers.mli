module Timeout : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val hasRef : t -> bool

  val ref : t -> t

  val refresh : t -> t

  val unref : t -> t
end

val setInterval : (unit -> unit) -> int -> Timeout.t

val setTimeout : (unit -> unit) -> int -> Timeout.t
