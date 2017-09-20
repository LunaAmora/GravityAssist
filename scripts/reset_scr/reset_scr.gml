with (spaceship_obj){
	instance_destroy();
}
with(control){
	ini_open("levels.ini")
	ship_x = ini_read_real(string(level), "ship_x", 0);
	ship_y = ini_read_real(string(level), "ship_y", 0);
	ship = instance_create_layer(ship_x, ship_y, "Instances", spaceship_obj);
	ship.phy_rotation = ini_read_real(string(level), "ship_angle", 0);
	ship.ship_impulse = ini_read_real(string(level), "ship_impulse", 0);
	ini_close();
}

with(trail_obj) instance_destroy();

control.edit_mode = true;