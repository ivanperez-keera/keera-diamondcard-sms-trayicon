-- | This module contains a series of conditions that must hold between
-- the view and the model. Most of these conditions can be separated in
-- two conditions: one that must be checked only when the model changes
-- (and updates the view accordingly), and another that must be checked
-- when the view receives an event (and updates the model accordingly).

module Controller.Conditions where

-- Internal libraries
import CombinedEnvironment

-- Internal libraries: specific conditions
import qualified Controller.Conditions.Config                   as Config
-- SMS contents and destination
import qualified Controller.Conditions.Message                  as Message
-- User Preferences
import qualified Controller.Conditions.Preferences              as Preferences
import qualified Controller.Conditions.PreferencesDialog        as PreferencesDialog
import qualified Controller.Conditions.PreferencesDialogDestroy as PreferencesDialogDestroy
import qualified Controller.Conditions.PopupMenu                as PopupMenu
import qualified Controller.Conditions.Send                     as Send
import qualified Controller.Conditions.SmsWindow                as SmsWindow
import qualified Controller.Conditions.Status                   as Status
import qualified Controller.Conditions.Quit                     as Quit

installHandlers :: CEnv -> IO()
installHandlers cenv = do
  Config.installHandlers                   cenv
  Preferences.installHandlers              cenv
  PreferencesDialog.installHandlers        cenv
  PreferencesDialogDestroy.installHandlers cenv
  PopupMenu.installHandlers                cenv
  SmsWindow.installHandlers                cenv
  Message.installHandlers                  cenv
  Quit.installHandlers                     cenv
  Send.installHandlers                     cenv
  Status.installHandlers                   cenv