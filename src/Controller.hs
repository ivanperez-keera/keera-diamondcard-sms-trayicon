-- | This contains the main controller. Many operations will be
-- implemented in the Controller.* subsystem. This module simply
-- initialises program.
module Controller where

-- Uncomment the following line if you need to capture errors
-- import System.Glib.GError

-- Internal imports
import View (initView, startView)
import CombinedEnvironment
import Controller.Conditions
import Model.Model
import Model.ProtectedModel

-- | Starts the program by creating the model,
-- the view, starting all the concurrent threads,
-- installing the hanlders for all the conditions
-- and starting the view.
startController :: IO ()
startController = do
  -- Uncomment the following line if you need to debug errors
  -- handleGError (\(GError _ _ em) -> putStrLn em) $ do
  
    -- Initialise the visual layer
    initView

    -- Create an empty model
    cenv <- createCEnv emptyBM

    -- Install the model and view handlers
    installHandlers cenv
  
    -- Modify the system initialisation
    initialiseSystem $ model cenv

    -- Run the view
    startView
