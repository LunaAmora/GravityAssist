if (!surface_exists(new)){
	new = 0;
}
if (new == 0) new = surface_create(outer_radius*2, outer_radius*2);

if (!(outer_radius <= inner_radius)){
	surface_set_target(new);
	draw_clear_alpha(c_black, 0);

	for (a = 0; a < layers; a++){
	
		if (variation != 0 && (a == 0 || a == layers-1)){
			final_outer = outer_radius;
		}
		else final_outer = outer_radius + (variation*sin(degtorad(var_counter)));
	
		draw_set_color(c_black)
		draw_set_alpha(1);
		draw_circle(outer_radius, outer_radius, (((final_outer - inner_radius) / layers) * (layers - a)) + inner_radius -1, false);
	
		draw_set_color(colour);
		draw_set_alpha(((((outer_clarity - inner_clarity)/(layers - 1))*(layers - 1 - a) + inner_clarity)/100));
		draw_circle(outer_radius, outer_radius, (((final_outer - inner_radius) / layers) * (layers - a)) + inner_radius -1, false);
	}

	draw_set_alpha(1);
	//draw_set_color(c_black)
	//draw_circle(outer_radius, outer_radius, inner_radius, false);

	draw_set_color(c_white);

	surface_reset_target();

	gpu_set_blendmode(bm_add);
	draw_surface(new, x-outer_radius, y-outer_radius);

	gpu_set_blendmode(bm_normal);
}