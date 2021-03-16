(lang dune 2.0)

(name node)

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
  gen_js_api
  promise_jsoo
  js_of_ocaml
  (odoc :with-doc)))
