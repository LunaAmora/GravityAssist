if (!passed){
	draw_self();
	if (first){
		draw_line(x, y, pair.x, pair.y);
	}

}
else if (first){
	if (!pair.passed){
		pair.passed = true;
	}
}