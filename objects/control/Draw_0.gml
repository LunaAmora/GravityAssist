draw_text(15, 15, "Level: " + string(current_level+1));
if (win) draw_text(30, 30, "WIN!");

if (creating == true){
	draw_line(x, y, mouse_x, mouse_y);
}