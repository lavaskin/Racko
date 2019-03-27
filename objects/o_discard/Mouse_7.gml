if (discardSize > 0) {
	if (discardSelected) {
		discardSelected = false;
		sImg = 0;
	}
	else {
		discardSelected = true;
		sImg = 2;
		
		stackSelected = false;
		o_stack.sImg = 0;
	}
}