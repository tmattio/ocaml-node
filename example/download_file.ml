open Node

let () =
  let file = Fs.createWriteStream "file.jpg" () in
  let (_ : Http.ClientRequest.t) =
    Https.get
      "http://i3.ytimg.com/vi/J---aiyznGQ/mqdefault.jpg"
      ~callback:(fun response ->
        let (_ : Stream.Writable.t) =
          Http.IncomingMessage.pipe response file ()
        in
        ())
      ()
  in
  ()
