let promise (f : _ -> unit) =
  let (promise, resolver) = Lwt.task () in
  f @@ Lwt.wakeup resolver ;
  promise

let lock_lwt ori =
  promise @@ fun wakeup -> Base.Lock.then_ (Base.Lock.lock ori) ~callback:wakeup

let unlock_lwt () =
  promise @@ fun wakeup ->
  Base.Unlock.then_ (Base.Unlock.unlock ()) ~callback:wakeup
