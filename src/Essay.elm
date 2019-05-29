module Essay exposing (Model, getEssayByName, posts, view, viewEssayLink)

import Html exposing (..)
import Html.Attributes exposing (..)


type alias Model =
    { name : String
    , content : String
    , footerLinks : List String
    }


posts : List Model
posts =
    [ Model "Test1" "Test1 Content" [ "Test2" ]
    , Model "Test2" "Test2 Content" [ "Test1" ]
    ]


getEssayByName : String -> Maybe Model
getEssayByName blogName =
    let
        matches =
            List.filter (\p -> p.name == blogName) posts
    in
    case matches of
        [] ->
            Nothing

        post :: _ ->
            Just post



-- Produces the title of the page, and the html that should be rendered as the body of that page.


view : Model -> ( String, List (Html msg) )
view { name, content, footerLinks } =
    ( name
    , [ div [ class "blog-content" ]
            [ div [ class "blog-text" ]
                [ text content ]
            , div [ class "blog-footer" ]
                [ ul []
                    (List.map viewEssayLink footerLinks)
                ]
            ]
      ]
    )


viewEssayLink : String -> Html msg
viewEssayLink link =
    li [ class "essay-link" ] [ a [ href ("/blog/" ++ link) ] [ text link ] ]