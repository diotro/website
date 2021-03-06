module Route exposing (Route(..), fromUrl, fromUrlString, toUrlString)

import Url exposing (Url)
import Url.Builder
import Url.Parser as Parser exposing ((</>), Parser, oneOf, s)


type Route
    = Home
    | Essays
    | Essay String
    | Log
    | LogEntry Int
    | Resume
    | TwelveProblems


parser : Parser (Route -> a) a
parser =
    oneOf
        [ Parser.map Home Parser.top
        , Parser.map Essays (s "essays")
        , Parser.map Essay (s "essay" </> Parser.string)
        , Parser.map Resume (s "resume")
        , Parser.map Log (s "logs")
        , Parser.map LogEntry (s "log" </> Parser.int)
        , Parser.map TwelveProblems (s "twelve")
        ]


fromUrl : Url -> Maybe Route
fromUrl url =
    Parser.parse parser url


fromUrlString : String -> Maybe Route
fromUrlString urlString =
    Maybe.andThen
        (Parser.parse parser)
        (Url.fromString ("https://julianzucker.com" ++ Url.Builder.absolute [ urlString ] []))


toUrlString : Route -> String
toUrlString route =
    case route of
        Home ->
            "/"

        Essays ->
            "/essays/"

        Essay slug ->
            "/essay/" ++ slug

        Resume ->
            "/resume/"

        Log ->
            "/logs/"

        LogEntry weekNum ->
            "/log/" ++ String.fromInt weekNum

        TwelveProblems ->
            "/twelve/"
