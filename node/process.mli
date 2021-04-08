open Js

[@@@js.scope Import.process]

module Argv : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  val shift : t -> unit [@@js.call]
end

val env : string Dict.t [@@js.global "env"]

val argv : string list [@@js.global "argv"]

val argv0 : string [@@js.global "argv0"]

val cwd : unit -> string [@@js.global "cwd"]

val platform : string [@@js.global "platform"]

val arch : string [@@js.global "arch"]

val stdout : Tty.WriteStream.t [@@js.global "stdout"]

val stdout_fd : int [@@js.global "stdout.fd"]

val stderr : Tty.WriteStream.t [@@js.global "stderr"]

val stderr_fd : int [@@js.global "stderr.fd"]

val stdin : Tty.ReadStream.t [@@js.global "stdin"]

val stdin_fd : int [@@js.global "stdin.fd"]
