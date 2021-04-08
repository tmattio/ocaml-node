type t = Luv.Buffer.t

let sub ?start ?end_ t =
  match start, end_ with
  | Some start, Some end_ ->
    let length = end_ - start in
    Luv.Buffer.sub ~offset:start ~length t
  | None, Some end_ ->
    Luv.Buffer.sub ~offset:0 ~length:end_ t
  | Some start, None ->
    let length = Luv.Buffer.size t - start in
    Luv.Buffer.sub ~offset:0 ~length t
  | None, None ->
    t

let to_string ?encoding:_ ?start ?end_ t =
  (* TOOD: Support encoding *)
  let t = sub ?start ?end_ t in
  Luv.Buffer.to_string t

let alloc = Luv.Buffer.create

let from_string ?encoding:_ s = Luv.Buffer.from_string s
