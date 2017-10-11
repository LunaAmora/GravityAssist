switch (state)
{
	case "main":
		title = "GRAVITY ASSIST";
		if (keyboard_check_pressed(vk_space)) state = "level_select";
		break;
		
	case "level_select":
		title = "LEVEL SELECT";
		if (keyboard_check_pressed(vk_space)) room_goto(space_room);
		break;
}