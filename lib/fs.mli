open Js

[@@@js.scope Import.fs]

module Stats : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  val isBlockDevice : t -> unit -> bool [@@js.call]

  val isCharacterDevice : t -> unit -> bool [@@js.call]

  val isDirectory : t -> unit -> bool [@@js.call]

  val isFIFO : t -> unit -> bool [@@js.call]

  val isFile : t -> unit -> bool [@@js.call]

  val isSocket : t -> unit -> bool [@@js.call]

  val isSymbolicLink : t -> unit -> bool [@@js.call]

  val dev : t -> int [@@js.get]

  val ino : t -> int [@@js.get]

  val mode : t -> int [@@js.get]

  val nlink : t -> int [@@js.get]

  val uid : t -> int [@@js.get]

  val gid : t -> int [@@js.get]

  val rdev : t -> int [@@js.get]

  val size : t -> int [@@js.get]

  val blksize : t -> int [@@js.get]

  val blocks : t -> int [@@js.get]

  val atimeMs : t -> int [@@js.get]

  val mtimeMs : t -> int [@@js.get]

  val ctimeMs : t -> int [@@js.get]

  val birthtimeMs : t -> int [@@js.get]

  val atime : t -> Date.t [@@js.get]

  val mtime : t -> Date.t [@@js.get]

  val ctime : t -> Date.t [@@js.get]

  val birthtime : t -> Date.t [@@js.get]
end

module FileHandle : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  [@@@js.stop]

  val on : t -> [< `Close of unit -> unit ] -> unit

  [@@@js.start]

  [@@@js.implem
  val on : t -> string -> Ojs.t -> unit [@@js.call]

  let on t = function `Close f -> on t "close" @@ [%js.of: unit -> unit] f]

  module AppendFileOptions : sig
    type t

    val t_to_js : t -> Ojs.t

    val t_of_js : Ojs.t -> t

    val create : ?encoding:string -> unit -> t [@@js.builder]
  end

  val appendFile
    :  t
    -> ([ `String of string | `Buffer of Buffer.Buffer.t ][@js.union])
    -> ?options:AppendFileOptions.t
    -> unit
    -> Ojs.t Promise.t
    [@@js.call]

  val chmod : t -> int -> Ojs.t Promise.t [@@js.call]

  val chown : t -> int -> int -> Ojs.t Promise.t [@@js.call]

  val close : t -> unit -> Ojs.t Promise.t [@@js.call]

  val datasync : t -> unit -> Ojs.t Promise.t [@@js.call]

  val fd : t -> int [@@js.get]

  module ReadReturn : sig
    type t

    val t_to_js : t -> Ojs.t

    val t_of_js : Ojs.t -> t

    val bytesRead : t -> int [@@js.get]

    val buffer : t -> Buffer.Buffer.t [@@js.get]
  end

  val read
    :  t
    -> Buffer.Buffer.t
    -> int
    -> int
    -> int
    -> unit
    -> ReadReturn.t Promise.t
    [@@js.call]

  module ReadFileOptions : sig
    type t

    val t_to_js : t -> Ojs.t

    val t_of_js : Ojs.t -> t

    val create : ?encoding:string -> ?signal:Global.AbortSignal.t -> unit -> t
      [@@js.builder]
  end

  val readFile : t -> ReadFileOptions.t -> Buffer.Buffer.t Promise.t [@@js.call]

  module ReadvReturn : sig
    type t

    val t_to_js : t -> Ojs.t

    val t_of_js : Ojs.t -> t

    val bytesRead : t -> int [@@js.get]

    val buffers : t -> Buffer.Buffer.t list [@@js.get]
  end

  val readv
    :  t
    -> Buffer.Buffer.t list
    -> ?position:int
    -> unit
    -> ReadvReturn.t Promise.t
    [@@js.call]

  val stat : t -> unit -> Stats.t [@@js.call]

  val sync : t -> unit -> Ojs.t Promise.t [@@js.call]

  val truncate : t -> int -> Ojs.t Promise.t [@@js.call]

  val utimes : t -> Date.t -> Date.t -> Ojs.t Promise.t [@@js.call]

  module WriteReturn : sig
    type t

    val t_to_js : t -> Ojs.t

    val t_of_js : Ojs.t -> t

    val bytesWritten : t -> int [@@js.get]

    val buffer : t -> Buffer.Buffer.t [@@js.get]
  end

  val write
    :  t
    -> Buffer.Buffer.t
    -> ?offset:int
    -> ?length:int
    -> ?position:int
    -> unit
    -> WriteReturn.t Promise.t
    [@@js.call]

  module WriteFileOptions : sig
    type t

    val t_to_js : t -> Ojs.t

    val t_of_js : Ojs.t -> t

    val create : ?encoding:string -> unit -> t [@@js.builder]
  end

  val writeFile : t -> string -> WriteFileOptions.t -> Ojs.t Promise.t
    [@@js.call]

  module WritevReturn : sig
    type t

    val t_to_js : t -> Ojs.t

    val t_of_js : Ojs.t -> t

    val bytesWritten : t -> int [@@js.get]

    val buffers : t -> Buffer.Buffer.t list [@@js.get]
  end

  val writev
    :  t
    -> Buffer.Buffer.t list
    -> ?position:int
    -> unit
    -> WritevReturn.t Promise.t
    [@@js.call]
