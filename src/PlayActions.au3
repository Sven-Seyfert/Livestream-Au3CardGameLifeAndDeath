Func _playLifeAndDeath( $bWithSound = True )
    If _isTheEndReached() Then
        _exit()
    EndIf

    Local $sCardUser                = _userPlaysCard()
    Local $sCardUserWithoutSuit     = _getCardWithoutSuit( $sCardUser )

    Local $sCardComputer            = _computerPlaysCard()
    Local $sCardComputerWithoutSuit = _getCardWithoutSuit( $sCardComputer )

    If $bWithSound Then
        _SoundPlay( $aSoundCardDown )
        _SoundPlay( $aSoundCardDown )
    EndIf

    _showCardsOnGui( $sCardUser, $sCardComputer )
    _showRoundOnGui()
    _resetGuiLabels()

    Local $iUserCardIndex     = _getCardIndex( $sCardUserWithoutSuit )
    Local $iComputerCardIndex = _getCardIndex( $sCardComputerWithoutSuit )

    If _doesUserWins( $iUserCardIndex, $iComputerCardIndex ) Then
        _setUserCardDeck( $sCardUser, $sCardComputer )

        Local $iUserCardDeckCount        = _getCount( $aUserCardDeck ) + 1
        Local $iComputerCardDeckCount    = _getCount( $aComputerCardDeck ) + 1
        Local $iSumOfCardsOfTheCardDecks = $iUserCardDeckCount + $iComputerCardDeckCount

        _showUserWinsOnGui()
        _showCardCount( $iUserCardDeckCount, $iComputerCardDeckCount, $iSumOfCardsOfTheCardDecks )
    EndIf

    If _doesComputerWins( $iUserCardIndex, $iComputerCardIndex ) Then
        _setComputerCardDeck( $sCardUser, $sCardComputer )

        Local $iUserCardDeckCount        = _getCount( $aUserCardDeck ) + 1
        Local $iComputerCardDeckCount    = _getCount( $aComputerCardDeck ) + 1
        Local $iSumOfCardsOfTheCardDecks = $iUserCardDeckCount + $iComputerCardDeckCount

        _showComputerWinsOnGui()
        _showCardCount( $iUserCardDeckCount, $iComputerCardDeckCount, $iSumOfCardsOfTheCardDecks )
    EndIf

    If _isTie( $iUserCardIndex, $iComputerCardIndex ) Then
        _setUserAndComputerCardDecks( $sCardUser, $sCardComputer )

        Local $iUserCardDeckCount        = _getCount( $aUserCardDeck ) + 1
        Local $iComputerCardDeckCount    = _getCount( $aComputerCardDeck ) + 1
        Local $iSumOfCardsOfTheCardDecks = $iUserCardDeckCount + $iComputerCardDeckCount

        _showTieOnGui()
        _showCardCount( $iUserCardDeckCount, $iComputerCardDeckCount, $iSumOfCardsOfTheCardDecks )
    EndIf
EndFunc

Func _getCount( $aCardDeck )
    Return UBound( $aCardDeck ) - 1
EndFunc

Func _userPlaysCard()
    Local $iUserCardDeckCount = _getCount( $aUserCardDeck )

    Return $aUserCardDeck[$iUserCardDeckCount]
EndFunc

Func _computerPlaysCard()
    Local $iComputerCardDeckCount = _getCount( $aComputerCardDeck )

    Return $aComputerCardDeck[$iComputerCardDeckCount]
EndFunc

Func _getCardWithoutSuit( $sPlayerCard )
    Return StringSplit( $sPlayerCard, '-' )[1]
EndFunc

Func _getCardIndex( $sPlayerCardWithoutSuit )
    Local $iCardRankingCount = _getCount( $aListOfCardsRanking )

    For $i = 0 To $iCardRankingCount Step 1
        If $sPlayerCardWithoutSuit == $aListOfCardsRanking[$i] Then
            Return $i
        EndIf
    Next
EndFunc

Func _isTheEndReached()
    If _isMaxRoundReached() Then
        _resetWinsLabels()

        If _getCount( $aUserCardDeck ) + 1 < _getCount( $aComputerCardDeck ) + 1 Then
            _showComputerWinsOnGui()
        ElseIf _getCount( $aUserCardDeck ) + 1 > _getCount( $aComputerCardDeck ) + 1 Then
            _showUserWinsOnGui()
        Else
            _showTieOnGui()
        EndIf

        Return True
    EndIf

    If _getCount( $aUserCardDeck ) + 1 == 0 Then
        _resetWinsLabels()
        _showComputerWinsOnGui()

        Return True
    EndIf

    If _getCount( $aComputerCardDeck ) + 1 == 0 Then
        _resetWinsLabels()
        _showUserWinsOnGui()

        Return True
    EndIf

    Return False
EndFunc

Func _isMaxRoundReached()
    Return $iRound - 1 == $iMaxRounds
EndFunc
