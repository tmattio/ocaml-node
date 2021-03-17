open Import

module AesCbcParams : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val iv : t -> Buffer.Buffer.t

  val name : t -> string
end

module AesCtrParams : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val counter : t -> Buffer.Buffer.t

  val length : t -> int

  val name : t -> string
end

module AesGcmParams : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val additionalData : t -> Buffer.Buffer.t or_undefined

  val iv : t -> Buffer.Buffer.t

  val name : t -> string

  val tagLength : t -> int
end

module AesImportParams : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val name : t -> string
end

module AesKeyGenParams : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val length : t -> int

  val name : t -> string
end

module AesKwParams : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val name : t -> string
end

module EcdsaParams : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val hash : t -> string

  val name : t -> string
end

module EcKeyGenParams : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val name : t -> string

  val namedCurve : t -> string
end

module EcKeyImportParams : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val name : t -> string

  val namedCurve : t -> string
end

module HkdfParams : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val hash : t -> string

  val info : t -> Buffer.Buffer.t

  val name : t -> string

  val salt : t -> Buffer.Buffer.t
end

module HmacImportParams : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val hash : t -> string

  val length : t -> int

  val name : t -> string
end

module HmacKeyGenParams : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val hash : t -> string

  val length : t -> int

  val name : t -> string
end

module HmacParams : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val name : t -> string
end

module Pbkdf2ImportParams : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val name : t -> string
end

module Pbkdf2Params : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val hash : t -> string

  val iterations : t -> int

  val name : t -> string

  val salt : t -> Buffer.Buffer.t
end

module RsaHashedImportParams : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val hash : t -> string

  val name : t -> string
end

module RsaHashedKeyGenParams : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val hash : t -> string

  val modulusLength : t -> int

  val name : t -> string

  val publicExponent : t -> Uint8Array.t
end

module RsaOaepParams : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val label : t -> Buffer.Buffer.t

  val name : t -> string
end

module RsaPssParams : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val name : t -> string

  val saltLength : t -> int
end

module RsaSignParams : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val name : t -> string
end

module NodeDhImportParams : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val name : t -> string
end

module NodeDhKeyGenParams : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val generator : t -> int

  val group : t -> string

  val prime : t -> Buffer.Buffer.t

  val primeLength : t -> int
end

module NodeDsaImportParams : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val hash : t -> string

  val name : t -> string
end

module NodeDsaKeyGenParams : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val divisorLength : t -> int

  val hash : t -> string

  val modulusLength : t -> int

  val name : t -> string
end

module NodeDsaSignParams : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val name : t -> string
end

module NodeEdKeyGenParams : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val name : t -> string

  val namedCurve : t -> string
end

module NodeEdKeyImportParams : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val name : t -> string

  val namedCurve : t -> string

  val public : t -> bool
end

module NodeScryptImportParams : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val name : t -> string
end

module NodeScryptParams : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val encoding : t -> string

  val maxmem : t -> int

  val n : t -> int

  val p : t -> int

  val r : t -> int

  val salt : t -> Buffer.Buffer.t
end

module CryptoKey : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  type algorithm =
    | AesKeyGen of AesKeyGenParams.t
    | RsaHashedKeyGen of RsaHashedKeyGenParams.t
    | EcKeyGen of EcKeyGenParams.t
    | HmacKeyGen of HmacKeyGenParams.t
    | NodeDsaKeyGen of NodeDsaKeyGenParams.t
    | NodeDhKeyGen of NodeDhKeyGenParams.t

  val algorithm : t -> algorithm

  val extractable : t -> bool

  val type_ : t -> string

  val usages : t -> string list
end

module NodeDhDeriveBitsParams : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val public : t -> CryptoKey.t
end

module EcdhKeyDeriveParams : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val name : t -> string

  val public : t -> CryptoKey.t
end

module SubtleCrypto : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

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

  val digest : t -> string -> Buffer.Buffer.t -> ArrayBuffer.t Promise.t

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

  val exportKey : t -> string -> CryptoKey.t -> ArrayBuffer.t Promise.t

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
end

module CryptoKeyPair : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val privateKey : t -> CryptoKey.t

  val publicKey : t -> CryptoKey.t
end

module Crypto : sig
  type t

  val t_of_js : Ojs.t -> t

  val t_to_js : t -> Ojs.t

  val subtle : t -> SubtleCrypto.t

  val getRandomValues : t -> Buffer.Buffer.t -> Buffer.Buffer.t
end
