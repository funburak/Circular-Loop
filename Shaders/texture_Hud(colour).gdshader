shader_type canvas_item;

uniform sampler2D texture_HUD;

void fragment() {
	vec4 texture_color= texture(texture_HUD, UV);
	COLOR.rgb = texture_color.rgb;

}

