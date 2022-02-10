; compiler information for AutoIt
#pragma compile(CompanyName, © SOLVE SMART)
#pragma compile(FileVersion, 1.1.0)
#pragma compile(LegalCopyright, © Sven Seyfert)
#pragma compile(ProductName, Livestream-Au3CardGameLifeAndDeath)
#pragma compile(ProductVersion, 1.1.0 - 2022-02-10)

#AutoIt3Wrapper_AU3Check_Stop_OnWarning=y
#AutoIt3Wrapper_Icon=..\media\favicon.ico
#AutoIt3Wrapper_Outfile_x64=..\build\Livestream-Au3CardGameLifeAndDeath.exe
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_UseX64=y



; opt and just singleton -------------------------------------------------------
Opt( 'MustDeclareVars', 1 )
Global $aInst = ProcessList( 'Livestream-Au3CardGameLifeAndDeath.exe' )
If $aInst[0][0] > 1 Then Exit



; includes ---------------------------------------------------------------------
#include-once
#include <Array.au3>
#include <GUIConstantsEx.au3>
#include <Sound.au3>
#include <WindowsConstants.au3>



; references -------------------------------------------------------------------
#include "Declaration.au3"
#include "Init.au3"
#include "Gui.au3"
#include "GuiFunctions.au3"
#include "CardDealer.au3"
#include "PlayActions.au3"
#include "WinnerController.au3"
#include "BasicFunctions.au3"



; processing -------------------------------------------------------------------
;~ https://en.wikipedia.org/wiki/Bettelmann
;~ https://en.wikipedia.org/wiki/Standard_52-card_deck
HotKeySet( '{ESC}', '_exit' )

_SoundPlay( $aSoundShuffle )

_createGui()
_showRoundOnGui()
_showNamesOnGui()

_SoundPlay( $aSoundCardDeal )

_dealCardsToPlayer()

;~ _ArrayDisplay( $aListOfCardsRanking )
;~ _ArrayDisplay( $aListOfCards )
;~ _ArrayDisplay( $aUserCardDeck )
;~ _ArrayDisplay( $aComputerCardDeck )

While True
    Switch GUIGetMsg()
        Case $GUI_EVENT_CLOSE
            _exit()

        Case $cLabelMove
            $iRound += 1
            _playLifeAndDeath()

        Case $cLabelMoveTen
            For $i = 1 To 10 Step 1
                $iRound += 1

                _playLifeAndDeath( False )
            Next
    EndSwitch
WEnd

