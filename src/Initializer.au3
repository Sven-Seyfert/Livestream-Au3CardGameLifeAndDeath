Global $aListOfCardsRanking = _
        [ _
            '2', '3', '4', '5', '6', _
            '7', '8', '9', '10', _
            'J', 'Q', 'K', 'A' _
        ]

Global $aListOfCards = _
        [ _
            '2-Diamonds',  '2-Hearts',  '2-Spades',  '2-Clubs', _
            '3-Diamonds',  '3-Hearts',  '3-Spades',  '3-Clubs', _
            '4-Diamonds',  '4-Hearts',  '4-Spades',  '4-Clubs', _
            '5-Diamonds',  '5-Hearts',  '5-Spades',  '5-Clubs', _
            '6-Diamonds',  '6-Hearts',  '6-Spades',  '6-Clubs', _
            '7-Diamonds',  '7-Hearts',  '7-Spades',  '7-Clubs', _
            '8-Diamonds',  '8-Hearts',  '8-Spades',  '8-Clubs', _
            '9-Diamonds',  '9-Hearts',  '9-Spades',  '9-Clubs', _
            '10-Diamonds', '10-Hearts', '10-Spades', '10-Clubs', _
            'J-Diamonds',  'J-Hearts',  'J-Spades',  'J-Clubs', _
            'Q-Diamonds',  'Q-Hearts',  'Q-Spades',  'Q-Clubs', _
            'K-Diamonds',  'K-Hearts',  'K-Spades',  'K-Clubs', _
            'A-Diamonds',  'A-Hearts',  'A-Spades',  'A-Clubs' _
        ]

Global $aListOfAlreadyDealtCards = _
        [ _
            '0', '0', '0', '0', _
            '0', '0', '0', '0', _
            '0', '0', '0', '0', _
            '0', '0', '0', '0', _
            '0', '0', '0', '0', _
            '0', '0', '0', '0', _
            '0', '0', '0', '0', _
            '0', '0', '0', '0', _
            '0', '0', '0', '0', _
            '0', '0', '0', '0', _
            '0', '0', '0', '0', _
            '0', '0', '0', '0', _
            '0', '0', '0', '0' _
        ]
;~ Global $aListOfCardsRanking = _
;~         [ _
;~             '7', '8', '9', '10', _
;~             'J', 'Q', 'K', 'A' _
;~         ]

;~ Global $aListOfCards = _
;~         [ _
;~             '7-Diamonds',  '7-Hearts',  '7-Spades',  '7-Clubs', _
;~             '8-Diamonds',  '8-Hearts',  '8-Spades',  '8-Clubs', _
;~             '9-Diamonds',  '9-Hearts',  '9-Spades',  '9-Clubs', _
;~             '10-Diamonds', '10-Hearts', '10-Spades', '10-Clubs', _
;~             'J-Diamonds',  'J-Hearts',  'J-Spades',  'J-Clubs', _
;~             'Q-Diamonds',  'Q-Hearts',  'Q-Spades',  'Q-Clubs', _
;~             'K-Diamonds',  'K-Hearts',  'K-Spades',  'K-Clubs', _
;~             'A-Diamonds',  'A-Hearts',  'A-Spades',  'A-Clubs' _
;~         ]

;~ Global $aListOfAlreadyDealtCards = _
;~         [ _
;~             '0', '0', '0', '0', _
;~             '0', '0', '0', '0', _
;~             '0', '0', '0', '0', _
;~             '0', '0', '0', '0', _
;~             '0', '0', '0', '0', _
;~             '0', '0', '0', '0', _
;~             '0', '0', '0', '0', _
;~             '0', '0', '0', '0' _
;~         ]

Global $sPathToSound = '..\media\sounds\'
Global $sPathToCards = '..\media\images\'

Global $iPlayerCount            = 2
Global $iCardsSymbolOccurrence  = 1
Global $iCountOfCards           = UBound( $aListOfCards )
Global $iCardDeckCountPerPlayer = $iCountOfCards * $iCardsSymbolOccurrence / $iPlayerCount
Global $iMaxRounds              = $iCardDeckCountPerPlayer

Global $aUserCardDeck[$iCardDeckCountPerPlayer]
Global $aComputerCardDeck[$iCardDeckCountPerPlayer]
Global $aSavedCardsOfTie[1]

Global $hGui
Global $cLabelMove, $cLabelMoveTen
Global $cRound, $cUserWins, $cComputerWins, $cTie
Global $cUserCardDeckCount, $cComputerCardDeckCount, $cSumOfCardsOfTheCardDecks

Global $iRound      = 0
Global $iCardWidth  = 96
Global $iCardHeight = 120
