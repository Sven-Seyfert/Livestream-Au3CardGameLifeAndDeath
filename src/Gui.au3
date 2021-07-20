Func _createGui()
    $hGui          = GUICreate( '', 470, 400, Default, Default, $WS_POPUP )
    $cLabelMove    = GUICtrlCreateLabel( '>', 391, 358, 30, 30 )
    $cLabelMoveTen = GUICtrlCreateLabel( '>>', 428, 358, 30, 30 )

    GUICtrlSetFont( $cLabelMove, 11, 800 )
    GUICtrlSetFont( $cLabelMoveTen, 11, 800 )

    GUICtrlSetCursor( $cLabelMove, 0 )
    GUICtrlSetCursor( $cLabelMoveTen, 0 )

    _createLabelBorder( 380, 350 )
    _createLabelBorder( 420, 350 )

    GUISetState( @SW_SHOW, $hGui )
EndFunc

Func _createLabelBorder( $iXPosition, $iYPosition, $iLength = 30, $iBorderSize = 1 )
    GUICtrlCreateLabel( '', $iXPosition, $iYPosition, $iLength, $iBorderSize )
    GUICtrlSetBkColor( -1, 0x000000 )

    GUICtrlCreateLabel( '', $iXPosition + $iLength, $iYPosition, $iBorderSize, $iLength )
    GUICtrlSetBkColor( -1, 0x000000 )

    GUICtrlCreateLabel( '', $iXPosition, $iYPosition + $iLength, $iLength, $iBorderSize )
    GUICtrlSetBkColor( -1, 0x000000 )

    GUICtrlCreateLabel( '', $iXPosition, $iYPosition, $iBorderSize, $iLength )
    GUICtrlSetBkColor( -1, 0x000000 )
EndFunc
