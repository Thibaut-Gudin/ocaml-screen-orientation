# ocaml-screen-orientation

Binding to
[cordova-plugin-screen-orientation](https://github.com/apache/cordova-plugin-screen-orientation)

This library is based on [this library](https://github.com/dannywillems/ocaml-cordova-plugin-screen-orientation)

## What does ocaml-screen-orientation do ?

This library mainly provide functions that allow to lock/unlock the
screen orientation of a mobile device in an application.

## How to install and compile your project by using this plugin ?

You can use opam by pinning the repository with:
```Shell
opam pin add screen-orientation https://github.com/Thibaut-Gudin/ocaml-screen-orientation
```

to compile your project, use:
```Shell
dune build @install
```

Finally, install the cordova plugin "screen-orientation" with:
```Shell
cordova plugin add screen-orientation
```


## How to use it?

The functions `screen_available` and `orientation_available` can be used
to know if the plugins "screen" and "screen.orientation" are available,
it's recommended to do theses evaluations before trying to use the others
functions of this library.

### What's an `orientation_type` ?
The type `orientation_type` is used in some function, it represents one
of 7 possible orientations that can take a mobile device: [see this page
for more details](https://github.com/apache/cordova-plugin-screen-orientation#supported-orientations).

You can create an "orientation_type" value simply by typing for example
"Portrait" or "Landscape" like you can see in `screen_orientation.mli`.
You can also convert an `orientation_type` into string or convert a string
into an `orientation_type` with the functions "orientation_type_to_str"
and "orientation_type_from_str", this can be especially useful combined
with the function "get_orientation_type" that return the current
`orientation_type` of the mobile device in the form of a string.

### `Lock` and `Unlock`
The two main functionality of this library are represented by the
modules `Lock` and `Unlock`:

As their name involve, the first module and it's main function "lock"
enable to lock a mobile device into a certain position while navigating
into an application while the second one and it's main function "unlock"
is used to cancelled the action of the `lock` function.

The two module have their own `then_` function that allow to execute a
given callback after the execution of `lock` or `unlock`.
