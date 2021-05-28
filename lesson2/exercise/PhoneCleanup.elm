{-
   Exercise 1
   Lets craft a tiny phone cleanup.
   Its nain purpose is to eliminate all dashes from a provided phone number

   E.g. 819-9999-0000 should transform into -> 81999990000

   Create a function that accepts a phone number with dashes, and returns a
   phone number without the dashes

   Exercise 2
   The client is amused by our dash Remover. he now wants us to get rid of all
   characters that ARE NOT digits. Create a function that accepts an unfiltered
   phone number and returns only the digits

   Exercise 3
   Your team noticed is fascinated by the power of your program. and now wants
   to transform the model from a string, to a record (read: an "Elm" styled object [its not])
   How would you proceed with this?

   Exercise 4
   As a final request, there is a new member in your team who asks if anonymous
   functions are possible to implement in Elm. How would you proceed with this?
   Is it possible to apply an anonymous function, instead of the removeDashes
   function, duringthe update.
-}
 
module PhoneCleanup exposing (..)

import Browser
import Html exposing (Html, br, button, div, h2, input, label, text)
import Html.Attributes exposing (type_, value)
import Html.Events exposing (onClick, onInput)



{- Model, View, Update
   Our model is our initial value, that will be constantly updated through a function
   and will be rendered in our view, which composes our HTML elements

-}


main =
    Browser.sandbox { init = "", update = update, view = view }

type Msg
    = RemoveDashes
    | ChangeText String


update : Msg -> String -> String
update msg model =
    case msg of
        RemoveDashes ->
            removeDashes model

        ChangeText text ->
            text


removeDashes : String -> String
removeDashes word =
    String.filter isKeepable word


isKeepable : Char -> Bool
isKeepable enteredChar =
    enteredChar /= '-'


view model =
    div []
        [ h2 [] [ text "Tiny Phone Cleanup" ]
        , input [ type_ "text", onInput ChangeText ] []
        , button [ onClick RemoveDashes ] [ text "Remove Dashes" ]
        , br [] []
        , label [] [ text "Cleaned Result:" ]
        , br [] []
        , label [] [ text model ]
        ]
