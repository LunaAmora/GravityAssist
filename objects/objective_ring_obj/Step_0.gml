if (moving){
	x = mouse_x;
	y = mouse_y;
	if mouse_check_button_released(mb_left){
		moving = false;
	}
}
if place_meeting(x, y, spaceship_obj){
	passed = true;
}

if place_meeting(x, y, control){
	if mouse_check_button(mb_middle){
		instance_destroy();
	}
}

