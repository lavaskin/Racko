draw_sprite(s_card, sImg, self.x, self.y);
draw_set_font(f_calibri_24);

if (stackSize == 0) draw_set_color(c_dkgray);
else {
	if (stackSelected) {
		draw_set_color(c_yellow);
		draw_text(self.x + 10, self.y + 5, stack[stackSize - 1]);
	}
	else draw_set_color(c_white);
}

draw_text(self.x + 10, self.y - 40, "Stack");