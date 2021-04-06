[@@@js.scope Import.util]

module InspectOptions : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  val create
    :  ?showHidden:bool
    -> ?depth:int
    -> ?colors:bool
    -> ?customInspect:bool
    -> ?showProxy:bool
    -> ?maxArrayLength:int
    -> ?maxStringLength:int
    -> ?breakLength:int
    -> ?compact:([ `Bool of bool | `Int of int ][@js.union])
    -> ?sorted:([ `Bool of bool | `Function of t -> unit ][@js.union])
    -> ?getters:([ `Bool of bool | `String of string ][@js.union])
    -> unit
    -> t
    [@@js.builder]
end
