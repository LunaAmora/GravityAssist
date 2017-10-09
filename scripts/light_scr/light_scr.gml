/// @function light_scr(light_x, light_y, inner_radius, outer_radius, layers, colour, inner_clarity, outer_clarity, mode);
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

light_x = argument0;
light_y = argument1;
inner_radius = argument2;
outer_radius = argument3;
layers = argument4;
colour = argument5;
inner_clarity = argument6;
outer_clarity = argument7;
mode = argument8;

draw_set_color(colour);
for (a = 0; a < layers; a++){
	if (mode) gpu_set_blendmode(bm_add);
	else gpu_set_blendmode(bm_subtract);
	
	draw_set_alpha(((((outer_clarity - inner_clarity)/(layers - 1))*(layers - 1 - a) + inner_clarity)/100));
	draw_circle(light_x, light_y, (((outer_radius - inner_radius)/(layers - 1))*(layers - a) + inner_radius), false);
}
	
draw_set_alpha(1);
draw_set_color(c_white);
gpu_set_blendmode(bm_normal);