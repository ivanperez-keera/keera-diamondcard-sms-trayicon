-- | Contains the protected model definition used by other modules to
-- declare the protected fields.
--
-- Copyright   : (C) Keera Studios Ltd, 2015
-- License     : BSD3
-- Maintainer  : support@keera.co.uk
module Model.ProtectedModel.ProtectedModelInternals
   ( ProtectedModel
   , GPM.onReactiveModel
   , GPM.fromReactiveModel
   , GPM.applyToReactiveModel
   , GPM.onEvent
   , GPM.onEvents
   , GPM.waitFor
   )
  where

import Model.Model
import Model.ReactiveModel.ModelEvents
import qualified Hails.MVC.Model.ProtectedModel as GPM

type ProtectedModel = GPM.ProtectedModel Model ModelEvent
