open Js

[@@@js.scope Import.tty]

module ReadStream : sig
  include module type of struct
    include Net.Socket
  end

  val isRaw : t -> bool [@@js.get]

  val isTTY : t -> bool [@@js.get]

  val setRawMode : t -> int -> unit [@@js.call]
end

module WriteStream : sig
  include module type of struct
    include Net.Socket
  end

  [@@@js.stop]

  val on : t -> [< `Resize of unit -> unit ] -> unit

  [@@@js.start]

  [@@@js.implem
  val on : t -> string -> Ojs.t -> unit [@@js.call]

  let on t = function `Resize f -> on t "resize" @@ [%js.of: unit -> unit] f]

  val clearLine : t -> int -> ?callback:(unit -> unit) -> unit -> bool
    [@@js.call]

  val clearScreenDown : t -> ?callback:(unit -> unit) -> unit -> bool
    [@@js.call]

  val columns : t -> int [@@js.get]

  val cursorTo
    :  t
    -> x:int
    -> ?y:int
    -> ?callback:(unit -> unit)
    -> unit
    -> bool
    [@@js.call]

  val getColorDepth : t -> ?env:string Dict.t -> unit -> int [@@js.call]

  val getWindowSize : t -> unit -> int list [@@js.call]

  val hasColors : t -> ?count:int -> ?env:string Dict.t -> bool [@@js.call]

  val isTTY : t -> bool [@@js.get]

  val moveCursor
    :  t
    -> dx:int
    -> dy:int
    -> ?callback:(unit -> unit)
    -> unit
    -> bool
    [@@js.call]

  val rows : t -> int [@@js.get]
end

val isatty : int -> bool [@@js.global "isatty"]