end

module CreateWriteStreamOptions : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  val create
    :  ?flags:string
    -> ?encoding:string
    -> ?fd:int
    -> ?mode:int
    -> ?autoClose:bool
    -> ?emitClose:bool
    -> ?start:int
    -> ?fs:Ojs.t
    -> unit
    -> t
    [@@js.builder]
end

val createWriteStream
  :  string
  -> ?options:CreateWriteStreamOptions.t
  -> unit
  -> Stream.Writable.t
  [@@js.global "createWriteStream"]

module CreateReadStreamOptions : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  val create
    :  ?flags:string
    -> ?encoding:string
    -> ?fd:int
    -> ?mode:int
    -> ?autoClose:bool
    -> ?emitClose:bool
    -> ?start:int
    -> ?end_:int
    -> ?highWaterMark:int
    -> ?fs:Ojs.t
    -> unit
    -> t
    [@@js.builder]
end

val createReadStream
  :  string
  -> ?options:CreateReadStreamOptions.t
  -> unit
  -> Stream.Readable.t
  [@@js.global "createReadStream"]

val accessSync : string -> ?mode:int -> unit -> unit
  [@@js.global "accessSync"]

module AppendFileOptions : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  val create : ?encoding:string -> ?mode:int -> ?flag:string -> unit -> t
    [@@js.builder]
end

val appendFileSync
  :  string
  -> Buffer.Buffer.t
  -> ?options:AppendFileOptions.t
  -> unit
  [@@js.global "appendFileSync"]

val chmodSync : string -> int -> unit [@@js.global "chmodSync"]

val chownSync : string -> int -> int -> unit [@@js.global "chownSync"]

val copyFileSync : string -> string -> ?mode:int -> unit -> unit
  [@@js.global "copyFileSync"]

val existsSync : string -> bool [@@js.global "existsSync"]

val lchmodSync : string -> int -> unit [@@js.global "lchmodSync"]

val lchownSync : string -> int -> int -> unit [@@js.global "lchownSync"]

val lutimesSync : string -> Date.t -> Date.t -> unit
  [@@js.global "lutimesSync"]

val linkSync : string -> string -> unit [@@js.global "linkSync"]

module LstatOptions : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  val create : ?recursive:bool -> ?mode:int -> unit -> t [@@js.builder]
end

val lstatSync : string -> ?options:LstatOptions.t -> unit -> Stats.t
  [@@js.global "lstatSync"]

module MkdirOptions : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  val create : ?recursive:bool -> ?mode:string -> unit -> t [@@js.builder]
end

val mkdirSync : string -> ?options:MkdirOptions.t -> unit -> unit
  [@@js.global "mkdirSync"]

module MkdtempOptions : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  val create : ?encoding:string -> unit -> t [@@js.builder]
end

val mkdtempSync : string -> ?options:MkdtempOptions.t -> unit -> string option
  [@@js.global "mkdtempSync"]

module OpendirOptions : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  val create : ?encoding:string -> ?bufferSize:int -> unit -> t [@@js.builder]
end

val opendirSync : string -> ?options:OpendirOptions.t -> unit -> int
  [@@js.global "opendirSync"]

module ReaddirOptions : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  val create : ?encoding:string -> ?withFileTypes:bool -> unit -> t
    [@@js.builder]
end

val readdirSync : string -> ?options:ReaddirOptions.t -> unit -> string list
  [@@js.global "readdirSync"]

module ReadFileOptions : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  val create
    :  ?encoding:string
    -> ?flag:string
    -> ?signal:Global.AbortSignal.t
    -> unit
    -> t
    [@@js.builder]
end

val readFileSync
  :  string
  -> ?options:ReadFileOptions.t
  -> unit
  -> Buffer.Buffer.t
  [@@js.global "readFileSync"]

module ReadlinkOptions : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  val create : ?encoding:string -> unit -> t [@@js.builder]
end

val readlinkSync : string -> ?options:ReadlinkOptions.t -> unit -> unit
  [@@js.global "readlinkSync"]

module RealpathOptions : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  val create : ?encoding:string -> unit -> t [@@js.builder]
end

val realpathSync : string -> ?options:RealpathOptions.t -> unit -> unit
  [@@js.global "realpathSync"]

val renameSync : string -> string -> unit [@@js.global "renameSync"]

module RmdirOptions : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  val create
    :  ?maxRetries:int
    -> ?recursive:bool
    -> ?retryDelay:int
    -> unit
    -> t
    [@@js.builder]
end

val rmdirSync : string -> ?options:RmdirOptions.t -> unit -> unit
  [@@js.global "rmdirSync"]

