{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "my-project"
, dependencies =
  [ "canvas"
  , "console"
  , "effect"
  , "foldable-traversable"
  , "js-timers"
  , "maybe"
  , "monad-loops"
  , "prelude"
  , "psci-support"
  , "refs"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
