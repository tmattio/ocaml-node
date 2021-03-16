module Timeout = struct
  type t = private Ojs.t [@@js]

  val hasRef : t -> bool [@@js.get]

  val ref : t -> t [@@js.get]

  val refresh : t -> t [@@js.get]

  val unref : t -> t [@@js.get]
end

val setInterval : (unit -> unit) -> int -> Timeout.t [@@js.global "setInterval"]

val setTimeout : (unit -> unit) -> int -> Timeout.t [@@js.global "setTimeout"]
