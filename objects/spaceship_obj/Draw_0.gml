if (phy_speed != 0){
	angle = point_direction(x, y, x + phy_speed_x, y + phy_speed_y);
}
else{
	angle = point_direction(x, y, x + phy_speed_x, y + phy_speed_y) + phy_rotation;
}

if (editing){
	draw_line(x, y, mouse_x, mouse_y)
}

draw_sprite_ext(sprite_index, -1, x, y, 1, 1, angle, c_white, 1);
draw_text(15, 30, "Impulse: " + string(ship_impulse));