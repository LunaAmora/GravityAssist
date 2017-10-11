state = "main";
title = "GRAVITY ASSIST";

start_button = instance_create_layer(100, 100, "Instances", menu_button_obj)
exit_button = instance_create_layer(100, 200, "Instances", menu_button_obj)

with start_button
{
	text = "Play!";
}

with exit_button
{
	text = "Skedoodle";
}