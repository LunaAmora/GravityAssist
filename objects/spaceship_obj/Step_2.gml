value += 1;

light.x = x;
light.y = y;
light.inner_radius = sprite_width/2
light.outer_radius = 4*sprite_width/3 + sprite_width*sin(degtorad(value mod 360))/8;
light.layers = 3;
light.colour = c_white;
light.inner_clarity = 10;
light.outer_clarity = 5;

//light_scr(x, y, sprite_width/2, sprite_width*2, 3, c_white, 10, 5);