let basename = Node.Path.basename

let delimiter = Node.Path.delimiter

let dirname = Node.Path.dirname

let extname = Node.Path.extname

let is_absolute = Node.Path.isAbsolute

let join = Node.Path.join

let normalize = Node.Path.normalize

type parsed_path =
  { dir : string
  ; root : string
  ; base : string
  ; name : string
  ; ext : string
  }

let parse t =
  let parsed_path = Node.Path.parse t in
  { dir = Node.Path.PathObject.dir parsed_path
  ; root = Node.Path.PathObject.root parsed_path
  ; base = Node.Path.PathObject.base parsed_path
  ; name = Node.Path.PathObject.name parsed_path
  ; ext = Node.Path.PathObject.ext parsed_path
  }

let relative from to_ = Node.Path.relative ~from ~to_

let resolve = Node.Path.resolve

let sep = Node.Path.sep

let to_namespaced_path = Node.Path.toNamespacedPath
