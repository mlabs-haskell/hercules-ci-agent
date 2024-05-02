module Paths_hercules_ci_agent where

import Data.Version
import Prelude

version :: Version
version = Version [0] []

getBinDir :: IO FilePath
getBinDir = pure "/bad/lsp/bindir"

getDataFileName :: FilePath -> IO FilePath
getDataFileName = pure
