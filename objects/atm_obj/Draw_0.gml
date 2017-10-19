if (!surface_exists(clouds)){
	clouds = 0;
}
if (clouds == 0) clouds = surface_create(radius * 2, radius * 2);

if (!surface_exists(reach)){
	reach = 0;
}
if (reach == 0) reach = surface_create(radius * 2, radius * 2);

surface_set_target(clouds);
draw_clear_alpha(c_black, 0);

draw_set_color(c_red);
//draw_ellipse(-30, radius / 3, radius, (radius / 3) * 2, false);

draw_set_color(c_white);


surface_set_target(reach);
draw_clear_alpha(c_black, 1);

gpu_set_blendmode(bm_subtract);
draw_set_colour(c_black);

draw_circle(radius, radius, radius, false);
surface_reset_target();

draw_set_colour(c_white);
draw_surface(reach, 0, 0);
gpu_set_blendmode(bm_normal);

surface_reset_target();
draw_surface(clouds, x - radius, y - radius);