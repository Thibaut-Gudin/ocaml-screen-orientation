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

val lock : orientation_type -> unit [@@js.global "screen.orientation.lock"]

val orientation : unit -> unit [@@js.global "screen.orientation.unlock"]

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

val lock_then :
  lock:(orientation_type -> unit) -> callback:(unit -> unit) -> unit
  [@@js.global "screen.orientation.lock.then"]

val unlock_then : unlock:(unit -> unit) -> callback:(unit -> unit) -> unit
  [@@js.global "screen.orientation.unlock.then"]

(*Pas sûr, renvoie des string?*)
val get_orientation_type : unit -> string
  [@@js.global "screen.orientation.type_"]
