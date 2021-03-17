open Import

module AesCbcParams = struct
  type t = private Ojs.t [@@js]

  val iv
    :  t
    -> (* <ArrayBuffer> | <TypedArray> | <DataView> | <Buffer> *)
       Buffer.Buffer.t
    [@@js.get]

  val name : t -> string [@@js.get]
end

module AesCtrParams = struct
  type t = private Ojs.t [@@js]

  val counter
    :  t
    -> (* <ArrayBuffer> | <TypedArray> | <DataView> | <Buffer> *)
       Buffer.Buffer.t
    [@@js.get]

  val length : t -> int [@@js.get]

  val name : t -> string [@@js.get]
end

module AesGcmParams = struct
  type t = private Ojs.t [@@js]

  val additionalData
    :  t
    -> (* <ArrayBuffer> | <TypedArray> | <DataView> | <Buffer> *)
       Buffer.Buffer.t or_undefined
    [@@js.get]

  val iv
    :  t
    -> (* <ArrayBuffer> | <TypedArray> | <DataView> | <Buffer> *)
       Buffer.Buffer.t
    [@@js.get]

  val name : t -> string [@@js.get]

  val tagLength : t -> int [@@js.get]
end

module AesImportParams = struct
  type t = private Ojs.t [@@js]

  val name : t -> string [@@js.get]
end

module AesKeyGenParams = struct
  type t = private Ojs.t [@@js]

  val length : t -> int [@@js.get]

  val name : t -> string [@@js.get]
end

module AesKwParams = struct
  type t = private Ojs.t [@@js]

  val name : t -> string [@@js.get]
end

module EcdsaParams = struct
  type t = private Ojs.t [@@js]

  val hash : t -> string [@@js.get]

  val name : t -> string [@@js.get]
end

module EcKeyGenParams = struct
  type t = private Ojs.t [@@js]

  val name : t -> string [@@js.get]

  val namedCurve : t -> string [@@js.get]
end

module EcKeyImportParams = struct
  type t = private Ojs.t [@@js]

  val name : t -> string [@@js.get]

  val namedCurve : t -> string [@@js.get]
end

module HkdfParams = struct
  type t = private Ojs.t [@@js]

  val hash : t -> string [@@js.get]

  val info
    :  t
    -> (* <ArrayBuffer> | <TypedArray> | <DataView> | <Buffer> *)
       Buffer.Buffer.t
    [@@js.get]

  val name : t -> string [@@js.get]

  val salt
    :  t
    -> (* <ArrayBuffer> | <TypedArray> | <DataView> | <Buffer> *)
       Buffer.Buffer.t
    [@@js.get]
end

module HmacImportParams = struct
  type t = private Ojs.t [@@js]

  val hash : t -> string [@@js.get]

  val length : t -> int [@@js.get]

  val name : t -> string [@@js.get]
end

module HmacKeyGenParams = struct
  type t = private Ojs.t [@@js]

  val hash : t -> string [@@js.get]

  val length : t -> int [@@js.get]

  val name : t -> string [@@js.get]
end

module HmacParams = struct
  type t = private Ojs.t [@@js]

  val name : t -> string [@@js.get]
end

module Pbkdf2ImportParams = struct
  type t = private Ojs.t [@@js]

  val name : t -> string [@@js.get]
end

module Pbkdf2Params = struct
  type t = private Ojs.t [@@js]

  val hash : t -> string [@@js.get]

  val iterations : t -> int [@@js.get]

  val name : t -> string [@@js.get]

  val salt
    :  t
    -> (* <ArrayBuffer> | <TypedArray> | <DataView> | <Buffer> *)
       Buffer.Buffer.t
    [@@js.get]
end

module RsaHashedImportParams = struct
  type t = private Ojs.t [@@js]

  val hash : t -> string [@@js.get]

  val name : t -> string [@@js.get]
end

module RsaHashedKeyGenParams = struct
  type t = private Ojs.t [@@js]

  val hash : t -> string [@@js.get]

  val modulusLength : t -> int [@@js.get]

  val name : t -> string [@@js.get]

  val publicExponent : t -> Uint8Array.t [@@js.get]
end

module RsaOaepParams = struct
  type t = private Ojs.t [@@js]

  val label
    :  t
    -> (* <ArrayBuffer> | <TypedArray> | <DataView> | <Buffer> *)
       Buffer.Buffer.t
    [@@js.get]

  val name : t -> string [@@js.get]
end

module RsaPssParams = struct
  type t = private Ojs.t [@@js]

  val name : t -> string [@@js.get]

  val saltLength : t -> int [@@js.get]
end

module RsaSignParams = struct
  type t = private Ojs.t [@@js]

  val name : t -> string [@@js.get]
end

module NodeDhImportParams = struct
  type t = private Ojs.t [@@js]

  val name : t -> string [@@js.get]
end

module NodeDhKeyGenParams = struct
  type t = private Ojs.t [@@js]

  val generator : t -> int [@@js.get]

  val group : t -> string [@@js.get]

  val prime : t -> Buffer.Buffer.t [@@js.get]

  val primeLength : t -> int [@@js.get]
