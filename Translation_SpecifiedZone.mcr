#!MC 750
$!PromptforTextString |ZONE|
  Instructions = "Which zone do you want to duplicate and rotate"
$!PromptforTextString |Num|
  Instructions = "How many translations do you want made?"
$!PromptforTextString |DeltaX|
  Instructions = "delta_x"
$!PromptforTextString |DeltaY|
  Instructions = "delta_y"
$!PromptforTextString |DeltaZ|
  Instructions = "delta_z"
  

$!Loop |Num|
  $!VARSET |NEWZONE| = (|ZONE| + |Loop|*|NUMZONES|)
  $!DUPLICATEZONE 
    SOURCEZONE = |ZONE|
	DESTINATIONZONE = |NEWZONE|
  $!ALTERDATA [|NEWZONE|]
	EQUATION = '{X} = {X} + |DeltaX|'
  $!ALTERDATA [|NEWZONE|]
	EQUATION = '{Y} = {Y} + |DeltaY|'
  $!ALTERDATA [|NEWZONE|]
	EQUATION = '{Z} = {Z} + |DeltaZ|'
$!EndLoop

$!VIEW DATAFIT
