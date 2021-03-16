open Import

type t

val t_of_js : Ojs.t -> t

val t_to_js : t -> Ojs.t

module Options : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val create
    :  ?stdout:Stream.Writable.t
    -> ?stderr:Stream.Writable.t
    -> ?ignoreErrors:bool
    -> ?colorMode:([ `Bool of bool | `String of string ][@js.union])
    -> ?inspectOptions:Util.InspectOptions.t
    -> ?groupIndentation:int
    -> unit
    -> t
end

val assert_ : bool -> (string list[@js.variadic]) -> unit

val clear : unit -> unit

val count : ?label:string -> unit -> unit

val countReset : ?label:string -> unit -> unit

val debug : string -> unit

val debug_js : Ojs.t -> unit

val error : string -> unit

val error_js : Ojs.t -> unit

val info : string -> unit

val info_js : Ojs.t -> unit

val log : string -> unit

val log_js : Ojs.t -> unit

val warn : string -> unit

val warn_js : Ojs.t -> unit

val dir : string -> unit

val dir_js : Ojs.t -> unit

val dirxml : (Ojs.t list[@js.variadic]) -> unit

val group : (Ojs.t list[@js.variadic]) -> unit

val groupCollapsed : unit -> unit

val groupEnd : unit -> unit

val table : string Dict.t list -> unit

val time : ?label:string -> unit -> unit

val timeEnd : ?label:string -> unit -> unit

val timeLog : ?label:string -> (Ojs.t list[@js.variadic]) -> unit

val trace : Ojs.t -> unit
