module Buffer : sig
  type t

  val to_string : ?encoding:string -> ?start:int -> ?end_:int -> t -> string

  val from_string : ?encoding:string -> string -> t
end

module Errors : sig
  module Error : sig
    type t
  end

  exception Error of Error.t

  module System_error : sig
    type t
  end

  exception System_error of System_error.t
end

module Error = Errors.Error

module Child_process : sig
  type spawn_return =
    { pid : int
    ; output : string list
    ; stdout : string
    ; stderr : string
    ; status : int option
    ; signal : string option
    ; error : Error.t option
    }

  val spawn_sync
    :  ?cwd:string
    -> ?input:string
    -> ?argv0:string
    -> ?stdio:string list
    -> ?env:string Map.Make(String).t
    -> ?uid:int
    -> ?gid:int
    -> ?timeout:int
    -> ?kill_signal:string
    -> ?max_buffer:int
    -> ?encoding:string
    -> ?windows_verbatim_arguments:bool
    -> ?windows_hide:bool
    -> string
    -> string list
    -> spawn_return
end

module Fs : sig
  module Dirent : sig
    type t =
      { name : string
      ; kind :
          [ `UNKNOWN | `FILE | `DIR | `LINK | `FIFO | `SOCKET | `CHAR | `BLOCK ]
      }
  end

  type flag =
    [ `a  (** ["a"] *)
    | `ax  (** ["ax"] *)
    | `a'  (** ["a+"] *)
    | `ax'  (** ["ax+"] *)
    | `as_  (** ["as"] *)
    | `as'  (** ["as+"] *)
    | `r  (** ["r"] *)
    | `r'  (** ["r+"] *)
    | `rs'  (** ["rs+"] *)
    | `w  (** ["w"] *)
    | `wx  (** ["wx"] *)
    | `w'  (** ["w+"] *)
    | `wx'  (** ["wx+"] *)
    ]

  val exists_sync : string -> bool

  (* TODO: Support AbortSignal *)
  val read_file_sync : ?encoding:string -> ?flag:flag -> string -> Buffer.t

  (* TODO: Support AbortSignal *)
  val write_file_sync
    :  ?encoding:string
    -> ?mode:int
    -> ?flag:flag
    -> string
    -> Buffer.t
    -> unit

  val mkdir_sync : ?recursive:bool -> ?mode:int -> string -> unit

  val unlink_sync : string -> unit

  val readdir_sync : ?encoding:string -> string -> Dirent.t list

  val chmod_sync : string -> int -> unit
end

module Process : sig
  type platform =
    | Darwin
    | Freebsd
    | Linux
    | Openbsd
    | Sunos
    | Win32
    | Android

  type arch =
    | Arm
    | Arm64
    | Ia32
    | Mips
    | Mipsel
    | Ppc
    | Ppc64
    | S390
    | S390x
    | X32
    | X64

  val env : string Map.Make(String).t

  val argv : string list

  val cwd : unit -> string

  val platform : platform

  val arch : arch
end

module Os : sig
  type platform = Process.platform =
    | Darwin
    | Freebsd
    | Linux
    | Openbsd
    | Sunos
    | Win32
    | Android

  type arch = Process.arch =
    | Arm
    | Arm64
    | Ia32
    | Mips
    | Mipsel
    | Ppc
    | Ppc64
    | S390
    | S390x
    | X32
    | X64

  val eol : string
  (** The operating system-specific end-of-line marker.

      - ["\n"] on POSIX
      - ["\r\n"] on Windows

      See {{:https://nodejs.org/docs/latest/api/os.html#os_os_eol} [eol]}. *)

  val arch : arch
  (** Returns the operating system CPU architecture for which the Node.js binary
      was compiled. See
      {{:https://nodejs.org/docs/latest/api/os.html#os_os_arch} [arch]}. *)

  val homedir : unit -> string option
  (** Returns the string path of the current user's home directory.

      On POSIX, it uses the $HOME environment variable if defined. Otherwise it
      uses the effective UID to look up the user's home directory.

      On Windows, it uses the USERPROFILE environment variable if defined.
      Otherwise it uses the path to the profile directory of the current user.
      See {{:https://nodejs.org/docs/latest/api/os.html#os_os_homedir}
      [homedir]}. *)

  val platform : platform
  (** Returns the identifier of the operating system platform. The value is set
      at compile time. See
      {{:https://nodejs.org/docs/latest/api/os.html#os_os_platform} [platform]}. *)

  type user_info =
    { username : string
    ; uid : int
    ; gid : int
    ; shell : string option
    ; homedir : string
    }

  val user_info : unit -> user_info
  (** Returns information about the currently effective user. On POSIX
      platforms, this is typically a subset of the password file. The returned
      object includes the username, uid, gid, shell, and homedir. On Windows,
      the uid and gid fields are [-1], and shell is null.

      The value of homedir returned by [user_info ()] is provided by the
      operating system. This differs from the result of [homedir ()], which
      queries environment variables for the home directory before falling back
      to the operating system response.

      Throws a SystemError if a user has no username or homedir. *)

  val version : unit -> string
  (** Returns a string identifying the kernel version.

      On POSIX systems, the operating system release is determined by calling
      [uname(3)]. On Windows, RtlGetVersion() is used, and if it is not
      available, [GetVersionExW()] will be used. See
      https://en.wikipedia.org/wiki/Uname#Examples for more information. *)
end

module Path : sig
  val basename : string -> string

  val delimiter : string

  val dirname : string -> string

  val extname : string -> string

  val is_absolute : string -> bool

  val join : string list -> string

  val normalize : string -> string

  (** A parsed path object generated by path.parse() or consumed by
      path.format(). *)
  type parsed_path =
    { dir : string  (** The root of the path such as '/' or 'c:\' *)
    ; root : string
          (** The full directory path such as '/home/user/dir' or 'c:\path\dir' *)
    ; base : string
          (** The file name including extension (if any) such as 'index.html' *)
    ; name : string  (** The file extension (if any) such as '.html' *)
    ; ext : string
          (** The file name without extension (if any) such as 'index' *)
    }

  val parse : string -> parsed_path

  val relative : string -> string -> string

  val resolve : string list -> string

  val sep : string

  val to_namespaced_path : string -> string
end

module Promise : sig
  type t
end
