switch (state){
	case "main":
		title = "GRAVITY ASSIST";
		
		if (start_button == noone)
		{
			start_button = instance_create_layer(100, room_height - 500, "Instances", menu_button_obj);
			with start_button
			{
				text = "Play!";
				sprite_index = main_menu_button_spr;
			}
		}
		
		if (custom_button == noone)
		{
			custom_button = instance_create_layer(100, room_height - 400, "Instances", menu_button_obj);
			with custom_button
			{
				text = "Custom Levels ;)\nNot ready yet";
				sprite_index = main_menu_button_spr;
			}
		}
		
		if (extras_button == noone)
		{
			extras_button = instance_create_layer(100, room_height - 300, "Instances", menu_button_obj);
			with extras_button
			{
				text = "Extras *O*\nNot ready yet";
				sprite_index = main_menu_button_spr;
			}
		}
		
		if (options_button == noone)
		{
			options_button = instance_create_layer(100, room_height - 200, "Instances", menu_button_obj);
			with options_button
			{
				text = "Options\nNot ready yet";
				sprite_index = main_menu_button_spr;
			}
		}
		
		if (exit_button == noone)
		{
			exit_button = instance_create_layer(100, room_height - 100, "Instances", menu_button_obj);
			with exit_button
			{
				text = "Exit...";
				sprite_index = main_menu_button_spr;
			}
		}
		
		if (mouse_check_button_pressed(mb_left)) && (position_meeting(mouse_x, mouse_y, start_button))
		{
			state = "level_select";
			with (menu_button_obj) instance_destroy();
			start_button = noone;
			exit_button = noone;
			options_button = noone;
			custom_button = noone;
			extras_button = noone;
		}
		if (mouse_check_button_pressed(mb_left)) && (position_meeting(mouse_x, mouse_y, exit_button)) game_end();
	break;
		
	case "level_select":
		title = "LEVEL SELECT";
		
		if (back_button == noone)
		{
			back_button = instance_create_layer(room_width - lateral_border - sprite_get_width(menu_button_spr), room_height - superior_border - sprite_get_height(menu_button_spr), "Instances", menu_button_obj);
			with back_button
			{
				text = "Back";
			}
		}
				
		for (i = 0; i < array_length_1d(lvl_button); i++){
			if (lvl_button[i] == noone)
			{
				ini_open(working_directory + "config.ini");
				progress = ini_read_real("progress", "progress", 0);
				ini_close();
				lvl_button[i] = instance_create_layer(lateral_border + x_pos*((i mod button_per_page) mod button_per_line) + (i div button_per_page)*room_width, superior_border + y_pos*((i mod button_per_page) div button_per_line), "Instances", menu_button_obj);
				with lvl_button[i]
				{
					active = other.i <= other.progress ? true : false;
					text = "Level " + string(other.i+1);
				}
			}
		}
		
		if (mouse_check_button_pressed(mb_left)) && (position_meeting(mouse_x, mouse_y, menu_button_obj)){
			var button = instance_position(mouse_x, mouse_y, menu_button_obj);
			if (string_copy(button.text, 1, 5) == "Level"){
				if (button.active){
					level = real(string_copy(button.text, string_length(button.text) - 1, 2)) - 1;
					change_level_scr(level);
					room_goto(space_room);
				}
			}
			else{
				state = "main";
				with (menu_button_obj) instance_destroy();
				back_button = noone;
				
				for (i = 0; i < array_length_1d(lvl_button); i++){
					lvl_button[i] = noone;
				}
			}
		}	
	break;
}