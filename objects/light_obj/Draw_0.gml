if (!surface_exists(new)){
	new = 0;
	show_debug_message("deu!!");
}
if (new == 0) new = surface_create(outer_radius*2, outer_radius*2);
light_scr(x, y, inner_radius, outer_radius, layers, colour, inner_clarity, outer_clarity, mode, variation, var_counter);