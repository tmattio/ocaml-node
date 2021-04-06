open Js

[@@@js.scope Import.console]

type t

val t_to_js : t -> Ojs.t

val t_of_js : Ojs.t -> t

module Options : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  val create
    :  ?stdout:Stream.Writable.t
    -> ?stderr:Stream.Writable.t
    -> ?ignoreErrors:bool
    -> ?colorMode:([ `Bool of bool | `String of string ][@js.union])
    -> ?inspectOptions:Util.InspectOptions.t
    -> ?groupIndentation:int
    -> unit
    -> t
    [@@js.builder]
end

val assert_ : bool -> (string list[@js.variadic]) -> unit [@@js.global "assert"]

val clear : unit -> unit [@@js.global "clear"]

val count : ?label:string -> unit -> unit [@@js.global "count"]

val countReset : ?label:string -> unit -> unit [@@js.global "countReset"]

val debug : string -> unit [@@js.global "debug"]

val debug_js : Ojs.t -> unit [@@js.global "debug"]

val error : string -> unit [@@js.global "error"]

val error_js : Ojs.t -> unit [@@js.global "error"]

val info : string -> unit [@@js.global "info"]

val info_js : Ojs.t -> unit [@@js.global "info"]

val log : string -> unit [@@js.global "log"]

val log_js : Ojs.t -> unit [@@js.global "log"]

val warn : string -> unit [@@js.global "warn"]

val warn_js : Ojs.t -> unit [@@js.global "warn"]

val dir : string -> unit [@@js.global "dir"]

val dir_js : Ojs.t -> unit [@@js.global "dir"]

val dirxml : (Ojs.t list[@js.variadic]) -> unit [@@js.global "dirxml"]

val group : (Ojs.t list[@js.variadic]) -> unit [@@js.global "group"]

val groupCollapsed : unit -> unit [@@js.global "groupCollapsed"]

val groupEnd : unit -> unit [@@js.global "groupEnd"]

val table : string Dict.t list -> unit [@@js.global "table"]

val time : ?label:string -> unit -> unit [@@js.global "time"]

val timeEnd : ?label:string -> unit -> unit [@@js.global "timeEnd"]

val timeLog : ?label:string -> (Ojs.t list[@js.variadic]) -> unit
  [@@js.global "timeLog"]

val trace : Ojs.t -> unit [@@js.global "trace"]
