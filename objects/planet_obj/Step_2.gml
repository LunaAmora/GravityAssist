value++;

light.colour = planet_color;
light.outer_radius = gravity_distance;
light.variation = gravity_distance/25
light.inner_radius = sprite_width/2;
light.var_counter = value;

atm.radius = max(atmosphere_distance, 1);
atm.mim = sprite_width/2;