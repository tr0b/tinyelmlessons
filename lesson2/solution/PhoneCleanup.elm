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
   There is a new member in your team who asks if anonymous
   functions are possible to implement in Elm. How would you proceed with this?
   Is it possible to apply an anonymous function, instead of the removeDashes
   function, during the update.
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
    Browser.sandbox { init = init, update = update, view = view }



{- We create a type alias that contains a record. Such record syntax will consist
   of a property named phone, which will be  a string
-}


type alias Model =
    { phone : String }


init : Model
init =
    { phone = "400-1234-5678" } -- Dummy Initial Value

type Msg
    = RemoveDashes
    | ChangeText String


update : Msg -> Model -> Model
update msg model =
    case msg of
        RemoveDashes ->
            { model | phone = String.filter (\char -> Char.isDigit char ) model.phone } -- Exercise 2, 3 and 4

        ChangeText text ->
            { model | phone = text }


view : Model -> Html Msg
view model =
    div []
        [ h2 [] [ text "Tiny Phone Cleanup" ]
        , input [ type_ "text", onInput ChangeText ] []
        , button [ onClick RemoveDashes ] [ text "Remove Dashes" ]
        , br [] []
        , label [] [ text "Cleaned Result:" ]
        , br [] []
        , label [] [ text model.phone ]
        ]
