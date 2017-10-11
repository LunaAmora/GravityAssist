angle += frequency;

image_xscale = image_xscale_base + (intensity * sin(degtorad(angle)));
image_yscale = image_xscale;


draw_sprite_ext(sprite_index, -1, x, y, image_xscale, image_yscale, 0, c_white, image_alpha);