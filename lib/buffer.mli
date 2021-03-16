type t

val t_of_js : Ojs.t -> t

val t_to_js : t -> Ojs.t

val toString : t -> string

val from : string -> t

val concat : t list -> t

val append : t ref -> t -> unit

val write
  :  t
  -> string:string
  -> ?offset:int
  -> ?length:int
  -> ?encoding:string
  -> unit
  -> unit
