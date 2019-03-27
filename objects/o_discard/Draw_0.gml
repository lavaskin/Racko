draw_set_font(f_calibri_24);

if (discardSize == 0 || stackSelected) { 
	draw_set_color(c_dkgray);
	sImg = 1;
}
else {
	if (discardSelected == true) draw_set_color(c_yellow);
	else draw_set_color(c_white);
	
	draw_text(self.x + 10, self.y + 5, discardStack[discardSize - 1]);
}

draw_text(self.x - 4, self.y - 40, "Discard");
draw_sprite(s_card, sImg, self.x, self.y);