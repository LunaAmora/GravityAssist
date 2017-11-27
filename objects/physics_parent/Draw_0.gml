if (!is_ship) image_alpha -= 0.01;
if (image_alpha <= 0) instance_destroy();
draw_sprite_ext(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle, make_color_hsv((control.coll + control.col + 128) mod 255, 255, control.hsv_light), image_alpha);
