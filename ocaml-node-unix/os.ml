(* https://github.com/nodejs/node/blob/master/lib/os.js *)

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

let platform_of_string = function
  | "darwin" ->
    Darwin
  | "freebsd" ->
    Freebsd
  | "linux" ->
    Linux
  | "openbsd" ->
    Openbsd
  | "sunos" ->
    Sunos
  | "win32" ->
    Win32
  | "android" ->
    Android
  | _ ->
    assert false

let arch_of_string = function
  | "arm" ->
    Arm
  | "arm64" ->
    Arm64
  | "ia32" ->
    Ia32
  | "mips" ->
    Mips
  | "mipsel" ->
    Mipsel
  | "ppc" ->
    Ppc
  | "ppc64" ->
    Ppc64
  | "s390" ->
    S390
  | "s390x" ->
    S390x
  | "x32" ->
    X32
  | "x64" ->
    X64
  | _ ->
    assert false

let arch =
  match Luv.System_info.uname () with
  | Ok uname ->
    uname.Luv.System_info.Uname.machine |> arch_of_string
  | Error _ ->
    failwith "arch: could not detect system CPU architecture"

let homedir () = Result.to_option (Luv.Path.homedir ())

let platform =
  match Luv.System_info.uname () with
  | Ok uname ->
    uname.Luv.System_info.Uname.sysname
    |> String.lowercase_ascii
    |> platform_of_string
  | Error _ ->
    failwith "platform: could not detect system platform"

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
  match Luv.Passwd.get_passwd () with
  | Ok passwd ->
    passwd
  | Error _ ->
    failwith "version: could not detect system version"

let version () =
  match Luv.System_info.uname () with
  | Ok uname ->
    uname.Luv.System_info.Uname.version
  | Error _ ->
    failwith "version: could not detect system version"
