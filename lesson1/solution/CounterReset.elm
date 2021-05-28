module CounterReset exposing (..)

import Browser
import Html exposing (Html, button, div, text, br)
import Html.Events exposing (onClick)


main =
    Browser.sandbox { init = 0, update = update, view = view }

{-
Exercise
Currently our counter only increments and decrements by one unit:
- Add a RESET button that will set the model's value to zero (0)
-}
type Msg
    = Increment
    | Decrement
    | Reset

{- What does it all means????
In this case, we are speaking about a function (update), which takes:
2 arguments: a type Msg, and an Int
1 result: an Int
In other words, what we are saying is: 'Through the update function, we will
pass a Msg, an Int and we expect to receive an Int as a result
-}
update : Msg -> Int -> Int
update msg model =
    case msg of
        Increment ->
            model + 1 -- Sum one unit

        Decrement ->
            model - 1 -- Substact one unit

        Reset ->
            0 -- Reset counter to zero (0)


view model =
    div []
        [ button [ onClick Decrement ] [ text "-" ]
        , div [] [ text (String.fromInt model) ]
        , button [ onClick Increment ] [ text "+" ]
        , br [] []
        , button [ onClick Reset ] [ text "R" ]
        ]
