val basename : string -> string [@@js.global "path.basename"]

val delimiter : string [@@js.global "path.delimiter"]

val dirname : string -> string [@@js.global "path.dirname"]

val extname : string -> string [@@js.global "path.extname"]

module PathObject = struct
  type t = private Ojs.t [@@js]

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

val format : PathObject.t -> string [@@js.global "path.format"]

val isAbsolute : string -> bool [@@js.global "path.isAbsolute"]

val join : (string list[@js.variadic]) -> string [@@js.global "path.join"]

val normalize : string -> string [@@js.global "path.normalize"]

val parse : string -> PathObject.t [@@js.global "path.parse"]

val relative : from:string -> to_:string -> string [@@js.global "path.relative"]

val resolve : (string list[@js.variadic]) -> string [@@js.global "path.resolve"]

val sep : string [@@js.global "path.sep"]

val toNamespacedPath : string -> string [@@js.global "path.toNamespacedPath"]
