if (stackSelected == true) {
	stackSelected = false;
	sImg = 0;
}
else {
	stackSelected   = true;
	sImg = 2;
	
	discardSelected = false;
	if (discardSize == 0) o_discard.sImg = 1;
	else o_discard.sImg = 0;
}