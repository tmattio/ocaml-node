open Import

val cwd : unit -> string [@@js.global "process.cwd"]

val platform : string [@@js.global "process.platform"]

val arch : string [@@js.global "process.arch"]

module Env = struct
  val env : Ojs.t [@@js.global "process.env"]

  let get k = [%js.to: string or_undefined] (Ojs.get env k)

  let set k v = Ojs.set env k ([%js.of: string] v)

  val env : string Dict.t [@@js.global "process.env"]
end

module Argv = struct
  type t = private Ojs.t [@@js]

  val t : t [@@js.global "process.argv"]

  val shift : t -> unit [@@js.call]
end
