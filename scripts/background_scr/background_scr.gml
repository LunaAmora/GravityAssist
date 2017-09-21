level = argument0;

switch (level+1)
{
	case 1:
	draw_set_color(c_navy);
	break;
	default:
	draw_set_color(c_teal);
	break;
}

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