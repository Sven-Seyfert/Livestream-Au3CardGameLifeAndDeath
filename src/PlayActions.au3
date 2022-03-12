Func _PlayLifeAndDeath( $bWithSound = True )
    If _IsTheEndReached() Then
        _Exit()
    EndIf

    Local $sCardUser                = _UserPlaysCard()
    Local $sCardUserWithoutSuit     = _GetCardWithoutSuit( $sCardUser )

    Local $sCardComputer            = _ComputerPlaysCard()
    Local $sCardComputerWithoutSuit = _GetCardWithoutSuit( $sCardComputer )

    If $bWithSound Then
        _SoundPlay( $aSoundCardDown )
        _SoundPlay( $aSoundCardDown )
    EndIf

    _ShowCardsOnGui( $sCardUser, $sCardComputer )
    _ShowRoundOnGui()
    _ResetGuiLabels()

    Local $iUserCardIndex     = _GetCardIndex( $sCardUserWithoutSuit )
    Local $iComputerCardIndex = _GetCardIndex( $sCardComputerWithoutSuit )

    If _DoesUserWins( $iUserCardIndex, $iComputerCardIndex ) Then
        _SetUserCardDeck( $sCardUser, $sCardComputer )

        Local $iUserCardDeckCount        = _GetCount( $aUserCardDeck ) + 1
        Local $iComputerCardDeckCount    = _GetCount( $aComputerCardDeck ) + 1
        Local $iSumOfCardsOfTheCardDecks = $iUserCardDeckCount + $iComputerCardDeckCount

        _ShowUserWinsOnGui()
        _ShowCardCount( $iUserCardDeckCount, $iComputerCardDeckCount, $iSumOfCardsOfTheCardDecks )
    EndIf

    If _DoesComputerWins( $iUserCardIndex, $iComputerCardIndex ) Then
        _SetComputerCardDeck( $sCardUser, $sCardComputer )

        Local $iUserCardDeckCount        = _GetCount( $aUserCardDeck ) + 1
        Local $iComputerCardDeckCount    = _GetCount( $aComputerCardDeck ) + 1
        Local $iSumOfCardsOfTheCardDecks = $iUserCardDeckCount + $iComputerCardDeckCount

        _ShowComputerWinsOnGui()
        _ShowCardCount( $iUserCardDeckCount, $iComputerCardDeckCount, $iSumOfCardsOfTheCardDecks )
    EndIf

    If _IsTie( $iUserCardIndex, $iComputerCardIndex ) Then
        _SetUserAndComputerCardDecks( $sCardUser, $sCardComputer )

        Local $iUserCardDeckCount        = _GetCount( $aUserCardDeck ) + 1
        Local $iComputerCardDeckCount    = _GetCount( $aComputerCardDeck ) + 1
        Local $iSumOfCardsOfTheCardDecks = $iUserCardDeckCount + $iComputerCardDeckCount

        _ShowTieOnGui()
        _ShowCardCount( $iUserCardDeckCount, $iComputerCardDeckCount, $iSumOfCardsOfTheCardDecks )
    EndIf
EndFunc

Func _GetCount( $aCardDeck )
    Return UBound( $aCardDeck ) - 1
EndFunc

Func _UserPlaysCard()
    Local $iUserCardDeckCount = _GetCount( $aUserCardDeck )

    Return $aUserCardDeck[$iUserCardDeckCount]
EndFunc

Func _ComputerPlaysCard()
    Local $iComputerCardDeckCount = _GetCount( $aComputerCardDeck )

    Return $aComputerCardDeck[$iComputerCardDeckCount]
EndFunc

Func _GetCardWithoutSuit( $sPlayerCard )
    Return StringSplit( $sPlayerCard, '-' )[1]
EndFunc

Func _GetCardIndex( $sPlayerCardWithoutSuit )
    Local $iCardRankingCount = _GetCount( $aListOfCardsRanking )

    For $i = 0 To $iCardRankingCount Step 1
        If $sPlayerCardWithoutSuit == $aListOfCardsRanking[$i] Then
            Return $i
        EndIf
    Next
EndFunc

Func _IsTheEndReached()
    If _IsMaxRoundReached() Then
        _ResetWinsLabels()

        If _GetCount( $aUserCardDeck ) + 1 < _GetCount( $aComputerCardDeck ) + 1 Then
            _ShowComputerWinsOnGui()
        ElseIf _GetCount( $aUserCardDeck ) + 1 > _GetCount( $aComputerCardDeck ) + 1 Then
            _ShowUserWinsOnGui()
        Else
            _ShowTieOnGui()
        EndIf

        Return True
    EndIf

    If _GetCount( $aUserCardDeck ) + 1 == 0 Then
        _ResetWinsLabels()
        _ShowComputerWinsOnGui()

        Return True
    EndIf

    If _GetCount( $aComputerCardDeck ) + 1 == 0 Then
        _ResetWinsLabels()
        _ShowUserWinsOnGui()

        Return True
    EndIf

    Return False
EndFunc

Func _IsMaxRoundReached()
    Return $iRound - 1 == $iMaxRounds
EndFunc
