draw_set_font(big_font)

draw_text(50, 50, title);

draw_set_font(default_font)

for(a = 0; a < array_length_1d(lvl_button); a++){
	if (lvl_button[a] != noone && lvl_button[a].active){
		ini_open(working_directory + "config.ini");
		star_progress = ini_read_real("progress", string(a), 0);
		ini_close();
		for (b = 0; b < star_progress; b++){
			draw_sprite(star_objective_spr, 0, lvl_button[a].x + b*32, lvl_button[a].y + 64)
		}
	}
}