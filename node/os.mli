[@@@js.scope Import.os]

module CPU : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  module Times : sig
    type t

    val t_to_js : t -> Ojs.t

    val t_of_js : Ojs.t -> t

    val user : t -> int [@@js.get]

    val nice : t -> int [@@js.get]

    val sys : t -> int [@@js.get]

    val idle : t -> int [@@js.get]

    val irq : t -> int [@@js.get]
  end

  val model : t -> string [@@js.get]

  val speed : t -> int [@@js.get]

  val times : t -> Times.t [@@js.get]
end

module Constant : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  module Signals : sig
    type t

    val t_to_js : t -> Ojs.t

    val t_of_js : Ojs.t -> t

    val sighup : t -> Ojs.t [@@js.get "SIGHUP"]

    val sigint : t -> Ojs.t [@@js.get "SIGINT"]

    val sigquit : t -> Ojs.t [@@js.get "SIGQUIT"]

    val sigill : t -> Ojs.t [@@js.get "SIGILL"]

    val sigtrap : t -> Ojs.t [@@js.get "SIGTRAP"]

    val sigabrt : t -> Ojs.t [@@js.get "SIGABRT"]

    val sigiot : t -> Ojs.t [@@js.get "SIGIOT"]

    val sigbus : t -> Ojs.t [@@js.get "SIGBUS"]

    val sigfpe : t -> Ojs.t [@@js.get "SIGFPE"]

    val sigkill : t -> Ojs.t [@@js.get "SIGKILL"]

    val sigusr1 : t -> Ojs.t [@@js.get "SIGUSR1"]

    val sigsegv : t -> Ojs.t [@@js.get "SIGSEGV"]

    val sigpipe : t -> Ojs.t [@@js.get "SIGPIPE"]

    val sigalrm : t -> Ojs.t [@@js.get "SIGALRM"]

    val sigterm : t -> Ojs.t [@@js.get "SIGTERM"]

    val sigchld : t -> Ojs.t [@@js.get "SIGCHLD"]

    val sigstkflt : t -> Ojs.t [@@js.get "SIGSTKFLT"]

    val sigcont : t -> Ojs.t [@@js.get "SIGCONT"]

    val sigstop : t -> Ojs.t [@@js.get "SIGSTOP"]

    val sigtstp : t -> Ojs.t [@@js.get "SIGTSTP"]

    val sigbreak : t -> Ojs.t [@@js.get "SIGBREAK"]

    val sigttin : t -> Ojs.t [@@js.get "SIGTTIN"]

    val sigttou : t -> Ojs.t [@@js.get "SIGTTOU"]

    val sigurg : t -> Ojs.t [@@js.get "SIGURG"]

    val sigxcpu : t -> Ojs.t [@@js.get "SIGXCPU"]

    val sigxfsz : t -> Ojs.t [@@js.get "SIGXFSZ"]

    val sigvtalrm : t -> Ojs.t [@@js.get "SIGVTALRM"]

    val sigprof : t -> Ojs.t [@@js.get "SIGPROF"]

    val sigwinch : t -> Ojs.t [@@js.get "SIGWINCH"]

    val sigio : t -> Ojs.t [@@js.get "SIGIO"]

    val sigpoll : t -> Ojs.t [@@js.get "SIGPOLL"]

    val siglost : t -> Ojs.t [@@js.get "SIGLOST"]

    val sigpwr : t -> Ojs.t [@@js.get "SIGPWR"]

    val siginfo : t -> Ojs.t [@@js.get "SIGINFO"]

    val sigsys : t -> Ojs.t [@@js.get "SIGSYS"]

    val sigunused : t -> Ojs.t [@@js.get "SIGUNUSED"]
  end

  module Errno : sig
    type t

    val t_to_js : t -> Ojs.t

    val t_of_js : Ojs.t -> t

    val e2big : t -> Ojs.t [@@js.get "E2BIG"]

    val eacces : t -> Ojs.t [@@js.get "EACCES"]

    val eaddrinuse : t -> Ojs.t [@@js.get "EADDRINUSE"]

    val eaddrnotavail : t -> Ojs.t [@@js.get "EADDRNOTAVAIL"]

    val eafnosupport : t -> Ojs.t [@@js.get "EAFNOSUPPORT"]

    val eagain : t -> Ojs.t [@@js.get "EAGAIN"]

    val ealready : t -> Ojs.t [@@js.get "EALREADY"]

    val ebadf : t -> Ojs.t [@@js.get "EBADF"]

    val ebadmsg : t -> Ojs.t [@@js.get "EBADMSG"]

    val ebusy : t -> Ojs.t [@@js.get "EBUSY"]

    val ecanceled : t -> Ojs.t [@@js.get "ECANCELED"]

    val echild : t -> Ojs.t [@@js.get "ECHILD"]

    val econnaborted : t -> Ojs.t [@@js.get "ECONNABORTED"]

    val econnrefused : t -> Ojs.t [@@js.get "ECONNREFUSED"]

    val econnreset : t -> Ojs.t [@@js.get "ECONNRESET"]

    val edeadlk : t -> Ojs.t [@@js.get "EDEADLK"]

    val edestaddrreq : t -> Ojs.t [@@js.get "EDESTADDRREQ"]

    val edom : t -> Ojs.t [@@js.get "EDOM"]

    val edquot : t -> Ojs.t [@@js.get "EDQUOT"]

    val eexist : t -> Ojs.t [@@js.get "EEXIST"]

    val efault : t -> Ojs.t [@@js.get "EFAULT"]

    val efbig : t -> Ojs.t [@@js.get "EFBIG"]

    val ehostunreach : t -> Ojs.t [@@js.get "EHOSTUNREACH"]

    val eidrm : t -> Ojs.t [@@js.get "EIDRM"]

    val eilseq : t -> Ojs.t [@@js.get "EILSEQ"]

    val einprogress : t -> Ojs.t [@@js.get "EINPROGRESS"]

    val eintr : t -> Ojs.t [@@js.get "EINTR"]

    val einval : t -> Ojs.t [@@js.get "EINVAL"]

    val eio : t -> Ojs.t [@@js.get "EIO"]

    val eisconn : t -> Ojs.t [@@js.get "EISCONN"]

    val eisdir : t -> Ojs.t [@@js.get "EISDIR"]

    val eloop : t -> Ojs.t [@@js.get "ELOOP"]

    val emfile : t -> Ojs.t [@@js.get "EMFILE"]

    val emlink : t -> Ojs.t [@@js.get "EMLINK"]

    val emsgsize : t -> Ojs.t [@@js.get "EMSGSIZE"]

    val emultihop : t -> Ojs.t [@@js.get "EMULTIHOP"]

    val enametoolong : t -> Ojs.t [@@js.get "ENAMETOOLONG"]

    val enetdown : t -> Ojs.t [@@js.get "ENETDOWN"]

    val enetreset : t -> Ojs.t [@@js.get "ENETRESET"]

    val enetunreach : t -> Ojs.t [@@js.get "ENETUNREACH"]

    val enfile : t -> Ojs.t [@@js.get "ENFILE"]

    val enobufs : t -> Ojs.t [@@js.get "ENOBUFS"]

    val enodata : t -> Ojs.t [@@js.get "ENODATA"]

    val enodev : t -> Ojs.t [@@js.get "ENODEV"]

    val enoent : t -> Ojs.t [@@js.get "ENOENT"]

    val enoexec : t -> Ojs.t [@@js.get "ENOEXEC"]

    val enolck : t -> Ojs.t [@@js.get "ENOLCK"]

    val enolink : t -> Ojs.t [@@js.get "ENOLINK"]

    val enomem : t -> Ojs.t [@@js.get "ENOMEM"]

    val enomsg : t -> Ojs.t [@@js.get "ENOMSG"]

    val enoprotoopt : t -> Ojs.t [@@js.get "ENOPROTOOPT"]

    val enospc : t -> Ojs.t [@@js.get "ENOSPC"]

    val enosr : t -> Ojs.t [@@js.get "ENOSR"]

    val enostr : t -> Ojs.t [@@js.get "ENOSTR"]

    val enosys : t -> Ojs.t [@@js.get "ENOSYS"]

    val enotconn : t -> Ojs.t [@@js.get "ENOTCONN"]

    val enotdir : t -> Ojs.t [@@js.get "ENOTDIR"]

    val enotempty : t -> Ojs.t [@@js.get "ENOTEMPTY"]

    val enotsock : t -> Ojs.t [@@js.get "ENOTSOCK"]

    val enotsup : t -> Ojs.t [@@js.get "ENOTSUP"]

    val enotty : t -> Ojs.t [@@js.get "ENOTTY"]

    val enxio : t -> Ojs.t [@@js.get "ENXIO"]

    val eopnotsupp : t -> Ojs.t [@@js.get "EOPNOTSUPP"]

    val eoverflow : t -> Ojs.t [@@js.get "EOVERFLOW"]

    val eperm : t -> Ojs.t [@@js.get "EPERM"]

    val epipe : t -> Ojs.t [@@js.get "EPIPE"]

    val eproto : t -> Ojs.t [@@js.get "EPROTO"]

    val eprotonosupport : t -> Ojs.t [@@js.get "EPROTONOSUPPORT"]

    val eprototype : t -> Ojs.t [@@js.get "EPROTOTYPE"]

    val erange : t -> Ojs.t [@@js.get "ERANGE"]

    val erofs : t -> Ojs.t [@@js.get "EROFS"]

    val espipe : t -> Ojs.t [@@js.get "ESPIPE"]

    val esrch : t -> Ojs.t [@@js.get "ESRCH"]

    val estale : t -> Ojs.t [@@js.get "ESTALE"]

    val etime : t -> Ojs.t [@@js.get "ETIME"]

    val etimedout : t -> Ojs.t [@@js.get "ETIMEDOUT"]

    val etxtbsy : t -> Ojs.t [@@js.get "ETXTBSY"]

    val ewouldblock : t -> Ojs.t [@@js.get "EWOULDBLOCK"]

    val exdev : t -> Ojs.t [@@js.get "EXDEV"]

    val wsaeintr : t -> Ojs.t [@@js.get "WSAEINTR"]

    val wsaebadf : t -> Ojs.t [@@js.get "WSAEBADF"]

    val wsaeacces : t -> Ojs.t [@@js.get "WSAEACCES"]

    val wsaefault : t -> Ojs.t [@@js.get "WSAEFAULT"]

    val wsaeinval : t -> Ojs.t [@@js.get "WSAEINVAL"]

    val wsaemfile : t -> Ojs.t [@@js.get "WSAEMFILE"]

    val wsaewouldblock : t -> Ojs.t [@@js.get "WSAEWOULDBLOCK"]

    val wsaeinprogress : t -> Ojs.t [@@js.get "WSAEINPROGRESS"]

    val wsaealready : t -> Ojs.t [@@js.get "WSAEALREADY"]

    val wsaenotsock : t -> Ojs.t [@@js.get "WSAENOTSOCK"]

    val wsaedestaddrreq : t -> Ojs.t [@@js.get "WSAEDESTADDRREQ"]

    val wsaemsgsize : t -> Ojs.t [@@js.get "WSAEMSGSIZE"]

    val wsaeprototype : t -> Ojs.t [@@js.get "WSAEPROTOTYPE"]

    val wsaenoprotoopt : t -> Ojs.t [@@js.get "WSAENOPROTOOPT"]

    val wsaeprotonosupport : t -> Ojs.t [@@js.get "WSAEPROTONOSUPPORT"]

    val wsaesocktnosupport : t -> Ojs.t [@@js.get "WSAESOCKTNOSUPPORT"]

    val wsaeopnotsupp : t -> Ojs.t [@@js.get "WSAEOPNOTSUPP"]

    val wsaepfnosupport : t -> Ojs.t [@@js.get "WSAEPFNOSUPPORT"]

    val wsaeafnosupport : t -> Ojs.t [@@js.get "WSAEAFNOSUPPORT"]

    val wsaeaddrinuse : t -> Ojs.t [@@js.get "WSAEADDRINUSE"]

    val wsaeaddrnotavail : t -> Ojs.t [@@js.get "WSAEADDRNOTAVAIL"]

    val wsaenetdown : t -> Ojs.t [@@js.get "WSAENETDOWN"]

    val wsaenetunreach : t -> Ojs.t [@@js.get "WSAENETUNREACH"]

    val wsaenetreset : t -> Ojs.t [@@js.get "WSAENETRESET"]

    val wsaeconnaborted : t -> Ojs.t [@@js.get "WSAECONNABORTED"]

    val wsaeconnreset : t -> Ojs.t [@@js.get "WSAECONNRESET"]

    val wsaenobufs : t -> Ojs.t [@@js.get "WSAENOBUFS"]

    val wsaeisconn : t -> Ojs.t [@@js.get "WSAEISCONN"]

    val wsaenotconn : t -> Ojs.t [@@js.get "WSAENOTCONN"]

    val wsaeshutdown : t -> Ojs.t [@@js.get "WSAESHUTDOWN"]

    val wsaetoomanyrefs : t -> Ojs.t [@@js.get "WSAETOOMANYREFS"]

    val wsaetimedout : t -> Ojs.t [@@js.get "WSAETIMEDOUT"]

    val wsaeconnrefused : t -> Ojs.t [@@js.get "WSAECONNREFUSED"]

    val wsaeloop : t -> Ojs.t [@@js.get "WSAELOOP"]

    val wsaenametoolong : t -> Ojs.t [@@js.get "WSAENAMETOOLONG"]

    val wsaehostdown : t -> Ojs.t [@@js.get "WSAEHOSTDOWN"]

    val wsaehostunreach : t -> Ojs.t [@@js.get "WSAEHOSTUNREACH"]

    val wsaenotempty : t -> Ojs.t [@@js.get "WSAENOTEMPTY"]

    val wsaeproclim : t -> Ojs.t [@@js.get "WSAEPROCLIM"]

    val wsaeusers : t -> Ojs.t [@@js.get "WSAEUSERS"]

    val wsaedquot : t -> Ojs.t [@@js.get "WSAEDQUOT"]

    val wsaestale : t -> Ojs.t [@@js.get "WSAESTALE"]

    val wsaeremote : t -> Ojs.t [@@js.get "WSAEREMOTE"]

    val wsasysnotready : t -> Ojs.t [@@js.get "WSASYSNOTREADY"]

    val wsavernotsupported : t -> Ojs.t [@@js.get "WSAVERNOTSUPPORTED"]

    val wsanotinitialised : t -> Ojs.t [@@js.get "WSANOTINITIALISED"]

    val wsaediscon : t -> Ojs.t [@@js.get "WSAEDISCON"]

    val wsaenomore : t -> Ojs.t [@@js.get "WSAENOMORE"]

    val wsaecancelled : t -> Ojs.t [@@js.get "WSAECANCELLED"]

    val wsaeinvalidproctable : t -> Ojs.t [@@js.get "WSAEINVALIDPROCTABLE"]

    val wsaeinvalidprovider : t -> Ojs.t [@@js.get "WSAEINVALIDPROVIDER"]

    val wsaeproviderfailedinit : t -> Ojs.t [@@js.get "WSAEPROVIDERFAILEDINIT"]

    val wsasyscallfailure : t -> Ojs.t [@@js.get "WSASYSCALLFAILURE"]

    val wsaservice_not_found : t -> Ojs.t [@@js.get "WSASERVICE_NOT_FOUND"]

    val wsatype_not_found : t -> Ojs.t [@@js.get "WSATYPE_NOT_FOUND"]

    val wsa_e_no_more : t -> Ojs.t [@@js.get "WSA_E_NO_MORE"]

    val wsa_e_cancelled : t -> Ojs.t [@@js.get "WSA_E_CANCELLED"]

    val wsaerefused : t -> Ojs.t [@@js.get "WSAEREFUSED"]
  end

  module Dlopen : sig
    type t

    val t_to_js : t -> Ojs.t

    val t_of_js : Ojs.t -> t

    val rtld_lazy : t -> Ojs.t [@@js.get "RTLD_LAZY"]

    val rtld_now : t -> Ojs.t [@@js.get "RTLD_NOW"]

    val rtld_global : t -> Ojs.t [@@js.get "RTLD_GLOBAL"]

    val rtld_local : t -> Ojs.t [@@js.get "RTLD_LOCAL"]

    val rtld_deepbind : t -> Ojs.t [@@js.get "RTLD_DEEPBIND"]
  end

  module Priority : sig
    type t

    val t_to_js : t -> Ojs.t

    val t_of_js : Ojs.t -> t

    val priority_low : t -> Ojs.t [@@js.get "PRIORITY_LOW"]

    val priority_below_normal : t -> Ojs.t [@@js.get "PRIORITY_BELOW_NORMAL"]

    val priority_normal : t -> Ojs.t [@@js.get "PRIORITY_NORMAL"]

    val priority_above_normal : t -> Ojs.t [@@js.get "PRIORITY_ABOVE_NORMAL"]

    val priority_high : t -> Ojs.t [@@js.get "PRIORITY_HIGH"]

    val priority_highest : t -> Ojs.t [@@js.get "PRIORITY_HIGHEST"]
  end

  val signals : t -> Signals.t [@@js.get "signals"]

  val errno : t -> Errno.t [@@js.get "errno"]

  val dlopen : t -> Dlopen.t [@@js.get "dlopen"]

  val priority : t -> Priority.t [@@js.get "priority"]
