open Import

type t = private Ojs.t [@@js]

module Options = struct
  type t = private Ojs.t [@@js]

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

val assert_ : bool -> (string list[@js.variadic]) -> unit
  [@@js.global "console.assert"]

val clear : unit -> unit [@@js.global "console.clear"]

val count : ?label:string -> unit -> unit [@@js.global "console.count"]

val countReset : ?label:string -> unit -> unit
  [@@js.global "console.countReset"]

val debug : string -> unit [@@js.global "console.debug"]

val debug_js : Ojs.t -> unit [@@js.global "console.debug"]

val error : string -> unit [@@js.global "console.error"]

val error_js : Ojs.t -> unit [@@js.global "console.error"]

val info : string -> unit [@@js.global "console.info"]

val info_js : Ojs.t -> unit [@@js.global "console.info"]

val log : string -> unit [@@js.global "console.log"]

val log_js : Ojs.t -> unit [@@js.global "console.log"]

val warn : string -> unit [@@js.global "console.warn"]

val warn_js : Ojs.t -> unit [@@js.global "console.warn"]

val dir : string -> unit [@@js.global "console.dir"]

val dir_js : Ojs.t -> unit [@@js.global "console.dir"]

val dirxml : (Ojs.t list[@js.variadic]) -> unit [@@js.global "console.dirxml"]

val group : (Ojs.t list[@js.variadic]) -> unit [@@js.global "console.group"]

val groupCollapsed : unit -> unit [@@js.global "console.groupCollapsed"]

val groupEnd : unit -> unit [@@js.global "console.groupEnd"]

val table : string Dict.t list -> unit [@@js.global "console.table"]

val time : ?label:string -> unit -> unit [@@js.global "console.time"]

val timeEnd : ?label:string -> unit -> unit [@@js.global "console.timeEnd"]

val timeLog : ?label:string -> (Ojs.t list[@js.variadic]) -> unit
  [@@js.global "console.timeLog"]

val trace : Ojs.t -> unit [@@js.global "console.trace"]
