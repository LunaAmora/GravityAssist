value += 1;

light.x = x;
light.y = y;
light.inner_radius = sprite_width/2
light.outer_radius = 11*sprite_width/10 + sprite_width*sin(degtorad(value))/10;
light.layers = 3;
light.colour = c_white;
light.inner_clarity = 5;
light.outer_clarity = 3;

//light_scr(x, y, sprite_width/2, sprite_width*2, 3, c_white, 10, 5);