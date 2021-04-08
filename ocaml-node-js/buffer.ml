type t = Node.Buffer.Buffer.t

let to_string ?encoding ?start ?end_ t =
  Node.Buffer.Buffer.toString ?encoding ?start ?end_ t ()

let from_string ?encoding s = Node.Buffer.Buffer.fromString ?encoding s ()
