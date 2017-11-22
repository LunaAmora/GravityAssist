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

image_angle = angle;
draw_self();
//draw_sprite_ext(sprite_index, -1, x, y, image_xscale, image_yscale, angle, c_white, image_alpha);