typeG = 1;
typeA = 0;

value = irandom(360);

planet_color = c_white;

active = 1;
density = 100;
size = 1;

gravity_distance = 200;

atmosphere_distance = 0;
atmosphere_force = 1000;

mode_editing = true;

control.Planets_id[instance_number(planet_obj)-1] = id;

editing = false;

gravityForce_is_editable = false;
gravityDistance_is_editable = false;
atmosphereForce_is_editable = false;
atmosphereDistance_is_editable = false;

light = instance_create_layer(x, y,"Light", light_obj);