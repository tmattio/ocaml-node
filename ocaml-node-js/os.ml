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

let eol = Node.Os.eol ()

let arch = Node.Os.arch () |> arch_of_string

let homedir = Node.Os.homedir

let platform = Node.Os.platform () |> platform_of_string

type user_info =
  { username : string
  ; uid : int
  ; gid : int
  ; shell : string option
  ; homedir : string
  }

let version () = Node.Os.version ()

let user_info () =
  let user_info = Node.Os.userInfo () in
  { username = Node.Os.UserInfo.username user_info
  ; uid = Node.Os.UserInfo.uid user_info
  ; gid = Node.Os.UserInfo.gid user_info
  ; shell = Node.Os.UserInfo.shell user_info
  ; homedir = Node.Os.UserInfo.homedir user_info
  }
