level = argument0;
//if instance_exists(spaceship_obj){
//	coll = ((spaceship_obj.angle mod 360)/360)*255;
//}
//coll = 255*current_level/10;

draw_set_color(make_color_hsv((coll + col) mod 255, 255, 10));

draw_rectangle(0, 0, room_width, room_height, false);
draw_set_color(c_white);

draw_set_halign(fa_center);
switch (level+1)
{
	case 1:
	draw_text(200, 500, "CLIQUE E ARRASTE NO PLANETA\nPARA MUDAR O ALCANCE DA GRAVIDADE")
	break;
	case 4:
	draw_text(room_width-250, 500, "RODE A RODA DO MOUSE SOBRE O PLANETA\nPARA MUDAR A FORÇA DA GRAVIDADE\nSEGURE SHIFT PARA MUDAR MAIS RAPIDO")
	break;
	default:
	break;
}
draw_set_halign(fa_left);