end

module NetworkInterface : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  val address : t -> string [@@js.get]

  val netmask : t -> string [@@js.get]

  val family : t -> string [@@js.get]

  val mac : t -> string [@@js.get]

  val internal : t -> bool [@@js.get]

  val scopeid : t -> int [@@js.get]

  val cidr : t -> string [@@js.get]
end

val eol : unit -> string [@@js.global "eol"]

val arch : unit -> string [@@js.global "arch"]

val constants : Constant.t [@@js.global "constants"]

val cpus : unit -> CPU.t list [@@js.global "cpus"]

val endianness : unit -> string [@@js.global "endianness"]

val freemem : unit -> int [@@js.global "freemem"]

val getPriority : ?pid:int -> unit -> int [@@js.global "getPriority"]

val homedir : unit -> string option [@@js.global "homedir"]

val hostname : unit -> string [@@js.global "hostname"]

val loadavg : unit -> int list [@@js.global "loadavg"]

val networkInterfaces : unit -> NetworkInterface.t list
  [@@js.global "networkInterfaces"]

val platform : unit -> string [@@js.global "platform"]

val release : unit -> string [@@js.global "release"]

val setPriority : ?pid:int -> priority:int -> unit [@@js.global "setPriority"]

val tmpdir : unit -> string [@@js.global "tmpdir"]

val totalmem : unit -> int [@@js.global "totalmem"]

val type_ : unit -> string [@@js.global "type"]

val uptime : unit -> int [@@js.global "uptime"]

module UserInfoOptions : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  val create : encoding:string -> t [@@js.builder]
end

module UserInfo : sig
  type t

  val t_to_js : t -> Ojs.t

  val t_of_js : Ojs.t -> t

  val username : t -> string [@@js.get]

  val uid : t -> int [@@js.get]

  val gid : t -> int [@@js.get]

  val shell : t -> string option [@@js.get]

  val homedir : t -> string [@@js.get]
end

val userInfo : ?options:UserInfoOptions.t -> unit -> UserInfo.t
  [@@js.global "userInfo"]

val version : unit -> string [@@js.global "version"]
