draw_text(15, 15, "Level: " + string(current_level+1));
if (dev_mode)
{
	big_text = "DEVELOPER MODE"
	small_text = "[space] to toggle"
}
else if (edit_mode)
{
	big_text = "EDIT MODE"
	small_text = "[space] to start"
}
else
{
	big_text = "PLAY MODE"
	small_text = "[space] to stop"
}

draw_set_halign(fa_center);
draw_set_font(big_font);

draw_text(room_width / 2, 30, big_text);
if (win) draw_text(room_width / 2, room_height - 90, "WIN!");

draw_set_font(default_font);
	
draw_text(room_width / 2, 75, small_text);
if (win) draw_text(room_width / 2, room_height - 55, "<= Change Levels =>");
	
draw_set_halign(fa_left);