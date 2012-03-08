-- | Shows the popup menu when the user right-clicks the icon
module Controller.Conditions.PreferencesDialogDestroy where

import Control.Monad
import Control.Monad.Reader (liftIO)
import Graphics.UI.Gtk

import CombinedEnvironment

installHandlers :: CEnv -> IO()
installHandlers cenv = void $ do
  dg <- preferencesDialog $ uiBuilder $ view cenv
  dg `on` deleteEvent $ liftIO (widgetHide dg) >> return True
