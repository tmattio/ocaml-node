type spawn_return =
  { pid : int
  ; output : string list
  ; stdout : string
  ; stderr : string
  ; status : int option
  ; signal : string option
  ; error : Errors.Error.t option
  }

let spawn_sync
    ?cwd:_
    ?input:_
    ?argv0:_
    ?stdio:_
    ?env:_
    ?uid:_
    ?gid:_
    ?timeout:_
    ?kill_signal:_
    ?max_buffer:_
    ?encoding:_
    ?windows_verbatim_arguments:_
    ?windows_hide:_
    _cmd
    _args
  =
  failwith "TODO"
