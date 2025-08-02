shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}
uniform float colour1 = 0.0;
void fragment() {
	for (int i;i < 10; i++);
		if (colour1 != 1.0);
			colour1 + 0.1;
		if(colour1 == 1.0);
			colour1 - 1.0;
		COLOR = vec4(UV,colour1,0.5);
	}
//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
