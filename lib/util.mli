module InspectOptions : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val create
    :  ?showHidden:bool
    -> ?depth:int
    -> ?colors:bool
    -> ?customInspect:bool
    -> ?showProxy:bool
    -> ?maxArrayLength:int
    -> ?maxStringLength:int
    -> ?breakLength:int
    -> ?compact:[ `Bool of bool | `Int of int ]
    -> ?sorted:[ `Bool of bool | `Function of t -> unit ]
    -> ?getters:[ `Bool of bool | `String of string ]
    -> unit
    -> t
end
