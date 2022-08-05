Func _DoesUserWins($iUserCardIndex, $iComputerCardIndex)
    If $iUserCardIndex > $iComputerCardIndex Then
        Return True
    EndIf

    Return False
EndFunc

Func _DoesComputerWins($iUserCardIndex, $iComputerCardIndex)
    If $iUserCardIndex < $iComputerCardIndex Then
        Return True
    EndIf

    Return False
EndFunc

Func _IsTie($iUserCardIndex, $iComputerCardIndex)
    If $iUserCardIndex == $iComputerCardIndex Then
        Return True
    EndIf

    Return False
EndFunc

Func _SetUserCardDeck($sCardUser, $sCardComputer)
    _DeleteDroppedCardsFromCardDecks()

    If _GetCount($aSavedCardsOfTie) > 1 Then
        _AddToUserCardDeck()
    EndIf

    _ArrayInsert($aUserCardDeck, 0, $sCardUser)
    _ArrayInsert($aUserCardDeck, 0, $sCardComputer)
EndFunc

Func _SetComputerCardDeck($sCardUser, $sCardComputer)
    _DeleteDroppedCardsFromCardDecks()

    If _GetCount($aSavedCardsOfTie) > 1 Then
        _AddToComputerCardDeck()
    EndIf

    _ArrayInsert($aComputerCardDeck, 0, $sCardComputer)
    _ArrayInsert($aComputerCardDeck, 0, $sCardUser)
EndFunc

Func _SetUserAndComputerCardDecks($sCardUser, $sCardComputer)
    _DeleteDroppedCardsFromCardDecks()

    _ArrayInsert($aSavedCardsOfTie, 0, $sCardComputer)
    _ArrayInsert($aSavedCardsOfTie, 0, $sCardUser)
EndFunc

Func _DeleteDroppedCardsFromCardDecks()
    Local $iUserCardDeckCount     = _GetCount($aUserCardDeck)
    Local $iComputerCardDeckCount = _GetCount($aComputerCardDeck)

    _ArrayDelete($aUserCardDeck, $iUserCardDeckCount)
    _ArrayDelete($aComputerCardDeck, $iComputerCardDeckCount)
EndFunc

Func _AddToUserCardDeck()
    Local $iSavedCardsOfTieCount = _GetCount($aSavedCardsOfTie) - 1

    For $i = 0 To $iSavedCardsOfTieCount Step 1
        _ArrayInsert($aUserCardDeck, 0, $aSavedCardsOfTie[$i])
    Next

    Global $aSavedCardsOfTie[1]
EndFunc

Func _AddToComputerCardDeck()
    Local $iSavedCardsOfTieCount = _GetCount($aSavedCardsOfTie) - 1

    For $i = 0 To $iSavedCardsOfTieCount Step 1
        _ArrayInsert($aComputerCardDeck, 0, $aSavedCardsOfTie[$i])
    Next

    Global $aSavedCardsOfTie[1]
EndFunc
