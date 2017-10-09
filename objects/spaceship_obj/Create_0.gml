value = irandom(360);
editing = false;
ship_impulse = 0;
angle = 0;
light = id;

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