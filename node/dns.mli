open Js

[@@@js.scope Import.dns]

val getServers : unit -> string list [@@js.global "getServers"]

module LookupOptions : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  val create
    :  ?family:int
    -> ?hints:int
    -> ?all:bool
    -> ?verbatim:bool
    -> unit
    -> t
    [@@js.builder]
end

val lookup
  :  string
  -> ?options:LookupOptions.t
  -> ?callback:(Error.t option -> string -> int -> unit)
  -> unit
  -> unit
  [@@js.global "lookup"]

val lookupService
  :  string
  -> int
  -> (Error.t option -> string -> int -> unit)
  -> unit
  [@@js.global "lookupService"]

val resolve
  :  string
  -> string
  -> (Error.t option -> string list -> unit)
  -> unit
  [@@js.global "resolve"]

module ResolveOptions : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  val create : ?ttl:bool -> unit -> t [@@js.builder]
end

val resolve4
  :  string
  -> ?options:ResolveOptions.t
  -> (Error.t option -> string list)
  -> unit
  [@@js.global "resolve4"]

val resolve6
  :  string
  -> ?options:ResolveOptions.t
  -> (Error.t option -> string list)
  -> unit
  [@@js.global "resolve6"]

val resolveAny : string -> (Error.t option -> Ojs.t list) -> unit
  [@@js.global "resolveAny"]

val resolveCname : string -> (Error.t option -> string list) -> unit
  [@@js.global "resolveCname"]

module ResolveCaaAddress : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  val critical : t -> int [@@js.get]

  val iodef : t -> string [@@js.get]
end

val resolveCaa : string -> (Error.t option -> ResolveCaaAddress.t list) -> unit
  [@@js.global "resolveCaa"]

module ResolveMxAddress : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  val priority : t -> int [@@js.get]

  val exchange : t -> string [@@js.get]
end

val resolveMx : string -> (Error.t option -> ResolveMxAddress.t list) -> unit
  [@@js.global "resolveMx"]

module ResolveNaptrAddress : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  val flags : t -> string [@@js.get]

  val service : t -> string [@@js.get]

  val regexp : t -> string [@@js.get]

  val replacement : t -> string [@@js.get]

  val order : t -> int [@@js.get]

  val preference : t -> int [@@js.get]
end

val resolveNaptr
  :  string
  -> (Error.t option -> ResolveNaptrAddress.t list)
  -> unit
  [@@js.global "resolveNaptr"]

val resolveNs : string -> (Error.t option -> string list) -> unit
  [@@js.global "resolveNs"]

val resolvePtr : string -> (Error.t option -> string list) -> unit
  [@@js.global "resolvePtr"]

module ResolveSoaAddress : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  val nsname : t -> string [@@js.get]

  val hostmaster : t -> string [@@js.get]

  val serial : t -> int [@@js.get]

  val refresh : t -> int [@@js.get]

  val retry : t -> int [@@js.get]

  val expire : t -> int [@@js.get]

  val minttl : t -> int [@@js.get]
end

val resolveSoa : string -> (Error.t option -> ResolveSoaAddress.t) -> unit
  [@@js.global "resolveSoa"]

module ResolveSrvAddress : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  val name : t -> string [@@js.get]

  val priority : t -> int [@@js.get]

  val weight : t -> int [@@js.get]

  val port : t -> int [@@js.get]
end

val resolveSrv : string -> (Error.t option -> ResolveSrvAddress.t list) -> unit
  [@@js.global "resolveSrv"]

val resolveTxt : string -> (Error.t option -> string list list) -> unit
  [@@js.global "resolveTxt"]

val reverse : string -> (Error.t option -> string list -> unit) -> unit
  [@@js.global "reverse"]

val setServers : string list -> unit [@@js.global "setServers"]

module Resolver : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  module Options : sig
    type t

    val t_to_js : t -> Ojs.t

    val t_of_js : Ojs.t -> t

    val create : ?timeout:int -> unit -> t [@@js.builder]
  end

  val create : ?options:Options.t -> unit -> t [@@js.builder]

  val cancel : t -> unit [@@js.call]

  val setLocalAddress : t -> ?ipv4:string -> ?ipv6:string -> unit -> unit
    [@@js.call]

  val getServers : t -> string list [@@js.call]

  val resolve
    :  t
    -> string
    -> string
    -> (Error.t option -> string list -> unit)
    -> unit
    [@@js.call]

  val resolve4
    :  t
    -> string
    -> ?options:ResolveOptions.t
    -> (Error.t option -> string list)
    -> unit
    [@@js.call]

  val resolve6
    :  t
    -> string
    -> ?options:ResolveOptions.t
    -> (Error.t option -> string list)
    -> unit
    [@@js.call]

  val resolveAny : t -> string -> (Error.t option -> Ojs.t list) -> unit
    [@@js.call]

  val resolveCname : t -> string -> (Error.t option -> string list) -> unit
    [@@js.call]

  val resolveCaa
    :  t
    -> string
    -> (Error.t option -> ResolveCaaAddress.t list)
    -> unit
    [@@js.call]

  val resolveMx
    :  t
    -> string
    -> (Error.t option -> ResolveMxAddress.t list)
    -> unit
    [@@js.call]

  val resolveNaptr
    :  t
    -> string
    -> (Error.t option -> ResolveNaptrAddress.t list)
    -> unit
    [@@js.call]

  val resolveNs : t -> string -> (Error.t option -> string list) -> unit
    [@@js.call]

  val resolvePtr : t -> string -> (Error.t option -> string list) -> unit
    [@@js.call]

  val resolveSoa
    :  t
    -> string
    -> (Error.t option -> ResolveSoaAddress.t)
    -> unit
    [@@js.call]

  val resolveSrv
    :  t
    -> string
    -> (Error.t option -> ResolveSrvAddress.t list)
    -> unit
    [@@js.call]

  val resolveTxt : t -> string -> (Error.t option -> string list list) -> unit
    [@@js.call]

  val reverse : t -> string -> (Error.t option -> string list -> unit) -> unit
    [@@js.call]

  val setServers : t -> string list -> unit [@@js.call]
end
