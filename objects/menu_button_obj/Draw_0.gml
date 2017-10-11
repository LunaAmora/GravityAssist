if (position_meeting(mouse_x, mouse_y, id)) game_end();//var col = draw_set_color(c_ltgray);
else var col = draw_set_color(c_white);

draw_self();
draw_sprite_ext(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);

draw_set_color(c_black);
draw_text(x, y, text);
draw_set_color(c_white);