if keyboard_check_pressed(vk_escape){
	if (room == space_room){
		if (control.win){
			ini_open(working_directory + "config.ini");
			ini_write_real("progress","progress", control.current_level+1);
			ini_close();	
		}
		room_goto(MENU);
	}
	else{
		game_end();	
	}
}
if keyboard_check_pressed(vk_backspace){
	room_restart();
}
if keyboard_check_pressed(vk_f12){
	window_set_fullscreen(!window_get_fullscreen());
}
if (room == MENU){
	if (keyboard_check_pressed(vk_f1)){
		if (show_question("You want to delete all local files? This process is irreversible.")){
			ini_open(working_directory + "config.ini");
			a = ini_read_real("config", "number_of_levels", 0);
			ini_close();
	
			for(i = 0; i < a; i++){
				if file_exists(string(i)+".ini"){
					file_delete(string(i)+".ini");
				}
			}
			if file_exists("config.ini"){
				file_delete("config.ini");
			}
		}
	}
}