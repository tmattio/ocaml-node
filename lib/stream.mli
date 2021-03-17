open Import

module Writable : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val on
    :  t
    -> [< `Close of unit -> unit
       | `Drain of unit -> unit
       | `Error of err:Error.t -> unit
       | `Finish of unit -> unit
       | `Pipe of src:t -> unit
       | `Unpipe of src:t -> unit
       ]
    -> unit

  val write : t -> string -> unit

  val end_ : t -> unit
end

module Readable : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  type chunk =
    [ `Buffer of Buffer.Buffer.t
    | `String of string
    ]

  val on
    :  t
    -> [ `Close of unit -> unit
       | `Data of chunk:chunk -> unit
       | `End of unit -> unit
       | `Error of err:Error.t -> unit
       | `Pause of unit -> unit
       | `Readable of unit -> unit
       | `Resume of unit -> unit
       ]
    -> unit

  val destroy : t -> ?error:Error.t -> unit -> t

  val destroyed : t -> bool

  val isPaused : t -> bool

  val pause : t -> t

  module PipeOptions : sig
    type t

    val t_of_js : Ojs.t -> t

    val t_to_js : t -> Ojs.t

    val create : ?end_:bool -> unit -> t
  end

  val pipe : t -> Writable.t -> ?options:PipeOptions.t -> unit -> Writable.t

  val read : t -> ?size:int -> unit -> Buffer.Buffer.t or_undefined

  val readable : t -> bool

  val readableEncoding : t -> string or_undefined

  val readableEnded : t -> bool

  val readableFlowing : t -> bool

  val readableHighWaterMark : t -> int

  val readableLength : t -> int

  val readableObjectMode : t -> bool

  val resume : t -> t

  val setEncoding : t -> string -> t

  val unpipe : t -> ?destination:Writable.t -> unit -> t

  val unshift : t -> Buffer.Buffer.t -> string -> unit
end

module Duplex : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  type chunk =
    [ `Buffer of Buffer.Buffer.t
    | `String of string
    ]

  val on
    :  t
    -> [< `Close of unit -> unit
       | `Data of chunk:chunk -> unit
       | `Drain of unit -> unit
       | `End of unit -> unit
       | `Error of err:Error.t -> unit
       | `Finish of unit -> unit
       | `Pause of unit -> unit
       | `Pipe of src:t -> unit
       | `Readable of unit -> unit
       | `Resume of unit -> unit
       | `Unpipe of src:t -> unit
       ]
    -> unit

  val write : t -> string -> unit

  val end_ : t -> unit
end
