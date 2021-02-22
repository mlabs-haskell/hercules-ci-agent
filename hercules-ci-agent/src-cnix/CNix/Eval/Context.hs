{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}

module CNix.Eval.Context
  ( module CNix.Eval.Context,
    module Hercules.CNix.Store.Context,
  )
where

import qualified Data.Map as M
import Hercules.CNix.Store.Context hiding (context)
import qualified Language.C.Inline.Context as C
import qualified Language.C.Inline.Cpp as C
import qualified Language.C.Types as C
import Protolude

data EvalState

data Value'

data Attr'

context :: C.Context
context =
  C.cppCtx <> C.fptrCtx
    <> C.bsCtx
    <> evalContext

(=:) :: k -> a -> Map k a
(=:) = M.singleton

evalContext :: C.Context
evalContext =
  mempty
    { C.ctxTypesTable =
        C.TypeName "EvalState" =: [t|EvalState|]
          <> C.TypeName "Value" =: [t|Value'|]
          <> C.TypeName "Attr" =: [t|Attr'|]
    }
