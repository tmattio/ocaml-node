open Import

module Writable = struct
  type t = private Ojs.t [@@js]

  val on : t -> string -> Ojs.t -> unit [@@js.call]

  let on t = function
    | `Close f ->
      on t "close" @@ [%js.of: unit -> unit] f
    | `Drain f ->
      on t "drain" @@ [%js.of: unit -> unit] f
    | `Error f ->
      on t "error" @@ [%js.of: err:Error.t -> unit] f
    | `Finish f ->
      on t "finish" @@ [%js.of: unit -> unit] f
    | `Pipe f ->
      on t "pipe" @@ [%js.of: src:t -> unit] f
    | `Unpipe f ->
      on t "unpipe" @@ [%js.of: src:t -> unit] f

  val write : t -> string -> unit [@@js.call]

  val end_ : t -> unit [@@js.call]
end

module Readable = struct
  type t = private Ojs.t [@@js]

  val on : t -> string -> Ojs.t -> unit [@@js.call]

  type chunk =
    ([ `String of string
     | `Buffer of Buffer.t
     ]
    [@js.union])
  [@@js]

  let chunk_of_js js_val =
    match Ojs.type_of js_val with
    | "string" ->
      `String ([%js.to: string] js_val)
    | _ ->
      `Buffer ([%js.to: Buffer.t] js_val)

  let on t = function
    | `Close f ->
      on t "close" @@ [%js.of: unit -> unit] f
    | `Data f ->
      on t "data" @@ [%js.of: chunk:chunk -> unit] f
    | `End f ->
      on t "end" @@ [%js.of: unit -> unit] f
    | `Error f ->
      on t "error" @@ [%js.of: err:Error.t -> unit] f
    | `Pause f ->
      on t "pause" @@ [%js.of: unit -> unit] f
    | `Readable f ->
      on t "readable" @@ [%js.of: unit -> unit] f
    | `Resume f ->
      on t "resume" @@ [%js.of: unit -> unit] f

  val destroy : t -> ?error:Error.t -> unit -> t [@@js.call]

  val destroyed : t -> bool [@@js.get]

  val isPaused : t -> bool [@@js.get]

  val pause : t -> t [@@js.get]

  module PipeOptions = struct
    type t = private Ojs.t [@@js]

    val create : ?end_:bool -> unit -> t [@@js.builder]
  end

  val pipe : t -> Writable.t -> ?options:PipeOptions.t -> unit -> Writable.t
    [@@js.call]

  val read : t -> ?size:int -> unit -> Buffer.t or_undefined [@@js.call]

  val readable : t -> bool [@@js.get]

  val readableEncoding : t -> string or_undefined [@@js.get]

  val readableEnded : t -> bool [@@js.get]

  val readableFlowing : t -> bool [@@js.get]

  val readableHighWaterMark : t -> int [@@js.get]

  val readableLength : t -> int [@@js.get]

  val readableObjectMode : t -> bool [@@js.get]

  val resume : t -> t [@@js.get]

  val setEncoding : t -> string -> t [@@js.call]

  val unpipe : t -> ?destination:Writable.t -> unit -> t [@@js.call]

  val unshift : t -> Buffer.t -> string -> unit [@@js.call]

  (* val wrap : t -> (stream) [@@js.get] *)
end

module Duplex = struct
  type t = private Ojs.t [@@js]

  val on : t -> string -> Ojs.t -> unit [@@js.call]

  type chunk =
    ([ `String of string
     | `Buffer of Buffer.t
     ]
    [@js.union])
  [@@js]

  let chunk_of_js js_val =
    match Ojs.type_of js_val with
    | "string" ->
      `String ([%js.to: string] js_val)
    | _ ->
      `Buffer ([%js.to: Buffer.t] js_val)

  let on t = function
    | `Close f ->
      on t "close" @@ [%js.of: unit -> unit] f
    | `Data f ->
      on t "data" @@ [%js.of: chunk:chunk -> unit] f
    | `End f ->
      on t "end" @@ [%js.of: unit -> unit] f
    | `Error f ->
      on t "error" @@ [%js.of: err:Error.t -> unit] f
    | `Pause f ->
      on t "pause" @@ [%js.of: unit -> unit] f
    | `Readable f ->
      on t "readable" @@ [%js.of: unit -> unit] f
    | `Resume f ->
      on t "resume" @@ [%js.of: unit -> unit] f
    | `Drain f ->
      on t "drain" @@ [%js.of: unit -> unit] f
    | `Finish f ->
      on t "finish" @@ [%js.of: unit -> unit] f
    | `Pipe f ->
      on t "pipe" @@ [%js.of: src:t -> unit] f
    | `Unpipe f ->
      on t "unpipe" @@ [%js.of: src:t -> unit] f

  val write : t -> string -> unit [@@js.call]

  val end_ : t -> unit [@@js.call]
end
