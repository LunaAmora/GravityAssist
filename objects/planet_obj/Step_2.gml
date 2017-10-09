value++;

light.inner_radius = sprite_width/2;
light.outer_radius = gravity_distance + sin(degtorad(value))*gravity_distance/25;
light.layers = 4;//floor(gravity_distance/(sprite_width/2))-1;
light.colour = planet_color;
light.inner_clarity = 15;
light.outer_clarity = 0;

//light_scr(x, y, sprite_width/2, gravity_distance, round(gravity_distance/(sprite_width/2)), c_white, 10, 1);