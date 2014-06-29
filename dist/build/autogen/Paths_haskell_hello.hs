module Paths_haskell_hello (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1,0,0], versionTags = []}
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/lappy/.cabal/bin"
libdir     = "/home/lappy/.cabal/lib/i386-linux-ghc-7.6.3/haskell-hello-0.1.0.0"
datadir    = "/home/lappy/.cabal/share/i386-linux-ghc-7.6.3/haskell-hello-0.1.0.0"
libexecdir = "/home/lappy/.cabal/libexec"
sysconfdir = "/home/lappy/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "haskell_hello_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "haskell_hello_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "haskell_hello_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "haskell_hello_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "haskell_hello_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
