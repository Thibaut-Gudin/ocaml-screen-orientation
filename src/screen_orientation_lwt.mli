val lock_lwt : Base.orientation_type -> callback:(unit -> unit) -> unit Lwt.t

val unlock_lwt : unit -> callback:(unit -> unit) -> unit Lwt.t
