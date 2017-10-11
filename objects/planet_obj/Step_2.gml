value++;

light.inner_radius = sprite_width/2;
light.outer_radius = gravity_distance;
light.layers = 3;
light.colour = planet_color;
light.inner_clarity = 7;
light.outer_clarity = 7;
light.variation = gravity_distance/25
light.var_counter = value;

//light_scr(x, y, sprite_width/2, gravity_distance, round(gravity_distance/(sprite_width/2)), c_white, 10, 1);