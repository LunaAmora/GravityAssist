if (!control.win){
	if (phy_speed != 0){
		angle = point_direction(x, y, x + phy_speed_x, y + phy_speed_y);
	}
	else{
		angle = point_direction(x, y, x + phy_speed_x, y + phy_speed_y) + phy_rotation;
	}
}

if (editing){
	draw_line(x, y, mouse_x, mouse_y)
}

draw_sprite_ext(sprite_index, -1, x, y, image_xscale, image_yscale, angle, c_white, image_alpha);

dist1 = point_distance(x, y, 0, 0)
dist2 = point_distance(x, y, room_width, room_height)
dist3 = point_distance(x, y, 0, room_height)
dist4 = point_distance(x, y, room_width, 0)

dist = max(dist1, dist2, dist3, dist4)+50;
 
gpu_set_blendmode(bm_subtract);
draw_circle_colour(x, y, dist, c_black, c_white, 0);
gpu_set_blendmode(bm_normal);

//if (control.dev_mode) draw_text(15, 30, "Impulse: " + string(ship_impulse));