open Ocaml_node
open Alcotest

let test_file_exists () =
  Fs.exists_sync "fixtures/dummy" |> check bool "is true" true

let test_read_file () =
  let buf = Fs.read_file_sync "fixtures/dummy" in
  Buffer.to_string buf |> check string "is same string" "dummy"

let test_write_file () =
  let buf = Buffer.from_string "dummy2" in
  Fs.write_file_sync "fixtures/dummy2" buf;
  let buf = Fs.read_file_sync "fixtures/dummy2" in
  Buffer.to_string buf |> check string "is same string" "dummy2"

let case n f = test_case n `Quick f

let suite =
  [ case "can tell if file exists" test_file_exists
  ; case "can read from file" test_read_file
  ; case "can write to file" test_write_file
  ]

let () = Alcotest.run "ocaml-platform" [ "fs_test", suite ]
