module InspectOptions = struct
  type t = private Ojs.t [@@js]

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
