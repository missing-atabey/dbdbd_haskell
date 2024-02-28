{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
#if __GLASGOW_HASKELL__ >= 810
{-# OPTIONS_GHC -Wno-prepositive-qualified-module #-}
#endif
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_dbdbd_haskell (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [1,0] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath




bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/home/missing_atabey/.cabal/bin"
libdir     = "/home/missing_atabey/.cabal/lib/x86_64-linux-ghc-9.8.1/dbdbd-haskell-1.0-inplace-dbdbd-haskell"
dynlibdir  = "/home/missing_atabey/.cabal/lib/x86_64-linux-ghc-9.8.1"
datadir    = "/home/missing_atabey/.cabal/share/x86_64-linux-ghc-9.8.1/dbdbd-haskell-1.0"
libexecdir = "/home/missing_atabey/.cabal/libexec/x86_64-linux-ghc-9.8.1/dbdbd-haskell-1.0"
sysconfdir = "/home/missing_atabey/.cabal/etc"

getBinDir     = catchIO (getEnv "dbdbd_haskell_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "dbdbd_haskell_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "dbdbd_haskell_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "dbdbd_haskell_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "dbdbd_haskell_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "dbdbd_haskell_sysconfdir") (\_ -> return sysconfdir)



joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
