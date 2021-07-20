Func _doesUserWins( $iUserCardIndex, $iComputerCardIndex )
    If $iUserCardIndex > $iComputerCardIndex Then
        Return True
    EndIf

    Return False
EndFunc

Func _doesComputerWins( $iUserCardIndex, $iComputerCardIndex )
    If $iUserCardIndex < $iComputerCardIndex Then
        Return True
    EndIf

    Return False
EndFunc

Func _isTie( $iUserCardIndex, $iComputerCardIndex )
    If $iUserCardIndex == $iComputerCardIndex Then
        Return True
    EndIf

    Return False
EndFunc

Func _setUserCardDeck( $sCardUser, $sCardComputer )
    _deleteDroppedCardsFromCardDecks()

    If _getCount( $aSavedCardsOfTie ) > 1 Then
        _addToUserCardDeck()
    EndIf

    _ArrayInsert( $aUserCardDeck, 0, $sCardUser )
    _ArrayInsert( $aUserCardDeck, 0, $sCardComputer )
EndFunc

Func _setComputerCardDeck( $sCardUser, $sCardComputer )
    _deleteDroppedCardsFromCardDecks()

    If _getCount( $aSavedCardsOfTie ) > 1 Then
        _addToComputerCardDeck()
    EndIf

    _ArrayInsert( $aComputerCardDeck, 0, $sCardComputer )
    _ArrayInsert( $aComputerCardDeck, 0, $sCardUser )
EndFunc

Func _setUserAndComputerCardDecks( $sCardUser, $sCardComputer )
    _deleteDroppedCardsFromCardDecks()

    _ArrayInsert( $aSavedCardsOfTie, 0, $sCardComputer )
    _ArrayInsert( $aSavedCardsOfTie, 0, $sCardUser )
EndFunc

Func _deleteDroppedCardsFromCardDecks()
    Local $iUserCardDeckCount     = _getCount( $aUserCardDeck )
    Local $iComputerCardDeckCount = _getCount( $aComputerCardDeck )

    _ArrayDelete( $aUserCardDeck, $iUserCardDeckCount )
    _ArrayDelete( $aComputerCardDeck, $iComputerCardDeckCount )
EndFunc

Func _addToUserCardDeck()
    Local $iSavedCardsOfTieCount = _getCount( $aSavedCardsOfTie ) - 1

    For $i = 0 To $iSavedCardsOfTieCount Step 1
        _ArrayInsert( $aUserCardDeck, 0, $aSavedCardsOfTie[$i] )
    Next

    Global $aSavedCardsOfTie[1]
EndFunc

Func _addToComputerCardDeck()
    Local $iSavedCardsOfTieCount = _getCount( $aSavedCardsOfTie ) - 1

    For $i = 0 To $iSavedCardsOfTieCount Step 1
        _ArrayInsert( $aComputerCardDeck, 0, $aSavedCardsOfTie[$i] )
    Next

    Global $aSavedCardsOfTie[1]
EndFunc
