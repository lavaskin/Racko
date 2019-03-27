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
	
	
	// Test for a win from lo -> hi
	var lohi = true;
	for (i = 0; i < 9 && lohi; i++) {
		if (players[curPlayer].cards[i] > players[curPlayer].cards[i + 1])
			lohi = false;
	}
	
	// Test for a win from hi -> lo
	var hilo = true;
	for (i = 9; i > 0 && hilo; i--) {
		if (players[curPlayer].cards[i] > players[curPlayer].cards[i - 1])
			hilo = false;
	}
	
	if (lohi || hilo) {
		show_message(players[curPlayer].name + " has gotten a racko!");
		game_end();
	}
		
		
	// Clear shit
	scr_clearDiscard();
	scr_clearStack();
	
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