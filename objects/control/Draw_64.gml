draw_text(15, 15, "Level: " + string(current_level+1));

if (global_control.dev_mode)
{
	big_text = "DEVELOPER MODE"
	small_text = "[space] to toggle"
}
else if (win){
	big_text = "LEVEL COMPLETE"
	small_text = "[space] to next level\nor [<] and [>] to change levels"
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

draw_set_font(big_big_font);
draw_set_valign(fa_bottom);
if (win) draw_text(room_width / 2, room_height - 30, "WIN!");
draw_set_valign(fa_top);

if (out_timer div room_speed >= 1){
	draw_set_font(big_big_font);
	draw_set_valign(fa_middle);
	draw_text(room_width/2, room_height/2, string(4 - (out_timer div room_speed)));
	draw_set_valign(fa_top);
}

draw_set_font(default_font);
	
draw_text(room_width/2, 75, small_text);
//if (win) draw_text(room_width / 2, room_height - 55, "<= Change Levels =>");

draw_set_halign(fa_right);
seconds = (time div room_speed);
draw_text(room_width-15, 15, "Time: " + string(seconds div 60) + ":" + string((seconds mod 60) div 10) + string((seconds mod 60) mod 10));
draw_set_halign(fa_left);