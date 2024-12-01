module Page.Layout exposing (..)

import Element exposing (..)
import Element.Background as Background
import Element.Font as Font
import FontAwesome.Styles
import Model exposing (Model)
import Model.Msg exposing (Msg)
import Model.Social as Social
import Page.Main exposing (..)
import View.Color as Color
import View.Element exposing (..)


bigDesktop : Model -> Element Msg
bigDesktop model =
    column
        [ centerX, width fill, height fill, spacing 50 ]
        [ html FontAwesome.Styles.css
        , column [ height (fillPortion 4), centerX, width fill, spacing 30 ]
            [ logo [ Font.size 20, alignBottom ]
            , title [ Font.size 24, alignBottom ]
            , linksRow
                [ alignBottom ]
                [ ggSocial model Social.gitHub
                , ggSocial model Social.youTube
                , ggSocial model Social.x
                , ggSocial model Social.twitch
                , ggSocial model Social.blueSky
                , ggSocial model Social.linkedIn
                , ggSocial model Social.email
                ]
            ]
        , menu [ height (fillPortion 3) ] model
        ]


desktop : Model -> Element Msg
desktop model =
    column
        [ centerX, width fill, height fill, spacing 50 ]
        [ html FontAwesome.Styles.css
        , column [ centerX, width fill, spacing 30 ]
            [ logo [ Font.size 20, alignTop ]
            , title [ Font.size 24, alignTop ]
            , linksRow []
                [ ggSocial model Social.gitHub
                , ggSocial model Social.youTube
                , ggSocial model Social.x
                , ggSocial model Social.twitch
                , ggSocial model Social.blueSky
                , ggSocial model Social.linkedIn
                , ggSocial model Social.email
                ]
            ]
        , menu [ alignTop, height fill ] model
        ]


phone : Model -> Element Msg
phone _ =
    column
        [ width fill
        , height fill
        , centerX
        , centerY
        , spacing 20
        , paddingEach { edges | left = 30, right = 30 }
        , scrollbarY
        ]
        [ html FontAwesome.Styles.css
        , logo [ Font.size 8 ]
        , title [ Font.size 12 ]
        , column [ centerX, spacing 10 ]
            [ linksRow []
                [ social Social.gitHub
                , social Social.youTube
                , social Social.x
                , social Social.twitch
                ]
            , linksRow []
                [ social Social.blueSky
                , social Social.linkedIn
                , social Social.email
                ]
            ]
        , row [ centerX ] [ t [ Font.size 32 ] "About" ]
        , column
            [ width fill
            , height fill
            , centerX
            , Background.color Color.elevatedGrey
            , spacing 20
            , paddingEach { edges | top = 20, bottom = 20, left = 10, right = 10 }
            ]
            aboutText
        , row [ centerX ] [ downloadCV ]
        , row [ centerX ] [ t [ Font.size 32 ] "Blog" ]
        , row [ centerX, paddingEach { edges | bottom = 20 } ] [ blog ]
        ]
