{-# LANGUAGE MultiParamTypeClasses #-}

{-| New types of atomic data and type classes for attributes used in other,
larger sum types. -}
module BrainzStem.Types.Newtypes () where

import Data.Convertible (Convertible(..), convError)
import Data.UUID        (UUID, fromString, toString)
import Database.HDBC    (fromSql, toSql, SqlValue)

instance Convertible SqlValue UUID where
  safeConvert bbid = case fromString $ fromSql bbid of
              Just uuid -> return uuid
              Nothing -> convError "Not a valid BBID" bbid

instance Convertible UUID SqlValue where
  safeConvert = Right . toSql . toString
