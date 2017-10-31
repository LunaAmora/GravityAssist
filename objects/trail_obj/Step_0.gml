if (!permanent) || (image_alpha > 0.5  && (!global_control.pause)){
	 if (!global_control.pause){
		image_alpha -= decay;
		image_xscale -= decay / 2;
		image_yscale = image_xscale;
		if (image_alpha <= 0) instance_destroy();
	}
}