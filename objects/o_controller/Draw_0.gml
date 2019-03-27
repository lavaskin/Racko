draw_set_font(f_calibri_24);
draw_set_color(c_white);

draw_text(20, room_height - 280, "-> " + players[curPlayer].name + "'s turn ->");

/* DEBUG
draw_set_font(f_calibri_12);
for (i = 0; i < stackSize; i++)
	draw_text(i * 40, room_height - 20, stack[i]);
for (i = 0; i < discardSize; i++)
	draw_text(i * 40, room_height - 32, discardStack[i]);
*/