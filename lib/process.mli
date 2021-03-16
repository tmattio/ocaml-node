val cwd : unit -> string

val platform : string

val arch : string

module Env : sig
  val get : string -> string option

  val set : string -> string -> unit

  val env : string Import.Dict.t
end

module Argv : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val t : t

  val shift : t -> unit
end