end

module NodeDsaImportParams = struct
  type t = private Ojs.t [@@js]

  val hash : t -> string [@@js.get]

  val name : t -> string [@@js.get]
end

module NodeDsaKeyGenParams = struct
  type t = private Ojs.t [@@js]

  val divisorLength : t -> int [@@js.get]

  val hash : t -> string [@@js.get]

  val modulusLength : t -> int [@@js.get]

  val name : t -> string [@@js.get]
end

module NodeDsaSignParams = struct
  type t = private Ojs.t [@@js]

  val name : t -> string [@@js.get]
end

module NodeEdKeyGenParams = struct
  type t = private Ojs.t [@@js]

  val name : t -> string [@@js.get]

  val namedCurve : t -> string [@@js.get]
end

module NodeEdKeyImportParams = struct
  type t = private Ojs.t [@@js]

  val name : t -> string [@@js.get]

  val namedCurve : t -> string [@@js.get]

  val public : t -> bool [@@js.get]
end

module NodeScryptImportParams = struct
  type t = private Ojs.t [@@js]

  val name : t -> string [@@js.get]
end

module NodeScryptParams = struct
  type t = private Ojs.t [@@js]

  val encoding : t -> string [@@js.get]

  val maxmem : t -> int [@@js.get]

  val n : t -> int [@@js.get "n"]

  val p : t -> int [@@js.get]

  val r : t -> int [@@js.get]

  val salt
    :  t
    -> (* <string> | <ArrayBuffer> | <TypedArray> | <DataView> | <Buffer> *)
       Buffer.Buffer.t
    [@@js.get]
end

module CryptoKey = struct
  type t = private Ojs.t [@@js]

  type algorithm =
    | AesKeyGen of AesKeyGenParams.t
    | RsaHashedKeyGen of RsaHashedKeyGenParams.t
    | EcKeyGen of EcKeyGenParams.t
    | HmacKeyGen of HmacKeyGenParams.t
    | NodeDsaKeyGen of NodeDsaKeyGenParams.t
    | NodeDhKeyGen of NodeDhKeyGenParams.t

  let algorithm_of_js js_val =
    (* TODO: not sure about this, need to test *)
    match Ojs.type_of js_val with
    | "AesKeyGenParams" ->
      AesKeyGen ([%js.to: AesKeyGenParams.t] js_val)
    | "RsaHashedKeyGenParams" ->
      RsaHashedKeyGen ([%js.to: RsaHashedKeyGenParams.t] js_val)
    | "EcKeyGenParams" ->
      EcKeyGen ([%js.to: EcKeyGenParams.t] js_val)
    | "HmacKeyGenParams" ->
      HmacKeyGen ([%js.to: HmacKeyGenParams.t] js_val)
    | "NodeDsaKeyGenParams" ->
      NodeDsaKeyGen ([%js.to: NodeDsaKeyGenParams.t] js_val)
    | "NodeDhKeyGenParams" ->
      NodeDhKeyGen ([%js.to: NodeDhKeyGenParams.t] js_val)
    | _ ->
      assert false

  val algorithm : t -> algorithm [@@js.get]

  val extractable : t -> bool [@@js.get]

  val type_ : t -> string [@@js.get]

  val usages : t -> string list [@@js.get]
end

module NodeDhDeriveBitsParams = struct
  type t = private Ojs.t [@@js]

  val public : t -> CryptoKey.t [@@js.get]
end

module EcdhKeyDeriveParams = struct
  type t = private Ojs.t [@@js]

  val name : t -> string [@@js.get]

  val public : t -> CryptoKey.t [@@js.get]
end

