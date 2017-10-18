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

editing = false;

gravityForce_is_editable = false;
gravityDistance_is_editable = false;
atmosphereForce_is_editable = false;
atmosphereDistance_is_editable = false;

light = instance_create_layer(x, y,"Light", light_obj);
light.layers = 3;
light.inner_clarity = 40;
light.outer_clarity = 15;