open Import

module Blob = struct
  type t = private Ojs.t [@@js]

  val arrayBuffer : t -> ArrayBuffer.t Promise.t [@@js.get]

  val size : t -> int [@@js.get]

  val slice : t -> ?start:int -> ?end_:int -> ?type_:string -> unit -> t
    [@@js.call]

  val text : t -> string Promise.t [@@js.get]

  val type_ : t -> string [@@js.get "type"]

  module Options = struct
    type t = private Ojs.t [@@js]

    val create : ?encoding:string -> ?type_:string -> unit -> t [@@js.builder]
  end

  val create
    :  ?source:
         ([ `Strings of string list
          | `ArrayBuffers of ArrayBuffer.t list
          | `Blobs of t list
          ][@js.union])
    -> ?type_:string
    -> unit
    -> t
    [@@js.builder]
end

module Buffer = struct
  type t = private Ojs.t [@@js]

  val alloc
    :  int
    -> ?fill:
         ([ `String of string
          | `Buffer of t
          | `Uint8Array of Uint8Array.t
          | `Int of int
          ][@js.union])
    -> ?encoding:string
    -> unit
    -> unit
    [@@js.global "buffer.Buffer.alloc"]

  val allocUnsafe : int -> unit [@@js.global "buffer.Buffer.allocUnsafe"]

  val allocUnsafeSlow : int -> unit
    [@@js.global "buffer.Buffer.allocUnsafeSlow"]

  val byteLength
    :  ([ `String of string | `Buffer of t | `ArrayBuffer of ArrayBuffer.t ]
       [@js.union])
    -> ?encoding:string
    -> unit
    -> int
    [@@js.global "buffer.Buffer.byteLength"]

  val compare : t -> t -> int [@@js.global "buffer.Buffer.compare"]

  val concat : t list -> t [@@js.global "buffer.Buffer.concat"]

  let append buf other = buf := concat [ !buf; other ]

  val from_array : int list -> t [@@js.global "buffer.Buffer.from"]

  val from_array_buffer
    :  ArrayBuffer.t
    -> ?byteOffset:int
    -> ?length:int
    -> unit
    -> t
    [@@js.global "buffer.Buffer.from"]

  val from_buffer : t -> t [@@js.global "buffer.Buffer.from"]

  val from_string : string -> ?encoding:string -> unit -> t
    [@@js.global "buffer.Buffer.from"]

  val isBuffer : Ojs.t -> bool [@@js.global "buffer.Buffer.isBuffer"]

  val isEncoding : string -> bool [@@js.global "buffer.Buffer.isEncoding"]

  val poolSize : int [@@js.global "buffer.Buffer.poolSize"]

  (* TODO: How to bind index operators? *)
  (* val index: t -> int -> int [@@js.call] *)

  val buffer : t -> ArrayBuffer.t [@@js.get]

  val byteOffset : t -> int [@@js.get]

  val compare_with
    :  t
    -> t
    -> ?targetStart:int
    -> ?targetEnd:int
    -> ?sourceStart:int
    -> ?sourceEnd:int
    -> unit
    -> int
    [@@js.call]

  val copy
    :  t
    -> t
    -> ?targetStart:int
    -> ?sourceStart:int
    -> ?sourceEnd:int
    -> unit
    -> int
    [@@js.call]

  (* TODO: bind Iterator *)
  (* val entries: t -> () [@@js.get] *)

  val equals : t -> t -> bool [@@js.call]

  val fill
    :  t
    -> ([ `String of string
        | `Buffer of t
        | `Uint8Array of Uint8Array.t
        | `Int of int
        ]
       [@js.union])
    -> ?offset:int
    -> ?end_:int
    -> ?encoding:string
    -> unit
    -> t
    [@@js.call]

  val includes
    :  t
    -> ([ `String of string
        | `Buffer of t
        | `Uint8Array of Uint8Array.t
        | `Int of int
        ]
       [@js.union])
    -> ?byteOffset:int
    -> ?encoding:string
    -> unit
    -> bool
    [@@js.call]

  val indexOf
    :  t
    -> ([ `String of string
        | `Buffer of t
        | `Uint8Array of Uint8Array.t
        | `Int of int
        ]
       [@js.union])
    -> ?byteOffset:int
    -> ?encoding:string
    -> unit
    -> int
    [@@js.call]

  (* TODO: bind Iterator *)
  (* val keys: t -> () [@@js.get] *)

  val lastIndexOf
    :  t
    -> ([ `String of string
        | `Buffer of t
        | `Uint8Array of Uint8Array.t
        | `Int of int
        ]
       [@js.union])
    -> ?byteOffset:int
    -> ?encoding:string
    -> unit
    -> int
    [@@js.call]

  val length : t -> int [@@js.get]

  val readBigInt64BE : t -> ?offset:int -> unit -> int [@@js.call]

  val readBigInt64LE : t -> ?offset:int -> unit -> int [@@js.call]

  val readBigUInt64BE : t -> ?offset:int -> unit -> int [@@js.call]

  val readBigUInt64LE : t -> ?offset:int -> unit -> int [@@js.call]

  val readDoubleBE : t -> ?offset:int -> unit -> int [@@js.call]

  val readDoubleLE : t -> ?offset:int -> unit -> int [@@js.call]

  val readFloatBE : t -> ?offset:int -> unit -> int [@@js.call]

  val readFloatLE : t -> ?offset:int -> unit -> int [@@js.call]

  val readInt8 : t -> ?offset:int -> unit -> int [@@js.call]

  val readInt16BE : t -> ?offset:int -> unit -> int [@@js.call]

  val readInt16LE : t -> ?offset:int -> unit -> int [@@js.call]

  val readInt32BE : t -> ?offset:int -> unit -> int [@@js.call]

  val readInt32LE : t -> ?offset:int -> unit -> int [@@js.call]

  val readIntBE : t -> ?offset:int -> ?byteLength:int -> unit -> int [@@js.call]

  val readIntLE : t -> ?offset:int -> ?byteLength:int -> unit -> int [@@js.call]

  val readUInt8 : t -> ?offset:int -> unit -> int [@@js.call]

  val readUInt16BE : t -> ?offset:int -> unit -> int [@@js.call]

  val readUInt16LE : t -> ?offset:int -> unit -> int [@@js.call]

  val readUInt32BE : t -> ?offset:int -> unit -> int [@@js.call]

  val readUInt32LE : t -> ?offset:int -> unit -> int [@@js.call]

  val readUIntBE : t -> ?offset:int -> ?byteLength:int -> unit -> int
    [@@js.call]

  val readUIntLE : t -> ?offset:int -> ?byteLength:int -> unit -> int
    [@@js.call]

  val subarray : t -> ?start:int -> ?end_:int -> unit -> t [@@js.call]

  val slice : t -> ?start:int -> ?end_:int -> unit -> t [@@js.call]

  val swap16 : t -> t [@@js.call]

  val swap32 : t -> t [@@js.call]

  val swap64 : t -> t [@@js.call]

  val toJSON : t -> Ojs.t [@@js.call]

  val toString
    :  t
    -> ?encoding:string
    -> ?start:int
    -> ?end_:int
    -> unit
    -> string
    [@@js.call]

  (* TODO: bind Iterator *)
  (* val values: t -> () [@@js.get] *)

  val write
    :  t
    -> string
    -> ?offset:int
    -> ?length:int
    -> ?encoding:string
    -> unit
    -> int
    [@@js.call]

  val writeBigInt64BE : t -> int -> ?offset:int -> unit -> int [@@js.call]

  val writeBigInt64LE : t -> int -> ?offset:int -> unit -> int [@@js.call]

  val writeBigUInt64BE : t -> int -> ?offset:int -> unit -> int [@@js.call]

  val writeBigUInt64LE : t -> int -> ?offset:int -> unit -> int [@@js.call]

  val writeDoubleBE : t -> float -> ?offset:int -> unit -> int [@@js.call]

  val writeDoubleLE : t -> float -> ?offset:int -> unit -> int [@@js.call]

  val writeFloatBE : t -> float -> ?offset:int -> unit -> int [@@js.call]

  val writeFloatLE : t -> float -> ?offset:int -> unit -> int [@@js.call]

  val writeInt8 : t -> int -> ?offset:int -> unit -> int [@@js.call]

  val writeInt16BE : t -> int -> ?offset:int -> unit -> int [@@js.call]

  val writeInt16LE : t -> int -> ?offset:int -> unit -> int [@@js.call]

  val writeInt32BE : t -> int -> ?offset:int -> unit -> int [@@js.call]

  val writeInt32LE : t -> int -> ?offset:int -> unit -> int [@@js.call]

  val writeIntBE : t -> int -> int -> int -> int [@@js.call]

  val writeIntLE : t -> int -> int -> int -> int -> int [@@js.call]

  val writeUInt8 : t -> int -> ?offset:int -> unit -> int [@@js.call]

  val writeUInt16BE : t -> int -> ?offset:int -> unit -> int [@@js.call]

  val writeUInt16LE : t -> int -> ?offset:int -> unit -> int [@@js.call]

  val writeUInt32BE : t -> int -> ?offset:int -> unit -> int [@@js.call]

  val writeUInt32LE : t -> int -> ?offset:int -> unit -> int [@@js.call]

  val writeUIntBE : t -> int -> int -> int -> int [@@js.call]

  val writeUIntLE : t -> int -> int -> int -> int [@@js.call]
end

module Constants = struct
  type t = private Ojs.t [@@js]

  val max_length : t -> int [@@js.get "MAX_LENGTH"]

  val max_string_length : t -> int [@@js.get "MAX_STRING_LENGTH"]
end

val inspect_max_bytes : int [@@js.global "INSPECT_MAX_BYTES"]

val kMaxLength : int [@@js.global "kMaxLength"]

val transcode : Buffer.t -> string -> string -> Buffer.t
  [@@js.global "transcode"]

val constants : Constants.t [@@js.global "constants"]
