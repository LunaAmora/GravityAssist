switch (state)
{
	case "main":
		title = "GRAVITY ASSIST";
		
		if (start_button == noone)
		{
			start_button = instance_create_layer(100, 100, "Instances", menu_button_obj);
			with start_button
			{
				text = "Play!";
			}
		}
		
		if (exit_button == noone)
		{
			exit_button = instance_create_layer(100, 200, "Instances", menu_button_obj);
			with exit_button
			{
				text = "Exit...";
			}
		}
		
		if (mouse_check_button_pressed(mb_left)) && (position_meeting(mouse_x, mouse_y, start_button))
		{
			state = "level_select";
			with (menu_button_obj) instance_destroy();
			start_button = noone;
			exit_button = noone;
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
				lvl_button[i] = instance_create_layer(lateral_border + x_pos*(i mod button_per_line), superior_border + y_pos*(i div button_per_line), "Instances", menu_button_obj);
				with lvl_button[i]
				{
					text = "Level " + string(other.i+1);
				}
			}
		}
		
		if (mouse_check_button_pressed(mb_left)) && (position_meeting(mouse_x, mouse_y, menu_button_obj))
		{
			
			var button = instance_position(mouse_x, mouse_y, menu_button_obj);
			if (string_copy(button.text, 1, 5) == "Level")
			{
				level = real(string_copy(button.text, string_length(button.text) - 1, 2)) - 1;
				change_level_scr(level);
				room_goto(space_room);
			}
			else
			{
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