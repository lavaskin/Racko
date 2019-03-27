if (active) {
	active = false;
	
	
	// Find what card's selected
	var index;
	for (index = 0; index < 10; index++) {
		if (cards[index].selected)
			break;
	}
	
	
	// Switch around stack/discard/deck/etc
	if (stackSelected) {
		discardStack[discardSize] = players[curPlayer].cards[index];
		players[curPlayer].cards[index] = stack[stackSize - 1];
		
		stackSize--;
		discardSize++;
	} else {
		var cardVal = players[curPlayer].cards[index];
		players[curPlayer].cards[index] = discardStack[discardSize - 1];
		discardStack[discardSize - 1] = cardVal;
	}
	
	
	// Test for a win
	var chain = true;
	
	for (i = 0; i < 9 && chain; i++) {
		if (players[curPlayer].cards[i] > players[curPlayer].cards[i + 1])
			chain = false;
	}
	
	if (chain) {
		show_message(players[curPlayer].name + " has gotten a racko!");
		game_end();
	}
		
		
	// Clear shit
	discardSelected = false;
	stackSelected   = false;
	
	o_stack.sImg = 0;
	if (discardSize == 0) o_discard.sImg = 1;
	else o_discard.sImg = 0;
	
	cards[index].selected = false;
	cards[index].y += 20;
	cards[index].sImg = 0;
		
		
	// Obfuscate the others cards
	for (i = 0; i < 10; i++) cards[i].y += 1000;
	alarm_set(0, 1); // Allow a frame to draw	
	
	
	// Advance the turn
	if (curPlayer == (o_controller.playerCount - 1))
		curPlayer = 0;
	else
		curPlayer++;
}