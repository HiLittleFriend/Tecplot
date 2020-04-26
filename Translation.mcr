#!MC 750

$!VARSET |BeginZone| = 1
$!PromptforTextString |Num|
  Instructions = "How many translations do you want made?"
$!PromptforTextString |DeltaX|
  Instructions = "delta_x"
$!PromptforTextString |DeltaY|
  Instructions = "delta_y"
$!PromptforTextString |DeltaZ|
  Instructions = "delta_z"
  
$!Loop |Num|
  $!VARSET |BeginZone| = (|BeginZone| + |NUMZONES|)
  $!DUPLICATEZONE 
    SOURCEZONES = [1 - |NUMZONES|]
	DESTINATIONZONE = |BeginZone|
  $!ALTERDATA [|BeginZone| - |NUMZONES|]
	EQUATION = '{X} = {X} + |Loop|*|DeltaX|'
  $!ALTERDATA [|BeginZone| - |NUMZONES|]
	EQUATION = '{Y} = {Y} + |Loop|*|DeltaY|'
  $!ALTERDATA [|BeginZone| - |NUMZONES|]
	EQUATION = '{Z} = {Z} + |Loop|*|DeltaZ|'
$!EndLoop

$!VIEW DATAFIT
