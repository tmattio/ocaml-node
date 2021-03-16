type t = private Ojs.t [@@js]

val toString : t -> string [@@js.call]

val from : string -> t [@@js.global "buffer.Buffer.from"]

val concat : t list -> t [@@js.global "buffer.Buffer.concat"]

let append buf other = buf := concat [ !buf; other ]

val write
  :  t
  -> string:string
  -> ?offset:int
  -> ?length:int
  -> ?encoding:string
  -> unit
  -> unit
  [@@js.call]
