module CPU : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  module Times : sig
    type t

    val t_of_js : Ojs.t -> t

    val t_to_js : t -> Ojs.t

    val user : t -> int

    val nice : t -> int

    val sys : t -> int

    val idle : t -> int

    val irq : t -> int
  end

  val model : t -> string

  val speed : t -> int

  val times : t -> Ojs.t
end

module Constant : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  module Signals : sig
    type t

    val t_of_js : Ojs.t -> t

    val t_to_js : t -> Ojs.t

    val sighup : t -> Ojs.t

    val sigint : t -> Ojs.t

    val sigquit : t -> Ojs.t

    val sigill : t -> Ojs.t

    val sigtrap : t -> Ojs.t

    val sigabrt : t -> Ojs.t

    val sigiot : t -> Ojs.t

    val sigbus : t -> Ojs.t

    val sigfpe : t -> Ojs.t

    val sigkill : t -> Ojs.t

    val sigusr1 : t -> Ojs.t

    val sigsegv : t -> Ojs.t

    val sigpipe : t -> Ojs.t

    val sigalrm : t -> Ojs.t

    val sigterm : t -> Ojs.t

    val sigchld : t -> Ojs.t

    val sigstkflt : t -> Ojs.t

    val sigcont : t -> Ojs.t

    val sigstop : t -> Ojs.t

    val sigtstp : t -> Ojs.t

    val sigbreak : t -> Ojs.t

    val sigttin : t -> Ojs.t

    val sigttou : t -> Ojs.t

    val sigurg : t -> Ojs.t

    val sigxcpu : t -> Ojs.t

    val sigxfsz : t -> Ojs.t

    val sigvtalrm : t -> Ojs.t

    val sigprof : t -> Ojs.t

    val sigwinch : t -> Ojs.t

    val sigio : t -> Ojs.t

    val sigpoll : t -> Ojs.t

    val siglost : t -> Ojs.t

    val sigpwr : t -> Ojs.t

    val siginfo : t -> Ojs.t

    val sigsys : t -> Ojs.t

    val sigunused : t -> Ojs.t
  end

  module Errno : sig
    type t

    val t_of_js : Ojs.t -> t

    val t_to_js : t -> Ojs.t

    val e2big : t -> Ojs.t

    val eacces : t -> Ojs.t

    val eaddrinuse : t -> Ojs.t

    val eaddrnotavail : t -> Ojs.t

    val eafnosupport : t -> Ojs.t

    val eagain : t -> Ojs.t

    val ealready : t -> Ojs.t

    val ebadf : t -> Ojs.t

    val ebadmsg : t -> Ojs.t

    val ebusy : t -> Ojs.t

    val ecanceled : t -> Ojs.t

    val echild : t -> Ojs.t

    val econnaborted : t -> Ojs.t

    val econnrefused : t -> Ojs.t

    val econnreset : t -> Ojs.t

    val edeadlk : t -> Ojs.t

    val edestaddrreq : t -> Ojs.t

    val edom : t -> Ojs.t

    val edquot : t -> Ojs.t

    val eexist : t -> Ojs.t

    val efault : t -> Ojs.t

    val efbig : t -> Ojs.t

    val ehostunreach : t -> Ojs.t

    val eidrm : t -> Ojs.t

    val eilseq : t -> Ojs.t

    val einprogress : t -> Ojs.t

    val eintr : t -> Ojs.t

    val einval : t -> Ojs.t

    val eio : t -> Ojs.t

    val eisconn : t -> Ojs.t

    val eisdir : t -> Ojs.t

    val eloop : t -> Ojs.t

    val emfile : t -> Ojs.t

    val emlink : t -> Ojs.t

    val emsgsize : t -> Ojs.t

    val emultihop : t -> Ojs.t

    val enametoolong : t -> Ojs.t

    val enetdown : t -> Ojs.t

    val enetreset : t -> Ojs.t

    val enetunreach : t -> Ojs.t

    val enfile : t -> Ojs.t

    val enobufs : t -> Ojs.t

    val enodata : t -> Ojs.t

    val enodev : t -> Ojs.t

    val enoent : t -> Ojs.t

    val enoexec : t -> Ojs.t

    val enolck : t -> Ojs.t

    val enolink : t -> Ojs.t

    val enomem : t -> Ojs.t

    val enomsg : t -> Ojs.t

    val enoprotoopt : t -> Ojs.t

    val enospc : t -> Ojs.t

    val enosr : t -> Ojs.t

    val enostr : t -> Ojs.t

    val enosys : t -> Ojs.t

    val enotconn : t -> Ojs.t

    val enotdir : t -> Ojs.t

    val enotempty : t -> Ojs.t

    val enotsock : t -> Ojs.t

    val enotsup : t -> Ojs.t

    val enotty : t -> Ojs.t

    val enxio : t -> Ojs.t

    val eopnotsupp : t -> Ojs.t

    val eoverflow : t -> Ojs.t

    val eperm : t -> Ojs.t

    val epipe : t -> Ojs.t

    val eproto : t -> Ojs.t

    val eprotonosupport : t -> Ojs.t

    val eprototype : t -> Ojs.t

    val erange : t -> Ojs.t

    val erofs : t -> Ojs.t

    val espipe : t -> Ojs.t

    val esrch : t -> Ojs.t

    val estale : t -> Ojs.t

    val etime : t -> Ojs.t

    val etimedout : t -> Ojs.t

    val etxtbsy : t -> Ojs.t

    val ewouldblock : t -> Ojs.t

    val exdev : t -> Ojs.t

    val wsaeintr : t -> Ojs.t

    val wsaebadf : t -> Ojs.t

    val wsaeacces : t -> Ojs.t

    val wsaefault : t -> Ojs.t

    val wsaeinval : t -> Ojs.t

    val wsaemfile : t -> Ojs.t

    val wsaewouldblock : t -> Ojs.t

    val wsaeinprogress : t -> Ojs.t

    val wsaealready : t -> Ojs.t

    val wsaenotsock : t -> Ojs.t

    val wsaedestaddrreq : t -> Ojs.t

    val wsaemsgsize : t -> Ojs.t

    val wsaeprototype : t -> Ojs.t

    val wsaenoprotoopt : t -> Ojs.t

    val wsaeprotonosupport : t -> Ojs.t

    val wsaesocktnosupport : t -> Ojs.t

    val wsaeopnotsupp : t -> Ojs.t

    val wsaepfnosupport : t -> Ojs.t

    val wsaeafnosupport : t -> Ojs.t

    val wsaeaddrinuse : t -> Ojs.t

    val wsaeaddrnotavail : t -> Ojs.t

    val wsaenetdown : t -> Ojs.t

    val wsaenetunreach : t -> Ojs.t

    val wsaenetreset : t -> Ojs.t

    val wsaeconnaborted : t -> Ojs.t

    val wsaeconnreset : t -> Ojs.t

    val wsaenobufs : t -> Ojs.t

    val wsaeisconn : t -> Ojs.t

    val wsaenotconn : t -> Ojs.t

    val wsaeshutdown : t -> Ojs.t

    val wsaetoomanyrefs : t -> Ojs.t

    val wsaetimedout : t -> Ojs.t

    val wsaeconnrefused : t -> Ojs.t

    val wsaeloop : t -> Ojs.t

    val wsaenametoolong : t -> Ojs.t

    val wsaehostdown : t -> Ojs.t

    val wsaehostunreach : t -> Ojs.t

    val wsaenotempty : t -> Ojs.t

    val wsaeproclim : t -> Ojs.t

    val wsaeusers : t -> Ojs.t

    val wsaedquot : t -> Ojs.t

    val wsaestale : t -> Ojs.t

    val wsaeremote : t -> Ojs.t

    val wsasysnotready : t -> Ojs.t

    val wsavernotsupported : t -> Ojs.t

    val wsanotinitialised : t -> Ojs.t

    val wsaediscon : t -> Ojs.t

    val wsaenomore : t -> Ojs.t

    val wsaecancelled : t -> Ojs.t

    val wsaeinvalidproctable : t -> Ojs.t

    val wsaeinvalidprovider : t -> Ojs.t

    val wsaeproviderfailedinit : t -> Ojs.t

    val wsasyscallfailure : t -> Ojs.t

    val wsaservice_not_found : t -> Ojs.t

    val wsatype_not_found : t -> Ojs.t

    val wsa_e_no_more : t -> Ojs.t

    val wsa_e_cancelled : t -> Ojs.t

    val wsaerefused : t -> Ojs.t
  end

  module Dlopen : sig
    type t

    val t_of_js : Ojs.t -> t

    val t_to_js : t -> Ojs.t

    val rtld_lazy : t -> Ojs.t

    val rtld_now : t -> Ojs.t

    val rtld_global : t -> Ojs.t

    val rtld_local : t -> Ojs.t

    val rtld_deepbind : t -> Ojs.t
  end

  module Priority : sig
    type t

    val t_of_js : Ojs.t -> t

    val t_to_js : t -> Ojs.t

    val priority_low : t -> Ojs.t

    val priority_below_normal : t -> Ojs.t

    val priority_normal : t -> Ojs.t

    val priority_above_normal : t -> Ojs.t

    val priority_high : t -> Ojs.t

    val priority_highest : t -> Ojs.t
  end

  val signals : t -> Signals.t

  val errno : t -> Errno.t

  val dlopen : t -> Dlopen.t

  val priority : t -> Priority.t
end

module NetworkInterface : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val address : t -> string

  val netmask : t -> string

  val family : t -> string

  val mac : t -> string

  val internal : t -> bool

  val scopeid : t -> int

  val cidr : t -> string
end

val eol : unit -> string

val arch : unit -> string

val constants : Constant.t

val cpus : unit -> CPU.t list

val endianness : unit -> string

val freemem : unit -> int

val getPriority : ?pid:int -> unit -> int

val homedir : unit -> string

val hostname : unit -> string

val loadavg : unit -> int list

val networkInterfaces : unit -> NetworkInterface.t list

val platform : unit -> string

val release : unit -> string

val setPriority : ?pid:int -> priority:int -> unit

val tmpdir : unit -> string

val totalmem : unit -> int

val type_ : unit -> string

val uptime : unit -> int

module UserInfoOptions : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val create : encoding:string -> t
end

module UserInfo : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val username : t -> string

  val uid : t -> int

  val gid : t -> int

  val shell : t -> string option

  val homedir : t -> string
end

val userInfo : ?options:UserInfoOptions.t -> unit -> UserInfo.t

val version : unit -> string
