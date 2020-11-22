{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name =
    "node-glob"
, dependencies =
    [ "arrays"
    , "console"
    , "effect"
    , "functions"
    , "node-fs"
    , "prelude"
    , "psci-support"
    ]
, packages =
    ./packages.dhall
, sources =
    [ "src/**/*.purs", "test/**/*.purs" ]
}
