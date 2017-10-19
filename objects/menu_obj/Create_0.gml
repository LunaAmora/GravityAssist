state = "main";
title = "GRAVITY ASSIST";

randomize();
colour = make_color_hsv(irandom(255), 255, 255);

//main buttons
start_button = noone;
custom_button = noone;
extras_button = noone;
options_button = noone;
exit_button = noone;

//level select buttons
ini_open(working_directory + "config.ini");
a = ini_read_real("config", "number_of_levels", 1);
ini_close();

for(i = 0; i < a; i ++){
	lvl_button[i] = noone;	
}

back_button = noone;

//level select variables
lateral_border = 100;
superior_border = 100;
button_per_line = 3;
line_per_screen = 6;
button_per_page = (button_per_line*(line_per_screen-1));

x_pos = (sprite_get_width(menu_button_spr) + ((room_width - (2*lateral_border) - (button_per_line*sprite_get_width(menu_button_spr)))/(button_per_line-1)));
y_pos = (sprite_get_height(menu_button_spr) + ((room_height - (2*superior_border) - (line_per_screen*sprite_get_height(menu_button_spr)))/(line_per_screen-1)));


for(v = 0; v < irandom_range(15,30); v++){
	instance_create_layer(irandom(room_width), irandom(room_height), "Stars", star_obj);
}