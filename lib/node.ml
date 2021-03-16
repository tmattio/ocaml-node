module Dict = Import.Dict
module Error = Import.Error
module Os = Os
module Timeout = Timers.Timeout
module Process = Process
module Buffer = Buffer
module Stream = Stream
module Path = Path
module Console = Console
module Fs = Fs
module ChildProcess = Child_process
module Http = Http
module Https = Https
module Tls = Tls

let __filename () =
  Js_of_ocaml.Js.Unsafe.eval_string "__filename" |> Js_of_ocaml.Js.to_string

let __dirname () =
  Js_of_ocaml.Js.Unsafe.eval_string "__dirname" |> Js_of_ocaml.Js.to_string

val console : Console.t [@@js.global "console"]

let setInterval = Timers.setInterval

let setTimeout = Timers.setTimeout
