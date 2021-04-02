open Js

[@@@js.scope Import.process]

module Env : sig
  [@@@js.stop]

  val get : string -> string option

  val set : string -> string -> unit

  [@@@js.start]

  [@@@js.implem
  val env : Ojs.t [@@js.global "env"]

  let get k = [%js.to: string option] (Ojs.get_prop_ascii env k)

  let set k v = Ojs.set_prop_ascii env k ([%js.of: string] v)]

  val env : string Dict.t [@@js.global "env"]
end

module Argv : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  val t : t [@@js.global "argv"]

  val shift : t -> unit [@@js.call]
end

val cwd : unit -> string [@@js.global "cwd"]

val platform : string [@@js.global "platform"]

val arch : string [@@js.global "arch"]

val stdout : Tty.WriteStream.t [@@js.global "stdout"]

val stdout_fd : int [@@js.global "stdout.fd"]

val stderr : Tty.WriteStream.t [@@js.global "stderr"]

val stderr_fd : int [@@js.global "stderr.fd"]

val stdin : Tty.ReadStream.t [@@js.global "stdin"]

val stdin_fd : int [@@js.global "stdin.fd"]
