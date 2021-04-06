(lang dune 2.0)

(name ocaml-node)

(documentation "https://tmattio.github.io/node/")

(source
 (github tmattio/node))

(license MIT)

(authors "Thibaut Mattio")

(maintainers "Thibaut Mattio")

(generate_opam_files true)

(package
 (name node)
 (synopsis "NodeJS bindings for OCaml")
 (description "NodeJS bindings for OCaml")
 (depends
  (ocaml
   (>= 4.08.0))
  dune
  (gen_js_api
   (>= 1.0.7))
  js_of_ocaml
  js_of_ocaml-compiler
  ojs
  (odoc :with-doc)))

(package
 (name ocaml-node)
 (synopsis "Virtual library for a NodeJS API")
 (description "Virtual library for a NodeJS API")
 (depends
  (ocaml
   (>= 4.08.0))
  dune
  (odoc :with-doc)))

(package
 (name ocaml-node-js)
 (synopsis "JS backend for ocaml-node using NodeJS bindings")
 (description "JS backend for ocaml-node using NodeJS bindings")
 (depends
  (ocaml
   (>= 4.08.0))
  dune
  (odoc :with-doc)))

(package
 (name ocaml-node-unix)
 (synopsis "Native backend for ocaml-node using libuv")
 (description "Native backend for ocaml-node using libuv")
 (depends
  (ocaml
   (>= 4.08.0))
  dune
  luv
  (odoc :with-doc)))
