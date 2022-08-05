Func _DealCardsToPlayer()
    Local $iUserCardDeckCount     = _GetCount($aUserCardDeck)
    Local $iComputerCardDeckCount = _GetCount($aComputerCardDeck)

    If $iUserCardDeckCount <> $iComputerCardDeckCount Then
        Exit
    EndIf

    For $i = 0 To $iUserCardDeckCount Step 1
        Local $iListIndex = _GetValidListIndex()
        Local $sCard      = $aListOfCards[$iListIndex]

        $aUserCardDeck[$i] = $sCard

        Local $iListIndex = _GetValidListIndex()
        Local $sCard      = $aListOfCards[$iListIndex]

        $aComputerCardDeck[$i] = $sCard
    Next
EndFunc

Func _GetValidListIndex()
    While True
        Local $iZeroBasedCountOfCards = $iCountOfCards - 1
        Local $iListIndex             = Random(0, $iZeroBasedCountOfCards, 1)
        Local $iAlreadyDealtCardCount = $aListOfAlreadyDealtCards[$iListIndex]

        If $iAlreadyDealtCardCount + 1 <= $iCardsSymbolOccurrence Then
            $aListOfAlreadyDealtCards[$iListIndex] += 1

            ExitLoop
        EndIf
    WEnd

    Return $iListIndex
EndFunc
