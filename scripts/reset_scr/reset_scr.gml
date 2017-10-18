a = argument0;
b = argument1;
c = argument2;
d = argument3;

with (spaceship_obj){
	instance_destroy();
}

control.ship_x = a;
control.ship_y = b;
control.ship_impulse = c;
control.ship_angle = d;

ini_open(working_directory + string(control.current_level));
with(control){
	ship = instance_create_layer(ship_x, ship_y, "Ship", spaceship_obj);
	ship.phy_rotation = ship_angle;
	ship.ship_impulse = ship_impulse;
	ini_close();
}

with(trail_obj) if (!permanent) instance_destroy();

control.edit_mode = true;

if instance_exists(objective_ring_obj){
	with(objective_ring_obj){
		passed = false;
	}
}
control.time = 0;