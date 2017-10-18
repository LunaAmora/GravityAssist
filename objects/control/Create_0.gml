draw_set_circle_precision(64);
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