-- | Definition of a role.
module BookBrainz.Types.Role
       ( Role(..)
       ) where

--------------------------------------------------------------------------------
{-| The role a 'Person' played on a core entity (author, translator, etc. -}
data Role = Role
    { -- | The name of the role.
      roleName :: String
    }