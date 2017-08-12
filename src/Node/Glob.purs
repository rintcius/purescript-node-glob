module Node.Glob where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Exception (EXCEPTION)
import Data.Function.Uncurried (Fn2, runFn2)
import Node.FS (FS)
import Node.FS.Internal (mkEff)

foreign import unsafeRequireGlob :: forall props. { | props }

newtype Pattern = Pattern String

glob ::
  { sync :: forall opts. Fn2 Pattern { | opts } (Array String)
  }
glob = unsafeRequireGlob

sync :: forall eff opts. Pattern
        -> { | opts }
        -> Eff (fs :: FS, err :: EXCEPTION | eff) (Array String)
sync pattern options = mkEff $ \_ -> runFn2
  glob.sync pattern options
