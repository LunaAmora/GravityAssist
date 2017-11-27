value = irandom(360);
editing = false;
ship_impulse = 1000;
angle = 0;
light = id;
perma_trail = false;
alarm[0] = room_speed / 4;
is_ship = true;

//ilusion_ x = 0;
//ilusion_ y = 0;

if (instance_exists(light_obj)){
	with(light_obj){
		if owner == "player"{
			other.light	= id;
		}
	}
}
if light == id{
	light = instance_create_layer(x, y,"Light", light_obj);
	light.owner = "player";
}

light.layers = 3;
light.colour = c_white;
light.inner_clarity = 20;
light.outer_clarity = 5;