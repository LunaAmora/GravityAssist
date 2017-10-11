if keyboard_check_pressed(vk_escape){
	game_end();
}
if keyboard_check_pressed(vk_backspace){
	room_restart();
}
if keyboard_check_pressed(vk_f12){
	window_set_fullscreen(!window_get_fullscreen());
}