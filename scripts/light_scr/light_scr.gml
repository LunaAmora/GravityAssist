/// @function light_scr(light_x, light_y, inner_radius, outer_radius, layers, colour, inner_clarity, outer_clarity, mode, variation, var_counter);
/// @description Creates Light in n given layers.
/// @param {real} light_x The x position to create the light.
/// @param {real} light_y The y position to create the light.
/// @param {real} inner_radius The radius of the inner layer.
/// @param {real} outer_radius The radius of the outer layer.
/// @param {real} layers The number of layers.
/// @param {real} colour The colour of the light.
/// @param {real} inner_clarity The clarity of the inner layer.
/// @param {real} outer_clarity The clarity of the outer layer.
/// @param {boolean} mode The blendmode of  the light, true for additive and false for subtractive.
/// @param {real} variation
/// @param {real} var_counter


light_x = argument0;
light_y = argument1;
inner_radius = argument2;
outer_radius = argument3;
layers = argument4;
colour = argument5;
inner_clarity = argument6;
outer_clarity = argument7;
mode = argument8;
variation = argument9;
var_counter = argument10;
if (outer_radius <= inner_radius) return;

//if (!surface_exists(new)) new = surface_create(outer_radius*2, outer_radius*2);
surface_set_target(new);
draw_clear_alpha(c_black, 0);

for (a = 0; a < layers; a++){
	
	if (variation != 0 && a == 0){
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
draw_surface(new, light_x-outer_radius, light_y-outer_radius);

gpu_set_blendmode(bm_normal);




