{-# LANGUAGE CPP #-}
#if defined(__GLASGOW_HASKELL__) && __GLASGOW_HASKELL__ >= 702
{-# LANGUAGE Safe #-}
#endif
-----------------------------------------------------------------------------
-- |
-- Module      :  Control.Comonad.Trans.Class
-- Copyright   :  (C) 2008-2011 Edward Kmett
-- License     :  BSD-style (see the file LICENSE)
--
-- Maintainer  :  Edward Kmett <ekmett@gmail.com>
-- Stability   :  provisional
-- Portability :  portable
----------------------------------------------------------------------------
module Control.Comonad.Trans.Class
  ( ComonadTrans(..) ) where

import Control.Comonad
import Control.Monad.Trans.Identity

class ComonadTrans t where
  lower :: Comonad w => t w a -> w a

-- avoiding orphans
instance ComonadTrans IdentityT where
  lower = runIdentityT
