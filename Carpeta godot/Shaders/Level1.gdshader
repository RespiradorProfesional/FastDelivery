shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}


uniform vec4 old_color;
uniform vec4 new_color;

void fragment() {
    vec4 current_pixel = texture(TEXTURE, UV);

    if (current_pixel == old_color)
        COLOR = new_color;
    else
        COLOR = current_pixel;
}
//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
