if (selected) {
	selected = false;
	sImg = 0;
	y += 20;
}
else {
	// De-select all other cards
	for (i = 0; i < 10; i++) {
		if (cards[i].selected) {
			cards[i].selected = false;
			cards[i].y += 20;
			cards[i].sImg = 0;
		}
	}
	
	selected = true;
	sImg = 2;
	y -= 20;
}