open Import

module Blob : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val arrayBuffer : t -> ArrayBuffer.t Promise.t

  val size : t -> int

  val slice : t -> ?start:int -> ?end_:int -> ?type_:string -> unit -> t

  val text : t -> string Promise.t

  val type_ : t -> string

  module Options : sig
    type t

    val t_of_js : Ojs.t -> t

    val t_to_js : t -> Ojs.t

    val create : ?encoding:string -> ?type_:string -> unit -> t
  end

  val create
    :  ?source:
         [ `ArrayBuffers of ArrayBuffer.t list
         | `Blobs of t list
         | `Strings of string list
         ]
    -> ?type_:string
    -> unit
    -> t
end

module Buffer : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val alloc
    :  int
    -> ?fill:
         [ `Buffer of t
         | `Int of int
         | `String of string
         | `Uint8Array of Uint8Array.t
         ]
    -> ?encoding:string
    -> unit
    -> unit

  val allocUnsafe : int -> unit

  val allocUnsafeSlow : int -> unit

  val byteLength
    :  [ `ArrayBuffer of ArrayBuffer.t | `Buffer of t | `String of string ]
    -> ?encoding:string
    -> unit
    -> int

  val compare : t -> t -> int

  val append : t ref -> t -> unit

  val concat : t list -> t

  val from_array : int list -> t

  val from_array_buffer
    :  ArrayBuffer.t
    -> ?byteOffset:int
    -> ?length:int
    -> unit
    -> t

  val from_buffer : t -> t

  val from_string : string -> ?encoding:string -> unit -> t

  val isBuffer : t -> bool

  val isEncoding : string -> bool

  val poolSize : int

  val buffer : t -> ArrayBuffer.t

  val byteOffset : t -> int

  val compare_with
    :  t
    -> t
    -> ?targetStart:int
    -> ?targetEnd:int
    -> ?sourceStart:int
    -> ?sourceEnd:int
    -> unit
    -> int

  val copy
    :  t
    -> t
    -> ?targetStart:int
    -> ?sourceStart:int
    -> ?sourceEnd:int
    -> unit
    -> int

  val equals : t -> t -> bool

  val fill
    :  t
    -> [ `Buffer of t
       | `Int of int
       | `String of string
       | `Uint8Array of Uint8Array.t
       ]
    -> ?offset:int
    -> ?end_:int
    -> ?encoding:string
    -> unit
    -> t

  val includes
    :  t
    -> [ `Buffer of t
       | `Int of int
       | `String of string
       | `Uint8Array of Uint8Array.t
       ]
    -> ?byteOffset:int
    -> ?encoding:string
    -> unit
    -> bool

  val indexOf
    :  t
    -> [ `Buffer of t
       | `Int of int
       | `String of string
       | `Uint8Array of Uint8Array.t
       ]
    -> ?byteOffset:int
    -> ?encoding:string
    -> unit
    -> int

  val lastIndexOf
    :  t
    -> [ `Buffer of t
       | `Int of int
       | `String of string
       | `Uint8Array of Uint8Array.t
       ]
    -> ?byteOffset:int
    -> ?encoding:string
    -> unit
    -> int

  val length : t -> int

  val readBigInt64BE : t -> ?offset:int -> unit -> int

  val readBigInt64LE : t -> ?offset:int -> unit -> int

  val readBigUInt64BE : t -> ?offset:int -> unit -> int

  val readBigUInt64LE : t -> ?offset:int -> unit -> int

  val readDoubleBE : t -> ?offset:int -> unit -> int

  val readDoubleLE : t -> ?offset:int -> unit -> int

  val readFloatBE : t -> ?offset:int -> unit -> int

  val readFloatLE : t -> ?offset:int -> unit -> int

  val readInt8 : t -> ?offset:int -> unit -> int

  val readInt16BE : t -> ?offset:int -> unit -> int

  val readInt16LE : t -> ?offset:int -> unit -> int

  val readInt32BE : t -> ?offset:int -> unit -> int

  val readInt32LE : t -> ?offset:int -> unit -> int

  val readIntBE : t -> ?offset:int -> ?byteLength:int -> unit -> int

  val readIntLE : t -> ?offset:int -> ?byteLength:int -> unit -> int

  val readUInt8 : t -> ?offset:int -> unit -> int

  val readUInt16BE : t -> ?offset:int -> unit -> int

  val readUInt16LE : t -> ?offset:int -> unit -> int

  val readUInt32BE : t -> ?offset:int -> unit -> int

  val readUInt32LE : t -> ?offset:int -> unit -> int

  val readUIntBE : t -> ?offset:int -> ?byteLength:int -> unit -> int

  val readUIntLE : t -> ?offset:int -> ?byteLength:int -> unit -> int

  val subarray : t -> ?start:int -> ?end_:int -> unit -> t

  val slice : t -> ?start:int -> ?end_:int -> unit -> t

  val swap16 : t -> t

  val swap32 : t -> t

  val swap64 : t -> t

  val toJSON : t -> t

  val toString
    :  t
    -> ?encoding:string
    -> ?start:int
    -> ?end_:int
    -> unit
    -> string

  val write
    :  t
    -> string
    -> ?offset:int
    -> ?length:int
    -> ?encoding:string
    -> unit
    -> int

  val writeBigInt64BE : t -> int -> ?offset:int -> unit -> int

  val writeBigInt64LE : t -> int -> ?offset:int -> unit -> int

  val writeBigUInt64BE : t -> int -> ?offset:int -> unit -> int

  val writeBigUInt64LE : t -> int -> ?offset:int -> unit -> int

  val writeDoubleBE : t -> float -> ?offset:int -> unit -> int

  val writeDoubleLE : t -> float -> ?offset:int -> unit -> int

  val writeFloatBE : t -> float -> ?offset:int -> unit -> int

  val writeFloatLE : t -> float -> ?offset:int -> unit -> int

  val writeInt8 : t -> int -> ?offset:int -> unit -> int

  val writeInt16BE : t -> int -> ?offset:int -> unit -> int

  val writeInt16LE : t -> int -> ?offset:int -> unit -> int

  val writeInt32BE : t -> int -> ?offset:int -> unit -> int

  val writeInt32LE : t -> int -> ?offset:int -> unit -> int

  val writeIntBE : t -> int -> int -> int -> int

  val writeIntLE : t -> int -> int -> int -> int -> int

  val writeUInt8 : t -> int -> ?offset:int -> unit -> int

  val writeUInt16BE : t -> int -> ?offset:int -> unit -> int

  val writeUInt16LE : t -> int -> ?offset:int -> unit -> int

  val writeUInt32BE : t -> int -> ?offset:int -> unit -> int

  val writeUInt32LE : t -> int -> ?offset:int -> unit -> int

  val writeUIntBE : t -> int -> int -> int -> int

  val writeUIntLE : t -> int -> int -> int -> int
end

module Constants : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val max_length : t -> int

  val max_string_length : t -> int
end

val inspect_max_bytes : int

val kMaxLength : int

val transcode : Buffer.t -> string -> string -> Buffer.t

val constants : Constants.t
