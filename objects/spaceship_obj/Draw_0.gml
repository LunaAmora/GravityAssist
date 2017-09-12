angle = point_direction(x, y, x + phy_speed_x, y + phy_speed_y)

draw_sprite_ext(sprite_index, -1, x, y, 1, 1, angle, c_white, 1);