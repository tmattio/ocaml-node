[@@@js.scope Import.path]

val basename : string -> string [@@js.global "basename"]

val delimiter : string [@@js.global "delimiter"]

val dirname : string -> string [@@js.global "dirname"]

val extname : string -> string [@@js.global "extname"]

module PathObject : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  val dir : t -> string [@@js.get]

  val root : t -> string [@@js.get]

  val base : t -> string [@@js.get]

  val name : t -> string [@@js.get]

  val ext : t -> string [@@js.get]

  val create
    :  ?dir:string
    -> ?root:string
    -> ?base:string
    -> ?name:string
    -> ?ext:string
    -> unit
    -> t
    [@@js.builder]
end

val format : PathObject.t -> string [@@js.global "format"]

val isAbsolute : string -> bool [@@js.global "isAbsolute"]

val join : (string list[@js.variadic]) -> string [@@js.global "join"]

val normalize : string -> string [@@js.global "normalize"]

val parse : string -> PathObject.t [@@js.global "parse"]

val relative : from:string -> to_:string -> string [@@js.global "relative"]

val resolve : (string list[@js.variadic]) -> string [@@js.global "resolve"]

val sep : string [@@js.global "sep"]

val toNamespacedPath : string -> string [@@js.global "toNamespacedPath"]
