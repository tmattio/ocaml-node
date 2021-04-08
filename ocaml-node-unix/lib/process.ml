open Import

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
  | platform ->
    print_endline (Printf.sprintf "Unsupported architecture %s" platform);
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
  | "x86_32" | "x32" ->
    X32
  | "x86_64" | "x64" ->
    X64
  | arch ->
    print_endline (Printf.sprintf "Unsupported architecture %s" arch);
    assert false

let env =
  let open Result.Syntax in
  let@ () = handle_sys_error in
  let+ env = Luv.Env.environ () in
  List.to_seq env |> String_map.of_seq

let argv = Sys.argv |> Array.to_list

let cwd () = Sys.getcwd ()

let arch =
  let open Result.Syntax in
  let@ () = handle_sys_error in
  let+ uname = Luv.System_info.uname () in
  uname.Luv.System_info.Uname.machine |> arch_of_string

let homedir () = Result.to_option (Luv.Path.homedir ())

let platform =
  let open Result.Syntax in
  let@ () = handle_sys_error in
  let+ uname = Luv.System_info.uname () in
  uname.Luv.System_info.Uname.sysname
  |> String.lowercase_ascii
  |> platform_of_string
