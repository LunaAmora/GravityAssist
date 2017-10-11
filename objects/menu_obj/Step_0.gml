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
		//title = "LEVEL SELECT";
		
		if (lvl_1_button == noone)
		{
			lvl_1_button = instance_create_layer(100, 100, "Instances", menu_button_obj);
			with lvl_1_button
			{
				text = "Level 1";
			}
		}
		
		if (lvl_2_button == noone)
		{
			lvl_2_button = instance_create_layer(200, 100, "Instances", menu_button_obj);
			with lvl_2_button
			{
				text = "Level 2";
			}
		}
		
		if (lvl_3_button == noone)
		{
			lvl_3_button = instance_create_layer(300, 100, "Instances", menu_button_obj);
			with lvl_3_button
			{
				text = "Level 3";
			}
		}
		
		if (lvl_4_button == noone)
		{
			lvl_4_button = instance_create_layer(100, 200, "Instances", menu_button_obj);
			with lvl_4_button
			{
				text = "Level 4";
			}
		}
		
		if (lvl_5_button == noone)
		{
			lvl_5_button = instance_create_layer(200, 200, "Instances", menu_button_obj);
			with lvl_5_button
			{
				text = "Level 5";
			}
		}
		
		if (lvl_6_button == noone)
		{
			lvl_6_button = instance_create_layer(300, 200, "Instances", menu_button_obj);
			with lvl_6_button
			{
				text = "Level 6";
			}
		}
		
		if (mouse_check_button_pressed(mb_left)) && (position_meeting(mouse_x, mouse_y, menu_button_obj))
		{
			
			var button = instance_position(mouse_x, mouse_y, menu_button_obj);
			if (string_copy(button.text, 1, 5) == "Level")
			{
				level = real(string_copy(button.text, string_length(button.text) - 1, 2)) - 1;
				global_control.level = level;
				room_goto(space_room);
			}
		}
		
		break;
}