with (spaceship_obj){
	ship = instance_create_layer(control.ship_x, control.ship_y, "Instances", spaceship_obj);
	ship.phy_rotation = phy_rotation;
	ship.ship_impulse = ship_impulse;
	instance_destroy();
}

with(trail_obj) instance_destroy();