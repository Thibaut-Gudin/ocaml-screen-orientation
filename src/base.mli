type orientation_type =
  | Portrait_primary [@js "portrait-primary"]
  | Portrait_secondary [@js "portrait-secondary"]
  | Landscape_primary [@js "landscape-primary"]
  | Landscape_secondary [@js "landscape-secondary"]
  | Portrait [@js "portrait"]
  | Landscape [@js "landscape"]
  | Any [@js "any"]
[@@js.enum]

[@@@js.stop]

val orientation_type_to_str : orientation_type -> string

val orientation_type_from_str : string -> orientation_type

[@@@js.start]

[@@@js.implem
let orientation_type_to_str c =
  match c with
  | Portrait_primary -> "portrait-primary"
  | Portrait_secondary -> "portrait-secondary"
  | Landscape_primary -> "landscape-primary"
  | Landscape_secondary -> "landscape-secondary"
  | Portrait -> "portrait"
  | Landscape -> "landscape"
  | Any -> "any"]

[@@@js.implem
let orientation_type_from_str str =
  if String.equal str "portrait-primary" then Portrait_primary
  else if String.equal str "portrait-secondary" then Portrait_secondary
  else if String.equal str "landscape-primary" then Landscape_primary
  else if String.equal str "landscape-secondary" then Landscape_secondary
  else if String.equal str "portrait" then Portrait
  else if String.equal str "landscape" then Landscape
  else Any]

[@@@js.stop]

val screen_available : unit -> bool

val orientation_available : unit -> bool

[@@@js.start]

[@@@js.implem
let screen_available () =
  Js_of_ocaml.Js.Optdef.test Js_of_ocaml.Js.Unsafe.global##.screen]

[@@@js.implem
let orientation_available () =
  Js_of_ocaml.Js.Optdef.test Js_of_ocaml.Js.Unsafe.global##.screen##.orientation]

module Lock : sig
  type t

  val lock : orientation_type -> t [@@js.global "screen.orientation.lock"]

  val then_ : t -> callback:(unit -> unit) -> unit [@@js.call]
end

module Unlock : sig
  type t

  val unlock : unit -> t [@@js.global "screen.orientation.unlock"]

  val then_ : t -> callback:(unit -> unit) -> unit [@@js.call]
end

val get_orientation_type : unit -> string [@@js.get "screen.orientation.type"]
