open Import

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

let arch =
  let open Result.Syntax in
  let@ () = handle_sys_error in
  let+ uname = Luv.System_info.uname () in
  uname.Luv.System_info.Uname.machine |> Process.arch_of_string

let homedir () = Result.to_option (Luv.Path.homedir ())

let platform =
  let open Result.Syntax in
  let@ () = handle_sys_error in
  let+ uname = Luv.System_info.uname () in
  uname.Luv.System_info.Uname.sysname
  |> String.lowercase_ascii
  |> Process.platform_of_string

let is_windows = platform = Win32

let eol = if is_windows then "\r\n" else "\n"

type user_info = Luv.Passwd.t =
  { username : string
  ; uid : int
  ; gid : int
  ; shell : string option
  ; homedir : string
  }

let user_info () =
  let open Result.Syntax in
  let@ () = handle_sys_error in
  Luv.Passwd.get_passwd ()

let version () =
  let open Result.Syntax in
  let@ () = handle_sys_error in
  let+ uname = Luv.System_info.uname () in
  uname.Luv.System_info.Uname.version
