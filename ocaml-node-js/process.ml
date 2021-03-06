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

let env = Node.Process.env

let argv = Node.Process.argv

let cwd () = Node.Process.cwd ()

let arch = Node.Process.arch |> arch_of_string

let platform = Node.Process.platform |> platform_of_string
