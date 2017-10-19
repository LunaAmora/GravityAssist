if (!surface_exists(clouds)){
	clouds = 0;
}
if (clouds == 0) clouds = surface_create(radius * 2, radius * 2);

if (!surface_exists(reach)){
	reach = 0;
}
if (reach == 0) reach = surface_create(radius * 2, radius * 2);

if (!(radius <= mim)){
	surface_set_target(clouds);
	draw_clear_alpha(c_black, 0);

	draw_sprite_ext(sprite_index, -1, 0 + spr1_pos, radius, image_xscale, image_yscale, 0, colour, image_alpha);
	draw_sprite_ext(sprite_index, -1, 0 + spr2_pos, radius, image_xscale, image_yscale, 180, colour, image_alpha);


	surface_set_target(reach);
	draw_clear_alpha(c_black, 1);

	gpu_set_blendmode(bm_subtract);
	draw_set_colour(c_black);

	draw_circle(radius, radius, radius - 1, false);
	surface_reset_target();

	draw_set_colour(c_white);
	draw_surface(reach, 0, 0);
	gpu_set_blendmode(bm_normal);

	surface_reset_target();
	draw_surface(clouds, x - radius, y - radius);
	}

