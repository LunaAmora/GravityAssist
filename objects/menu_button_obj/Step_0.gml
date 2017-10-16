if (string_copy(text, 1, 5) == "Level"){
	with(menu_button_obj){
		if x > room_width{
			other.r = true;
		}
		if x < 0{
			other.l = true;	
		}
	}
	if (r && keyboard_check_pressed(vk_right)){
		x -= 1366;
		r = false;
	}
	if (l && keyboard_check_pressed(vk_left)){
		x += 1366;
		l = false;
	}
}