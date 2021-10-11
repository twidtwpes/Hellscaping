// Default draw event
draw_self();

// Set all white
if(flash > 0){
	flash--;
	shader_set(shdWhite);
	draw_self();
	shader_reset();
}