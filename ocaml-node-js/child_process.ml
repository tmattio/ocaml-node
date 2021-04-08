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
    ?cwd
    ?input
    ?argv0
    ?stdio
    ?env
    ?uid
    ?gid
    ?timeout
    ?kill_signal
    ?max_buffer
    ?encoding
    ?windows_verbatim_arguments
    ?windows_hide
    cmd
    args
  =
  let kill_signal = Option.map (fun x -> `String x) kill_signal in
  let input = Option.map (fun x -> `String x) input in
  let options =
    Node.ChildProcess.SpawnSyncOptions.create
      ?cwd
      ?input
      ?argv0
      ?stdio
      ?env
      ?uid
      ?gid
      ?timeout
      ?killSignal:kill_signal
      ?maxBuffer:max_buffer
      ?encoding
      ?windowsVerbatimArguments:windows_verbatim_arguments
      ?windowsHide:windows_hide
      ()
  in
  let return = Node.ChildProcess.spawnSync ~options cmd ~args () in
  { pid = Node.ChildProcess.SpawnSyncReturn.pid return
  ; output = Node.ChildProcess.SpawnSyncReturn.output return
  ; stdout = Node.ChildProcess.SpawnSyncReturn.stdout return
  ; stderr = Node.ChildProcess.SpawnSyncReturn.stderr return
  ; status = Node.ChildProcess.SpawnSyncReturn.status return
  ; signal = Node.ChildProcess.SpawnSyncReturn.signal return
  ; error =
      Node.ChildProcess.SpawnSyncReturn.error return
      |> Option.map Errors.Error.of_node_error
  }
