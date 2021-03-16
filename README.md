# NodeJS

[![Actions Status](https://github.com/tmattio/ocaml-node/workflows/CI/badge.svg)](https://github.com/tmattio/ocaml-node/actions)

NodeJS bindings for OCaml

## Installation

```bash
opam install node
```

## Status

❌ : Not implemented
🚧 : Partially implemented
✅ : Fully implemented

| API                  | Progress | Module              |
| -------------------- | -------- | ------------------- |
| Assertion testing    | ❌        | n/a                 |
| Async hooks          | ❌        | n/a                 |
| Buffer               | 🚧        | `Node.Buffer`       |
| Child processes      | 🚧        | `Node.ChildProcess` |
| Cluster              | ❌        | n/a                 |
| Console              | 🚧        | `Node.Console`      |
| Crypto               | 🚧        | `Node.Crypto`       |
| Debugger             | ❌        | n/a                 |
| Diagnostics Channel  | ❌        | n/a                 |
| DNS                  | 🚧        | `Node.Dns`          |
| Domain               | ❌        | n/a                 |
| Errors               | ❌        | n/a                 |
| Events               | ❌        | n/a                 |
| File system          | 🚧        | `Node.Fs`           |
| Globals              | 🚧        | `Node`              |
| HTTP                 | ✅        | `Node.Http`         |
| HTTP/2               | ❌        | n/a                 |
| HTTPS                | ✅        | `Node.Https`        |
| Inspector            | ❌        | n/a                 |
| Internationalization | ❌        | n/a                 |
| Net                  | ✅        | `Node.Net`          |
| OS                   | ✅        | `Node.Os`           |
| Path                 | ✅        | `Node.Path`         |
| Performance hooks    | ❌        | n/a                 |
| Process              | 🚧        | `Node.Process`      |
| Query strings        | ❌        | n/a                 |
| Readline             | ❌        | n/a                 |
| REPL                 | ❌        | n/a                 |
| Stream               | 🚧        | `Node.Stream`       |
| String decoder       | ❌        | n/a                 |
| Timers               | 🚧        | `Node.Timeout`      |
| TLS/SSL              | ✅        | `Node.Tls`          |
| Trace events         | ❌        | n/a                 |
| TTY                  | ❌        | n/a                 |
| UDP/datagram         | ❌        | n/a                 |
| URL                  | ❌        | n/a                 |
| Utilities            | 🚧        | `Node.Util`         |
| V8                   | ❌        | n/a                 |
| VM                   | ❌        | n/a                 |
| WASI                 | ❌        | n/a                 |
| Web Crypto API       | ✅        | `Node.WebCrypto`    |
| Worker threads       | ❌        | n/a                 |
| Zlib                 | ❌        | n/a                 |

## Contributing

Take a look at our [Contributing Guide](CONTRIBUTING.md).