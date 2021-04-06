module Untyped : sig
  type t = private Ojs.t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  val new_ : (resolve:(Ojs.t -> unit) -> reject:(Ojs.t -> unit) -> unit) -> t
    [@@js.new "Promise"]

  [@@@js.stop]

  val return : Ojs.t -> t

  val fail : Ojs.t -> t

  val bind : ?error:(Ojs.t -> t) -> t -> (Ojs.t -> t) -> t

  val all : Ojs.t list -> t

  [@@@js.start]

  [@@@js.implem
  val resolve : Ojs.t -> Ojs.t [@@js.global "Promise.resolve"]

  val reject : Ojs.t -> Ojs.t [@@js.global "Promise.reject"]

  val then_
    :  Ojs.t
    -> success:(Ojs.t -> Ojs.t)
    -> error:(Ojs.t -> Ojs.t)
    -> Ojs.t
    [@@js.call "then"]

  val all : Ojs.t list -> Ojs.t [@@js.global "Promise.all"]

  type wrap = { content : Ojs.t } [@@js]

  let is_promise o = resolve o == o

  let wrap o =
    if is_promise o then
      wrap_to_js { content = o }
    else
      o

  let unwrap o =
    if Ojs.has_property o "content" then
      Ojs.get_prop_ascii o "content"
    else
      o

  let return x = resolve (wrap x)

  let fail err = reject (wrap err)

  let bind ?(error = fail) p f =
    then_ p ~success:(fun x -> f (unwrap x)) ~error:(fun x -> error (unwrap x))]
end

[@@@js.stop]

type 'a t

val t_to_js : ('a -> Ojs.t) -> 'a t -> Ojs.t

val t_of_js : (Ojs.t -> 'a) -> Ojs.t -> 'a t

type error = Ojs.t

val make : (resolve:('a -> unit) -> reject:('a -> unit) -> unit) -> 'a t

val fail : error -> 'a t

val return : 'a -> 'a t

val bind : ?error:(error -> 'b t) -> 'a t -> ('a -> 'b t) -> 'b t

val map : ('a -> 'b) -> 'a t -> 'b t

val both : 'a t -> 'b t -> ('a * 'b) t

val all : 'a t list -> 'a list t

val ( let+ ) : 'a t -> ('a -> 'b) -> 'b t

val ( and+ ) : 'a t -> 'b t -> ('a * 'b) t

val ( let* ) : 'a t -> ('a -> 'b t) -> 'b t

val ( and* ) : 'a t -> 'b t -> ('a * 'b) t

val catch : 'a t -> (error -> 'a t) -> 'a t

[@@@js.start]

[@@@js.implem
type 'a t = Untyped.t

type error = Ojs.t

let make (f : resolve:('a -> unit) -> reject:('e -> unit) -> unit) =
  Untyped.new_ @@ fun ~resolve ~reject ->
  let resolve_js value = resolve (Obj.magic value) in
  let reject_js value = reject (Obj.magic value) in
  f ~resolve:resolve_js ~reject:reject_js

let fail error = Untyped.fail error

let return x = Untyped.return (Obj.magic x)

let bind ?error p f = Untyped.bind ?error p (fun x -> f (Obj.magic x))

let both p1 p2 =
  bind
    (Untyped.all [ p1; p2 ])
    (fun ojs ->
      match Ojs.list_of_js Ojs.t_of_js ojs with
      | [ x1; x2 ] ->
        return (x1, x2)
      | _ ->
        assert false)

let all ps = List.map Untyped.t_of_js ps |> Untyped.all

let map f p = bind p (fun x -> return (f x))

let t_to_js f p = Untyped.t_to_js (map f p)

let t_of_js f p = map f (Untyped.t_of_js p)

let ( let+ ) p f = map f p

let ( and+ ) = both

let ( let* ) p f = bind p f

let ( and* ) = both

let catch p error = bind p ~error return]