module SubtleCrypto = struct
  type t = private Ojs.t [@@js]

  val decrypt
    :  t
    -> ([ `RsaOaep of RsaOaepParams.t
        | `AesCtr of AesCtrParams.t
        | `AesCbc of AesCbcParams.t
        | `AesGcm of AesGcmParams.t
        ]
       [@js.union])
    -> CryptoKey.t
    -> Buffer.Buffer.t
    -> ArrayBuffer.t Promise.t
    [@@js.call]

  val deriveBits
    :  t
    -> ([ `EcdhKeyDerive of EcdhKeyDeriveParams.t
        | `Hkdf of HkdfParams.t
        | `Pbkdf2 of Pbkdf2Params.t
        | `NodeDhDeriveBits of NodeDhDeriveBitsParams.t
        | `NodeScrypt of NodeScryptParams.t
        ]
       [@js.union])
    -> CryptoKey.t
    -> int
    -> ArrayBuffer.t Promise.t
    [@@js.call]

  val deriveKey
    :  t
    -> ([ `EcdhKeyDerive of EcdhKeyDeriveParams.t
        | `Hkdf of HkdfParams.t
        | `Pbkdf2 of Pbkdf2Params.t
        | `NodeDhDeriveBits of NodeDhDeriveBitsParams.t
        | `NodeScrypt of NodeScryptParams.t
        ]
       [@js.union])
    -> CryptoKey.t
    -> ([ `HmacKeyGen of HmacKeyGenParams.t | `AesKeyGen of AesKeyGenParams.t ]
       [@js.union])
    -> bool
    -> string list
    -> ArrayBuffer.t Promise.t
    [@@js.call]

  val digest : t -> string -> Buffer.Buffer.t -> ArrayBuffer.t Promise.t
    [@@js.call]

  val encrypt
    :  t
    -> ([ `RsaOaep of RsaOaepParams.t
        | `AesCtr of AesCtrParams.t
        | `AesCbc of AesCbcParams.t
        | `AesGcm of AesGcmParams.t
        ]
       [@js.union])
    -> CryptoKey.t
    -> ArrayBuffer.t Promise.t
    [@@js.call]

  val exportKey : t -> string -> CryptoKey.t -> ArrayBuffer.t Promise.t
    [@@js.call]

  val generateKey
    :  t
    -> ([ `RsaHashedKeyGen of RsaHashedKeyGenParams.t
        | `EcKeyGen of EcKeyGenParams.t
        | `HmacKeyGen of HmacKeyGenParams.t
        | `AesKeyGen of AesKeyGenParams.t
        | `NodeDsaKeyGen of NodeDsaKeyGenParams.t
        | `NodeDhKeyGen of NodeDhKeyGenParams.t
        | `NodeEdKeyGen of NodeEdKeyGenParams.t
        ]
       [@js.union])
    -> bool
    -> string
    -> ArrayBuffer.t Promise.t
    [@@js.call]

  val importKey
    :  t
    -> string
    -> Buffer.Buffer.t
    -> ([ `RsaHashedImport of RsaHashedImportParams.t
        | `EcKeyImport of EcKeyImportParams.t
        | `HmacImport of HmacImportParams.t
        | `AesImport of AesImportParams.t
        | `Pbkdf2Import of Pbkdf2ImportParams.t
        | `NodeDsaImport of NodeDsaImportParams.t
        | `NodeDhImport of NodeDhImportParams.t
        | `NodeScryptImport of NodeScryptImportParams.t
        | `NodeEdKeyImport of NodeEdKeyImportParams.t
        ]
       [@js.union])
    -> bool
    -> string list
    -> CryptoKey.t Promise.t
    [@@js.call]

  val sign
    :  t
    -> ([ `RsaSign of RsaSignParams.t
        | `RsaPss of RsaPssParams.t
        | `Ecdsa of EcdsaParams.t
        | `Hmac of HmacParams.t
        | `NodeDsaSign of NodeDsaSignParams.t
        ]
       [@js.union])
    -> CryptoKey.t
    -> Buffer.Buffer.t
    -> ArrayBuffer.t Promise.t
    [@@js.call]

  val unwrapKey
    :  t
    -> string
    -> Buffer.Buffer.t
    -> CryptoKey.t
    -> ([ `RsaOaep of RsaOaepParams.t
        | `AesCtr of AesCtrParams.t
        | `AesCbc of AesCbcParams.t
        | `AesGcm of AesGcmParams.t
        | `AesKw of AesKwParams.t
        ]
       [@js.union])
    -> ([ `RsaHashedImport of RsaHashedImportParams.t
        | `EcKeyImport of EcKeyImportParams.t
        | `HmacImport of HmacImportParams.t
        | `AesImport of AesImportParams.t
        ]
       [@js.union])
    -> bool
    -> string list
    -> CryptoKey.t Promise.t
    [@@js.call]

  val verify
    :  t
    -> ([ `RsaSign of RsaSignParams.t
        | `RsaPss of RsaPssParams.t
        | `Ecdsa of EcdsaParams.t
        | `Hmac of HmacParams.t
        | `NodeDsaSign of NodeDsaSignParams.t
        ]
       [@js.union])
    -> CryptoKey.t
    -> Buffer.Buffer.t
    -> Buffer.Buffer.t
    -> bool Promise.t
    [@@js.call]

  val wrapKey
    :  t
    -> string
    -> CryptoKey.t
    -> CryptoKey.t
    -> ([ `RsaOaep of RsaOaepParams.t
        | `AesCtr of AesCtrParams.t
        | `AesCbc of AesCbcParams.t
        | `AesGcm of AesGcmParams.t
        | `AesKw of AesKwParams.t
        ]
       [@js.union])
    -> ArrayBuffer.t Promise.t
    [@@js.call]
end

module CryptoKeyPair = struct
  type t = private Ojs.t [@@js]

  val privateKey : t -> CryptoKey.t [@@js.get]

  val publicKey : t -> CryptoKey.t [@@js.get]
end

module Crypto = struct
  type t = private Ojs.t [@@js]

  val subtle : t -> SubtleCrypto.t [@@js.get]

  val getRandomValues : t -> Buffer.Buffer.t -> Buffer.Buffer.t [@@js.call]
end
