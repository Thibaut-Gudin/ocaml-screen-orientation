(*
let promise (f : _ -> unit) =
  let (promise, resolver) = Lwt.task () in
  f @@ Lwt.wakeup resolver ;
  promise

let lock_lwt ori =
  promise @@ fun wakeup -> Base.Lock.then_ (Base.Lock.lock ori) ~callback:wakeup

let unlock_lwt () =
  promise @@ fun wakeup ->
  Base.Unlock.then_ (Base.Unlock.unlock ()) ~callback:wakeup
 *)

let promise (f : _ -> unit) = Promise.make (fun ~resolve:_ ~reject:_ -> f ())

let lock_lwt ori ~callback =
  Promise_lwt.of_promise
    (Promise.then_
       ~fulfilled:(fun _ -> promise callback)
       (promise (fun _ ->
            let _ = Base.Lock.lock ori in
            ())))

let unlock_lwt () ~callback =
  Promise_lwt.of_promise
    (Promise.then_
       ~fulfilled:(fun _ -> promise callback)
       (promise (fun _ ->
            let _ = Base.Unlock.unlock () in
            ())))
