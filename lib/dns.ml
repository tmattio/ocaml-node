open Import

val getServers : unit -> string list [@@js.global "dns.getServers"]

module LookupOptions = struct
  type t = private Ojs.t [@@js]

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
  -> ?callback:(Error.t or_undefined -> string -> int -> unit)
  -> unit
  -> unit
  [@@js.global "dns.lookup"]

val lookupService
  :  string
  -> int
  -> (Error.t or_undefined -> string -> int -> unit)
  -> unit
  [@@js.global "dns.lookupService"]

val resolve
  :  string
  -> string
  -> (Error.t or_undefined -> string list -> unit)
  -> unit
  [@@js.global "dns.resolve"]

module ResolveOptions = struct
  type t = private Ojs.t [@@js]

  val create : ?ttl:bool -> unit -> t [@@js.builder]
end

val resolve4
  :  string
  -> ?options:ResolveOptions.t
  -> (Error.t or_undefined -> string list)
  -> unit
  [@@js.global "dns.resolve4"]

val resolve6
  :  string
  -> ?options:ResolveOptions.t
  -> (Error.t or_undefined -> string list)
  -> unit
  [@@js.global "dns.resolve6"]

val resolveAny : string -> (Error.t or_undefined -> Ojs.t list) -> unit
  [@@js.global "dns.resolveAny"]

val resolveCname : string -> (Error.t or_undefined -> string list) -> unit
  [@@js.global "dns.resolveCname"]

module ResolveCaaAddress = struct
  type t = private Ojs.t [@@js]

  val critical : t -> int [@@js.get]

  val iodef : t -> string [@@js.get]
end

val resolveCaa
  :  string
  -> (Error.t or_undefined -> ResolveCaaAddress.t list)
  -> unit
  [@@js.global "dns.resolveCaa"]

module ResolveMxAddress = struct
  type t = private Ojs.t [@@js]

  val priority : t -> int [@@js.get]

  val exchange : t -> string [@@js.get]
end

val resolveMx
  :  string
  -> (Error.t or_undefined -> ResolveMxAddress.t list)
  -> unit
  [@@js.global "dns.resolveMx"]

module ResolveNaptrAddress = struct
  type t = private Ojs.t [@@js]

  val flags : t -> string [@@js.get]

  val service : t -> string [@@js.get]

  val regexp : t -> string [@@js.get]

  val replacement : t -> string [@@js.get]

  val order : t -> int [@@js.get]

  val preference : t -> int [@@js.get]
end

val resolveNaptr
  :  string
  -> (Error.t or_undefined -> ResolveNaptrAddress.t list)
  -> unit
  [@@js.global "dns.resolveNaptr"]

val resolveNs : string -> (Error.t or_undefined -> string list) -> unit
  [@@js.global "dns.resolveNs"]

val resolvePtr : string -> (Error.t or_undefined -> string list) -> unit
  [@@js.global "dns.resolvePtr"]

module ResolveSoaAddress = struct
  type t = private Ojs.t [@@js]

  val nsname : t -> string [@@js.get]

  val hostmaster : t -> string [@@js.get]

  val serial : t -> int [@@js.get]

  val refresh : t -> int [@@js.get]

  val retry : t -> int [@@js.get]

  val expire : t -> int [@@js.get]

  val minttl : t -> int [@@js.get]
end

val resolveSoa : string -> (Error.t or_undefined -> ResolveSoaAddress.t) -> unit
  [@@js.global "dns.resolveSoa"]

module ResolveSrvAddress = struct
  type t = private Ojs.t [@@js]

  val name : t -> string [@@js.get]

  val priority : t -> int [@@js.get]

  val weight : t -> int [@@js.get]

  val port : t -> int [@@js.get]
end

val resolveSrv
  :  string
  -> (Error.t or_undefined -> ResolveSrvAddress.t list)
  -> unit
  [@@js.global "dns.resolveSrv"]

val resolveTxt : string -> (Error.t or_undefined -> string list list) -> unit
  [@@js.global "dns.resolveTxt"]

val reverse : string -> (Error.t or_undefined -> string list -> unit) -> unit
  [@@js.global "dns.reverse"]

val setServers : string list -> unit [@@js.global "dns.setServers"]

module Resolver = struct
  type t = private Ojs.t [@@js]

  module Options = struct
    type t = private Ojs.t [@@js]

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
    -> (Error.t or_undefined -> string list -> unit)
    -> unit
    [@@js.call]

  val resolve4
    :  t
    -> string
    -> ?options:ResolveOptions.t
    -> (Error.t or_undefined -> string list)
    -> unit
    [@@js.call]

  val resolve6
    :  t
    -> string
    -> ?options:ResolveOptions.t
    -> (Error.t or_undefined -> string list)
    -> unit
    [@@js.call]

  val resolveAny : t -> string -> (Error.t or_undefined -> Ojs.t list) -> unit
    [@@js.call]

  val resolveCname
    :  t
    -> string
    -> (Error.t or_undefined -> string list)
    -> unit
    [@@js.call]

  val resolveCaa
    :  t
    -> string
    -> (Error.t or_undefined -> ResolveCaaAddress.t list)
    -> unit
    [@@js.call]

  val resolveMx
    :  t
    -> string
    -> (Error.t or_undefined -> ResolveMxAddress.t list)
    -> unit
    [@@js.call]

  val resolveNaptr
    :  t
    -> string
    -> (Error.t or_undefined -> ResolveNaptrAddress.t list)
    -> unit
    [@@js.call]

  val resolveNs : t -> string -> (Error.t or_undefined -> string list) -> unit
    [@@js.call]

  val resolvePtr : t -> string -> (Error.t or_undefined -> string list) -> unit
    [@@js.call]

  val resolveSoa
    :  t
    -> string
    -> (Error.t or_undefined -> ResolveSoaAddress.t)
    -> unit
    [@@js.call]

  val resolveSrv
    :  t
    -> string
    -> (Error.t or_undefined -> ResolveSrvAddress.t list)
    -> unit
    [@@js.call]

  val resolveTxt
    :  t
    -> string
    -> (Error.t or_undefined -> string list list)
    -> unit
    [@@js.call]

  val reverse
    :  t
    -> string
    -> (Error.t or_undefined -> string list -> unit)
    -> unit
    [@@js.call]

  val setServers : t -> string list -> unit [@@js.call]
end
