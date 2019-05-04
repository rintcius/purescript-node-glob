module Node.Glob where

import Prelude
import Effect (Effect)
import Data.Function.Uncurried (Fn2, runFn2)
import Node.FS.Internal (mkEffect)

foreign import unsafeRequireGlob :: forall props. { | props }

newtype Pattern = Pattern String

glob ::
  { sync :: forall opts. Fn2 Pattern { | opts } (Array String)
  }
glob = unsafeRequireGlob

sync :: forall opts. Pattern
        -> { | opts }
        -> Effect (Array String)
sync pattern options = mkEffect $ \_ -> runFn2
  glob.sync pattern options
