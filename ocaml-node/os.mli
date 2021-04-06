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

val eol : string
(** The operating system-specific end-of-line marker.

    - ["\n"] on POSIX
    - ["\r\n"] on Windows

    See {{:https://nodejs.org/docs/latest/api/os.html#os_os_eol} [eol]}. *)

val arch : arch
(** Returns the operating system CPU architecture for which the Node.js binary
    was compiled. See {{:https://nodejs.org/docs/latest/api/os.html#os_os_arch}
    [arch]}. *)

val homedir : unit -> string option
(** Returns the string path of the current user's home directory.

    On POSIX, it uses the $HOME environment variable if defined. Otherwise it
    uses the effective UID to look up the user's home directory.

    On Windows, it uses the USERPROFILE environment variable if defined.
    Otherwise it uses the path to the profile directory of the current user. See
    {{:https://nodejs.org/docs/latest/api/os.html#os_os_homedir} [homedir]}. *)

val platform : platform
(** Returns the identifier of the operating system platform. The value is set at
    compile time. See
    {{:https://nodejs.org/docs/latest/api/os.html#os_os_platform} [platform]}. *)

type user_info =
  { username : string
  ; uid : int
  ; gid : int
  ; shell : string option
  ; homedir : string
  }

val user_info : unit -> user_info
(** Returns information about the currently effective user. On POSIX platforms,
    this is typically a subset of the password file. The returned object
    includes the username, uid, gid, shell, and homedir. On Windows, the uid and
    gid fields are [-1], and shell is null.

    The value of homedir returned by [user_info ()] is provided by the operating
    system. This differs from the result of [homedir ()], which queries
    environment variables for the home directory before falling back to the
    operating system response.

    Throws a SystemError if a user has no username or homedir. *)

val version : unit -> string
(** Returns a string identifying the kernel version.

    On POSIX systems, the operating system release is determined by calling
    [uname(3)]. On Windows, RtlGetVersion() is used, and if it is not available,
    [GetVersionExW()] will be used. See
    https://en.wikipedia.org/wiki/Uname#Examples for more information. *)
