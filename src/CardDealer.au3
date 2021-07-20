Func _dealCardsToPlayer()
    Local $iUserCardDeckCount     = _getCount( $aUserCardDeck )
    Local $iComputerCardDeckCount = _getCount( $aComputerCardDeck )

    If $iUserCardDeckCount <> $iComputerCardDeckCount Then
        Exit
    EndIf

    For $i = 0 To $iUserCardDeckCount Step 1
        Local $iListIndex = _getValidListIndex()
        Local $sCard      = $aListOfCards[$iListIndex]

        $aUserCardDeck[$i] = $sCard

        Local $iListIndex = _getValidListIndex()
        Local $sCard      = $aListOfCards[$iListIndex]

        $aComputerCardDeck[$i] = $sCard
    Next
EndFunc

Func _getValidListIndex()
    While True
        Local $iZeroBasedCountOfCards = $iCountOfCards - 1
        Local $iListIndex             = Random( 0, $iZeroBasedCountOfCards, 1 )
        Local $iAlreadyDealtCardCount = $aListOfAlreadyDealtCards[$iListIndex]

        If $iAlreadyDealtCardCount + 1 <= $iCardsSymbolOccurrence Then
            $aListOfAlreadyDealtCards[$iListIndex] += 1

            ExitLoop
        EndIf
    WEnd

    Return $iListIndex
EndFunc
