with (spaceship_obj){
	physics_apply_impulse(x, y, ship_impulse * cos(degtorad(phy_rotation)), ship_impulse * -sin(degtorad(phy_rotation)))
}
control.time = 0;
control.edit_mode = false;
with (trail_obj) instance_destroy();