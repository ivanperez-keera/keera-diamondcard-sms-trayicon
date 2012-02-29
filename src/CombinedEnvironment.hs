-- | The environment that contains both the view and the model.
--
-- | FIXME: In a very rails-like move, this module will likely be
-- exactly the same for all programs, so we should try to put
-- a "Convention-over-configuration" policy in place and remove this
-- unless it must be adapted by the user.
module CombinedEnvironment
   ( module Exported
   , CEnv
   , onViewAsync
   )
  where

-- Internal libraries
import qualified Control.MVC.GenericCombinedEnvironment as GEnv
import Hails.MVC.DefaultGtkEnvironment as Exported

import View
import Model.ReactiveModel.ModelEvents
import Model.Model 

type CEnv = GEnv.CEnv View Model ModelEvent