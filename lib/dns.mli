open Import

val getServers : unit -> string list

module LookupOptions : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val create
    :  ?family:int
    -> ?hints:int
    -> ?all:bool
    -> ?verbatim:bool
    -> unit
    -> t
end

val lookup
  :  string
  -> ?options:LookupOptions.t
  -> ?callback:(Error.t option -> string -> int -> unit)
  -> unit
  -> unit

val lookupService
  :  string
  -> int
  -> (Error.t option -> string -> int -> unit)
  -> unit

val resolve
  :  string
  -> string
  -> (Error.t option -> string list -> unit)
  -> unit

module ResolveOptions : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val create : ?ttl:bool -> unit -> t
end

val resolve4
  :  string
  -> ?options:ResolveOptions.t
  -> (Error.t option -> string list)
  -> unit

val resolve6
  :  string
  -> ?options:ResolveOptions.t
  -> (Error.t option -> string list)
  -> unit

val resolveAny : string -> (Error.t option -> Ojs.t list) -> unit

val resolveCname : string -> (Error.t option -> string list) -> unit

module ResolveCaaAddress : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val critical : t -> int

  val iodef : t -> string
end

val resolveCaa : string -> (Error.t option -> ResolveCaaAddress.t list) -> unit

module ResolveMxAddress : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val priority : t -> int

  val exchange : t -> string
end

val resolveMx : string -> (Error.t option -> ResolveMxAddress.t list) -> unit

module ResolveNaptrAddress : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val flags : t -> string

  val service : t -> string

  val regexp : t -> string

  val replacement : t -> string

  val order : t -> int

  val preference : t -> int
end

val resolveNaptr
  :  string
  -> (Error.t option -> ResolveNaptrAddress.t list)
  -> unit

val resolveNs : string -> (Error.t option -> string list) -> unit

val resolvePtr : string -> (Error.t option -> string list) -> unit

module ResolveSoaAddress : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val nsname : t -> string

  val hostmaster : t -> string

  val serial : t -> int

  val refresh : t -> int

  val retry : t -> int

  val expire : t -> int

  val minttl : t -> int
end

val resolveSoa : string -> (Error.t option -> ResolveSoaAddress.t) -> unit

module ResolveSrvAddress : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val name : t -> string

  val priority : t -> int

  val weight : t -> int

  val port : t -> int
end

val resolveSrv : string -> (Error.t option -> ResolveSrvAddress.t list) -> unit

val resolveTxt : string -> (Error.t option -> string list list) -> unit

val reverse : string -> (Error.t option -> string list -> unit) -> unit

val setServers : string list -> unit

module Resolver : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  module Options : sig
    type t

    val t_of_js : Ojs.t -> t

    val t_to_js : t -> Ojs.t

    val create : ?timeout:int -> unit -> t
  end

  val create : ?options:Options.t -> unit -> t

  val cancel : t -> unit

  val setLocalAddress : t -> ?ipv4:string -> ?ipv6:string -> unit -> unit

  val getServers : t -> string list

  val resolve
    :  t
    -> string
    -> string
    -> (Error.t option -> string list -> unit)
    -> unit

  val resolve4
    :  t
    -> string
    -> ?options:t
    -> (Error.t option -> string list)
    -> unit

  val resolve6
    :  t
    -> string
    -> ?options:t
    -> (Error.t option -> string list)
    -> unit

  val resolveAny : t -> string -> (Error.t option -> Ojs.t list) -> unit

  val resolveCname : t -> string -> (Error.t option -> string list) -> unit

  val resolveCaa
    :  t
    -> string
    -> (Error.t option -> ResolveCaaAddress.t list)
    -> unit

  val resolveMx
    :  t
    -> string
    -> (Error.t option -> ResolveMxAddress.t list)
    -> unit

  val resolveNaptr
    :  t
    -> string
    -> (Error.t option -> ResolveNaptrAddress.t list)
    -> unit

  val resolveNs : t -> string -> (Error.t option -> string list) -> unit

  val resolvePtr : t -> string -> (Error.t option -> string list) -> unit

  val resolveSoa
    :  t
    -> string
    -> (Error.t option -> ResolveSoaAddress.t)
    -> unit

  val resolveSrv
    :  t
    -> string
    -> (Error.t option -> ResolveSrvAddress.t list)
    -> unit

  val resolveTxt : t -> string -> (Error.t option -> string list list) -> unit

  val reverse : t -> string -> (Error.t option -> string list -> unit) -> unit

  val setServers : t -> string list -> unit
end
