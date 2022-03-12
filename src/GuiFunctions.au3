Func _ShowRoundOnGui()
    GUICtrlDelete( $cRound )
    $cRound = GUICtrlCreateLabel( $iRound & '/' & $iMaxRounds, 5, 5, 100 )
    GUICtrlSetFont( $cRound, 13, 800 )
EndFunc

Func _ShowNamesOnGui()
    GUICtrlCreateLabel( 'You', 102, 35, 100, 35 )
    GUICtrlSetFont( -1, 19, 800 )

    GUICtrlCreateLabel( 'Alice', 318, 35, 100, 35 )
    GUICtrlSetFont( -1, 19, 800 )

    GUICtrlCreateLabel( 'vs', 227, 123 )
    GUICtrlSetFont( -1, 13, 800 )
EndFunc

Func _ShowCardsOnGui( $sCardOfUser, $sCardOfComputer )
    Local $iOffset  = 5
    Local $iRandom1 = 80
    Local $iRandom2 = 300

    Local $iXPositionUser     = Random( $iRandom1 - $iOffset, $iRandom1 + $iOffset, 1 )
    Local $iYPositionUser     = Random( $iRandom1 - $iOffset, $iRandom1 + $iOffset, 1 )
    Local $iXPositionComputer = Random( $iRandom2 - $iOffset, $iRandom2 + $iOffset, 1 )
    Local $iYPositionComputer = Random( $iRandom1 - $iOffset, $iRandom1 + $iOffset, 1 )

    _CreateCardImage( $sCardOfUser, $iXPositionUser, $iYPositionUser )
    _CreateCardImage( $sCardOfComputer, $iXPositionComputer, $iYPositionComputer )
EndFunc

Func _CreateCardImage( $sCard, $iXPosition, $iYPosition )
    GUICtrlCreatePic( $sPathToCards & $sCard & '.jpg', $iXPosition, $iYPosition, $iCardWidth, $iCardHeight )
    GUICtrlCreatePic( $sPathToCards & $sCard & '.jpg', $iXPosition, $iYPosition, $iCardWidth, $iCardHeight )
EndFunc

Func _ShowUserWinsOnGui()
    $cUserWins = GUICtrlCreateLabel( 'wins', 105, 218, 100, 35 )
    GUICtrlSetFont( $cUserWins, 16, 800 )
EndFunc

Func _ShowComputerWinsOnGui()
    $cComputerWins = GUICtrlCreateLabel( 'wins', 328, 218, 100, 35 )
    GUICtrlSetFont( $cComputerWins, 16, 800 )
EndFunc

Func _ShowTieOnGui()
    $cTie = GUICtrlCreateLabel( 'tie', 227, 220, 100, 35 )
    GUICtrlSetFont( $cTie, 13, 800 )
EndFunc

Func _ShowCardCount( $iUserCardDeckCount, $iComputerCardDeckCount, $iSumOfCardsOfTheCardDecks )
    $cUserCardDeckCount = GUICtrlCreateLabel( $iUserCardDeckCount, 112, 300, 100, 35 )
    GUICtrlSetFont( $cUserCardDeckCount, 19, 800 )

    $cComputerCardDeckCount = GUICtrlCreateLabel( $iComputerCardDeckCount, 330, 300, 100, 35 )
    GUICtrlSetFont( $cComputerCardDeckCount, 19, 800 )

    $cSumOfCardsOfTheCardDecks = GUICtrlCreateLabel( $iSumOfCardsOfTheCardDecks, 227, 306, 100, 35 )
    GUICtrlSetFont( $cSumOfCardsOfTheCardDecks, 13, 800 )
EndFunc

Func _ResetGuiLabels()
    GUICtrlDelete( $cUserWins )
    GUICtrlDelete( $cComputerWins )
    GUICtrlDelete( $cTie )
    GUICtrlDelete( $cUserCardDeckCount )
    GUICtrlDelete( $cComputerCardDeckCount )
    GUICtrlDelete( $cSumOfCardsOfTheCardDecks )
EndFunc

Func _ResetWinsLabels()
    GUICtrlDelete( $cUserWins )
    GUICtrlDelete( $cComputerWins )
EndFunc
