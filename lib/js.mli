module Date : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  val now : unit -> float [@@js.global "Date.now"]
end

module ArrayBuffer : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t
end

module Uint8Array : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  val new_ : ArrayBuffer.t -> t [@@js.new "Uint8Array"]

  val to_string : t -> string [@@js.cast]
end

module Error : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  val create : string -> t [@@js.create]

  val stack_trace_limit : int [@@js.global]

  val set_stack_trace_limit : int -> unit [@@js.set]

  val code : t -> string [@@js.get]

  val message : t -> string [@@js.get]

  val stack : t -> string [@@js.get]
end
[@@js.scope]

[@@@js.stop]

module Dict : sig
  include Map.S with type key = string

  val t_to_js : ('a -> Ojs.t) -> 'a t -> Ojs.t

  val t_of_js : (Ojs.t -> 'a) -> Ojs.t -> 'a t
end

module Promise = Promise

[@@@js.start]

[@@@js.implem
module Dict = struct
  include Map.Make (String)

  let t_to_js ml2js l =
    let o = Ojs.empty_obj () in
    iter (fun k v -> Ojs.set_prop o (Ojs.string_to_js k) (ml2js v)) l;
    o

  let t_of_js js2ml o =
    let l = ref empty in
    Ojs.iter_properties o (fun k ->
        l := add k (js2ml (Ojs.get_prop o (Ojs.string_to_js k))) !l);
    !l
end

module Promise = Promise]
