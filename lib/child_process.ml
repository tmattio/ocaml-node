open Import

type t = private Ojs.t [@@js]

val stdout : t -> Stream.Readable.t [@@js.get "stdout"]

let get_stdout = stdout

val stderr : t -> Stream.Readable.t [@@js.get "stderr"]

let get_stderr = stderr

val stdin : t -> Stream.Writable.t [@@js.get "stdin"]

let get_stdin = stdin

val on : t -> string -> Ojs.t -> unit [@@js.call]

let on t = function
  | `Close f ->
    on t "close" @@ [%js.of: code:int -> signal:string -> unit] f
  | `Disconnect f ->
    on t "disconnect" @@ [%js.of: unit -> unit] f
  | `Error f ->
    on t "error" @@ [%js.of: err:Error.t -> unit] f
  | `Exit f ->
    on t "exit" @@ [%js.of: code:int -> signal:string -> unit] f
  | `Message f ->
    on t "message" @@ [%js.of: message:Ojs.t -> sendHandle:Ojs.t -> unit] f

module Options = struct
  type t = private Ojs.t [@@js]

  val create : ?cwd:string -> ?env:string Dict.t -> unit -> t [@@js.builder]
end

type exec_result = private Ojs.t [@@js]

val exec
  :  string
  -> ?options:Options.t
  -> ?callback:(exec_result or_undefined -> string -> string -> unit)
  -> unit
  -> t
  [@@js.global "child_process.exec"]

val spawn : string -> string array -> ?options:Options.t -> unit -> t
  [@@js.global "child_process.spawn"]

type return =
  { exitCode : int
  ; stdout : string
  ; stderr : string
  }

type event =
  | Spawned
  | Stdout of string
  | Stderr of string
  | Closed

let handle_child_process ?logger ?stdin cp resolve =
  let log = Option.value logger ~default:ignore in
  log Spawned;
  let stdout = ref (Buffer.from "") in
  let on_stdout ~chunk =
    match chunk with
    | `String s ->
      Buffer.append stdout (Buffer.from s);
      log @@ Stdout s
    | `Buffer b ->
      Buffer.append stdout b;
      log @@ Stdout (Buffer.toString b)
  in
  Stream.Readable.on (get_stdout cp) (`Data on_stdout);
  let stderr = ref (Buffer.from "") in
  let on_stderr ~chunk =
    match chunk with
    | `String s ->
      Buffer.append stderr (Buffer.from s);
      log @@ Stderr s
    | `Buffer b ->
      Buffer.append stderr b;
      log @@ Stderr (Buffer.toString b)
  in
  Stream.Readable.on (get_stderr cp) (`Data on_stderr);
  let close ~code ~signal:_ =
    log Closed;
    resolve
      { exitCode = code
      ; stdout = Buffer.toString !stdout
      ; stderr = Buffer.toString !stderr
      }
  in
  on cp (`Close close);
  match stdin with
  | Some text ->
    Stream.Writable.write (get_stdin cp) text;
    Stream.Writable.end_ (get_stdin cp)
  | None ->
    ()

let exec ?logger ?stdin ?options cmd =
  Promise.make @@ fun ~resolve ~reject:_ ->
  let cp = exec cmd ?options () in
  handle_child_process cp ?logger ?stdin resolve

let spawn ?logger ?stdin ?options cmd args =
  Promise.make @@ fun ~resolve ~reject:_ ->
  let cp = spawn cmd args ?options () in
  handle_child_process cp ?logger ?stdin resolve
