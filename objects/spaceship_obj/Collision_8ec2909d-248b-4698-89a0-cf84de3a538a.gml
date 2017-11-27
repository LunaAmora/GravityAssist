instance_create_depth(x, y, 0, explosion_obj);

for (i = 0; i < 50; i++)
{
	with (instance_create_depth(x, y, depth, physics_parent))
	{
		randomize();
		angle = degtorad(irandom(360));
		impulse = random_range(5, 15);
		
		physics_apply_impulse(x, y, impulse * cos(angle), impulse * -sin(angle));
	}
}

reset_scr(control.ship_x, control.ship_y, ship_impulse, phy_rotation);