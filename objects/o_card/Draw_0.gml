draw_sprite(s_card, sImg, self.x, self.y);
draw_set_font(f_calibri_24);

if (selected) draw_set_color(c_yellow);
else draw_set_color(c_white);

draw_text(self.x + 10, self.y + 5, players[curPlayer].cards[index]);