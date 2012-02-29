module Hails.MVC.Model.ReactiveFields where

import Control.Concurrent.Model.ReactiveModel

-- The following code presents a possibly simpler way of creating reactive
-- fields in a reactive model.
type Field a b c = (b -> a, a -> b -> Bool, a -> b -> b, c)

preTrue :: a -> b -> Bool
preTrue = const $ const True

fieldSetter :: (Eq a, Event c) => 
               Field a b c -> ReactiveModel b c d -> a -> ReactiveModel b c d
fieldSetter f@(_, pre, rSet, ev) rm newVal
  | fieldGetter f rm == newVal       = rm
  | not $ pre newVal $ basicModel rm = triggerEvent rm ev
  | otherwise                        = triggerEvent rm' ev
 where rm' = rm `onBasicModel` rSet newVal

fieldGetter :: (Event c) => Field a b c -> ReactiveModel b c d -> a
fieldGetter (rGet,_,_,_) = rGet . basicModel
