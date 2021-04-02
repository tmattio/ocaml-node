[@@@js.scope Import.timers]

module Timeout : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  val hasRef : t -> bool [@@js.get]

  val ref : t -> t [@@js.get]

  val refresh : t -> t [@@js.get]

  val unref : t -> t [@@js.get]
end

val setInterval : (unit -> unit) -> int -> Timeout.t [@@js.global "setInterval"]

val setTimeout : (unit -> unit) -> int -> Timeout.t [@@js.global "setTimeout"]
