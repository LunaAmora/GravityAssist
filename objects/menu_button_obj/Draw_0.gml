if (position_meeting(mouse_x, mouse_y, id)) image_index = 1;
else image_index = 0;
if (!active) image_index = 2;

draw_self();

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_black);
draw_text(x+sprite_width/2, y+sprite_height/2, (string_copy(text, 1, 5) == "Level") ? (string_length(text) == 7 ? "Level\n" + string_copy(text, 7, 1): "Level\n" + string_copy(text, 7, 2)): string(text));
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);