draw_set_circle_precision(32);
randomize();

stars = 0;
col = irandom(255);
coll = 0;
win = false;
creating = false;
edit_mode = true;
dev_mode = false;
time = 0;
hsv_light = 255;

window_set_fullscreen(true);

ini_open(working_directory + "config.ini");
number_of_levels = ini_read_real("config", "number_of_levels", 1);
current_level = ini_read_real("config", "current_level", 0);
ini_close();

load_level_scr(current_level);

/*
light = instance_create_layer(room_width/2, room_height/2, "Light", light_obj);
light.inner_radius = 0;
light.outer_radius = room_width/10;
light.layers = 5;
light.colour = make_color_hsv(0, 0, 100);
light.inner_clarity = 20;
light.outer_clarity = 0;
light.mode = false;