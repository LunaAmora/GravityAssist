if (control.edit_mode) && (control.current_level >= 7)
{
	visible = true;
	if (control.mode_editing)
	{
		if (position_meeting(mouse_x, mouse_y, id)) image_index = 1;
		else image_index = 0;
	}
	else
	{
		if (position_meeting(mouse_x, mouse_y, id)) image_index = 3;
		else image_index = 2;
	}

	if (!active) image_index = 4;
}
else visible = false;