module RmOptions : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  val create
    :  ?force:bool
    -> ?maxRetries:int
    -> ?recursive:bool
    -> ?retryDelay:int
    -> unit
    -> t
    [@@js.builder]
end

val rmSync : string -> ?options:RmOptions.t -> unit -> unit
  [@@js.global "rmSync"]

val statSync : string -> unit -> unit [@@js.global "statSync"]

val symlinkSync : string -> string -> ?type_:string -> unit -> unit
  [@@js.global "symlinkSync"]

val truncateSync : string -> ?len:int -> unit -> unit
  [@@js.global "truncateSync"]

val unlinkSync : string -> unit -> unit [@@js.global "unlinkSync"]

val utimesSync : string -> Date.t -> Date.t -> unit
  [@@js.global "utimesSync"]

module WatchOptions : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  val create
    :  ?persistent:bool
    -> ?recursive:bool
    -> ?encoding:string
    -> ?signal:Global.AbortSignal.t
    -> unit
    -> t
    [@@js.builder]
end

module WriteFileOptions : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  val create
    :  ?encoding:string
    -> ?mode:int
    -> ?flag:string
    -> ?signal:Global.AbortSignal.t
    -> unit
    -> t
    [@@js.builder]
end

val writeFileSync
  :  string
  -> Buffer.Buffer.t
  -> ?options:WriteFileOptions.t
  -> unit
  -> unit
  [@@js.global "writeFileSync"]

module Promise : sig
  [@@@js.scope Import.fs_promises]

  val access : string -> ?mode:int -> unit -> Ojs.t Promise.t
    [@@js.global "access"]

  val appendFile
    :  string
    -> Buffer.Buffer.t
    -> ?options:AppendFileOptions.t
    -> Ojs.t Promise.t
    [@@js.global "appendFile"]

  val chmod : string -> int -> Ojs.t Promise.t [@@js.global "chmod"]

  val chown : string -> int -> int -> Ojs.t Promise.t
    [@@js.global "chown"]

  val copyFile : string -> string -> ?mode:int -> unit -> Ojs.t Promise.t
    [@@js.global "copyFile"]

  val lchmod : string -> int -> Ojs.t Promise.t
    [@@js.global "lchmod"]

  val lchown : string -> int -> int -> Ojs.t Promise.t
    [@@js.global "lchown"]

  val lutimes : string -> Date.t -> Date.t -> Ojs.t Promise.t
    [@@js.global "lutimes"]

  val link : string -> string -> Ojs.t Promise.t [@@js.global "link"]

  val lstat : string -> ?options:LstatOptions.t -> unit -> Ojs.t Promise.t
    [@@js.global "lstat"]

  val mkdir : string -> ?options:MkdirOptions.t -> unit -> Ojs.t Promise.t
    [@@js.global "mkdir"]

  val mkdtemp : string -> ?options:MkdtempOptions.t -> unit -> Ojs.t Promise.t
    [@@js.global "mkdtemp"]

  val open_ : string -> string -> ?mode:int -> unit -> Ojs.t Promise.t
    [@@js.global "open"]

  val opendir : string -> ?options:OpendirOptions.t -> unit -> Ojs.t Promise.t
    [@@js.global "opendir"]

  val readdir
    :  string
    -> ?options:ReaddirOptions.t
    -> unit
    -> string list Promise.t
    [@@js.global "readdir"]

  val readFile
    :  string
    -> ?options:ReadFileOptions.t
    -> unit
    -> Buffer.Buffer.t Promise.t
    [@@js.global "readFile"]

  val readlink : string -> ?options:ReadlinkOptions.t -> unit -> Ojs.t Promise.t
    [@@js.global "readlink"]

  val realpath : string -> ?options:RealpathOptions.t -> unit -> Ojs.t Promise.t
    [@@js.global "realpath"]

  val rename : string -> string -> Ojs.t Promise.t
    [@@js.global "rename"]

  val rmdir : string -> ?options:RmdirOptions.t -> unit -> Ojs.t Promise.t
    [@@js.global "rmdir"]

  val rm : string -> ?options:RmOptions.t -> unit -> Ojs.t Promise.t
    [@@js.global "rm"]

  val stat : string -> unit -> Ojs.t Promise.t [@@js.global "stat"]

  val symlink : string -> string -> ?type_:string -> unit -> Ojs.t Promise.t
    [@@js.global "symlink"]

  val truncate : string -> ?len:int -> unit -> Ojs.t Promise.t
    [@@js.global "truncate"]

  val unlink : string -> unit -> Ojs.t Promise.t
    [@@js.global "unlink"]

  val utimes : string -> Date.t -> Date.t -> Ojs.t Promise.t
    [@@js.global "utimes"]

  val watch : string -> ?options:WatchOptions.t -> unit -> Ojs.t Promise.t
    [@@js.global "watch"]

  val writeFile
    :  string
    -> Buffer.Buffer.t
    -> ?options:WriteFileOptions.t
    -> unit
    -> Ojs.t Promise.t
    [@@js.global "writeFile"]
end
