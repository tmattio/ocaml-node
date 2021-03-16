val basename : string -> string

val delimiter : string

val dirname : string -> string

val extname : string -> string

module PathObject : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val dir : t -> string

  val root : t -> string

  val base : t -> string

  val name : t -> string

  val ext : t -> string

  val create
    :  ?dir:string
    -> ?root:string
    -> ?base:string
    -> ?name:string
    -> ?ext:string
    -> unit
    -> t
end

val format : PathObject.t -> string

val isAbsolute : string -> bool

val join : string list -> string

val normalize : string -> string

val parse : string -> PathObject.t

val relative : from:string -> to_:string -> string

val resolve : string list -> string

val sep : string

val toNamespacedPath : string -> string
