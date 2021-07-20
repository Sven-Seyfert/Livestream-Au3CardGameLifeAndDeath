Func _showRoundOnGui()
    GUICtrlDelete( $cRound )
    $cRound = GUICtrlCreateLabel( $iRound & '/' & $iMaxRounds, 5, 5, 100 )
    GUICtrlSetFont( $cRound, 13, 800 )
EndFunc

Func _showNamesOnGui()
    GUICtrlCreateLabel( 'You', 102, 35, 100, 35 )
    GUICtrlSetFont( -1, 19, 800 )

    GUICtrlCreateLabel( 'Alice', 318, 35, 100, 35 )
    GUICtrlSetFont( -1, 19, 800 )

    GUICtrlCreateLabel( 'vs', 227, 123 )
    GUICtrlSetFont( -1, 13, 800 )
EndFunc

Func _showCardsOnGui( $sCardOfUser, $sCardOfComputer )
    Local $iOffset  = 5
    Local $iRandom1 = 80
    Local $iRandom2 = 300

    Local $iXPositionUser     = Random( $iRandom1 - $iOffset, $iRandom1 + $iOffset, 1 )
    Local $iYPositionUser     = Random( $iRandom1 - $iOffset, $iRandom1 + $iOffset, 1 )
    Local $iXPositionComputer = Random( $iRandom2 - $iOffset, $iRandom2 + $iOffset, 1 )
    Local $iYPositionComputer = Random( $iRandom1 - $iOffset, $iRandom1 + $iOffset, 1 )

    _createCardImage( $sCardOfUser, $iXPositionUser, $iYPositionUser )
    _createCardImage( $sCardOfComputer, $iXPositionComputer, $iYPositionComputer )
EndFunc

Func _createCardImage( $sCard, $iXPosition, $iYPosition )
    GUICtrlCreatePic( $sPathToCards & $sCard & '.jpg', $iXPosition, $iYPosition, $iCardWidth, $iCardHeight )
    GUICtrlCreatePic( $sPathToCards & $sCard & '.jpg', $iXPosition, $iYPosition, $iCardWidth, $iCardHeight )
EndFunc

Func _showUserWinsOnGui()
    $cUserWins = GUICtrlCreateLabel( 'wins', 105, 218, 100, 35 )
    GUICtrlSetFont( $cUserWins, 16, 800 )
EndFunc

Func _showComputerWinsOnGui()
    $cComputerWins = GUICtrlCreateLabel( 'wins', 328, 218, 100, 35 )
    GUICtrlSetFont( $cComputerWins, 16, 800 )
EndFunc

Func _showTieOnGui()
    $cTie = GUICtrlCreateLabel( 'tie', 227, 220, 100, 35 )
    GUICtrlSetFont( $cTie, 13, 800 )
EndFunc

Func _showCardCount( $iUserCardDeckCount, $iComputerCardDeckCount, $iSumOfCardsOfTheCardDecks )
    $cUserCardDeckCount = GUICtrlCreateLabel( $iUserCardDeckCount, 112, 300, 100, 35 )
    GUICtrlSetFont( $cUserCardDeckCount, 19, 800 )

    $cComputerCardDeckCount = GUICtrlCreateLabel( $iComputerCardDeckCount, 330, 300, 100, 35 )
    GUICtrlSetFont( $cComputerCardDeckCount, 19, 800 )

    $cSumOfCardsOfTheCardDecks = GUICtrlCreateLabel( $iSumOfCardsOfTheCardDecks, 227, 306, 100, 35 )
    GUICtrlSetFont( $cSumOfCardsOfTheCardDecks, 13, 800 )
EndFunc

Func _resetGuiLabels()
    GUICtrlDelete( $cUserWins )
    GUICtrlDelete( $cComputerWins )
    GUICtrlDelete( $cTie )
    GUICtrlDelete( $cUserCardDeckCount )
    GUICtrlDelete( $cComputerCardDeckCount )
    GUICtrlDelete( $cSumOfCardsOfTheCardDecks )
EndFunc

Func _resetWinsLabels()
    GUICtrlDelete( $cUserWins )
    GUICtrlDelete( $cComputerWins )
EndFunc
