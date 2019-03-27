// Check if a valid turn is being made
if (discardSelected || stackSelected) {
	var found = false;
	
	for (i = 0; i < 10 && !found; i++) {
		if (cards[i].selected) found = true;
		
		if (found)
			o_nextTurn.active = true;
		else
			o_nextTurn.active = false;
	}	
} else o_nextTurn.active = false;