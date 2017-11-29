draw_set_circle_precision(64);

col = irandom(255);
coll = 0;
win = false;
creating = false;
edit_mode = true;
time = 0;
seconds = 0;
hsv_light = 255;
out_timer = 0;
change_mode = false;

ini_open(working_directory + "config.ini");
number_of_levels = ini_read_real("config", "number_of_levels", 1);
current_level = ini_read_real("config", "current_level", 0);
ini_close();

load_level_scr(current_level);