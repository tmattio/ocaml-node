type 'a or_undefined = 'a option

val or_undefined_of_js : (Ojs.t -> 'a) -> Ojs.t -> 'a or_undefined

val or_undefined_to_js : ('a -> Ojs.t) -> 'a or_undefined -> Ojs.t

module Dict : sig
  include Map.S with type key = string

  val t_of_js : (Ojs.t -> 'a) -> Ojs.t -> 'a t

  val t_to_js : ('a -> Ojs.t) -> 'a t -> Ojs.t

  val of_alist : (string * 'a) list -> 'a t
end

module Error : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val message : t -> string
end

module ArrayBuffer : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t
end

module Uint8Array : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val new_ : t -> t

  val to_string : t -> string
end
