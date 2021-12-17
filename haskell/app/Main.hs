
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE TypeApplications #-}

module Main where

import           Data.List
import           Data.Maybe
import qualified Data.Text                     as T
import           Data.Text
import           GHC.Generics
import           Network.Wai.Handler.Warp
import           Servant

type API
  = QueryParam "first_name" Text :> QueryParam "last_name" Text :> Get '[PlainText] Text

handlers :: Server API
handlers = handleHome
 where
  handleHome :: Maybe Text -> Maybe Text -> Handler Text
  handleHome fname lname =
    return $ (T.pack "[Haskell] Hello, ") <> (fromMaybe "" fname) <> (fromMaybe "" lname)

app1 :: Application
app1 = serve (Proxy @API) handlers

main :: IO ()
main = run 9001 app1
