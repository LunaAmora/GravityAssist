image_xscale = radius / sprite_get_width(sprite_index) * 2;
image_yscale = image_xscale;

spr1_pos += image_xscale;
spr2_pos = spr1_pos + (radius * 2);

if (spr1_pos >= radius * 3) spr1_pos -= 4 * radius;
if (spr2_pos >= radius * 3) spr2_pos -= 4 * radius;