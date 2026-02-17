shader_type canvas_item;

uniform vec4 outline_color : source_color = vec4(0.0, 0.0, 0.0, 1.0);
uniform float outline_size = 10.0;

void fragment() {
	vec4 tex = texture(TEXTURE, UV);

	float alpha = tex.a;
	float max_alpha = 0.0;

	// วนแบบวงกลม
	for (float x = -outline_size; x <= outline_size; x++) {
		for (float y = -outline_size; y <= outline_size; y++) {

			if (length(vec2(x, y)) <= outline_size) {

				vec2 offset = vec2(x, y) * TEXTURE_PIXEL_SIZE;
				max_alpha = max(max_alpha, texture(TEXTURE, UV + offset).a);
			}
		}
	}

	if (alpha == 0.0 && max_alpha > 0.0) {
		COLOR = outline_color;
	} else {
		COLOR = tex;
	}
}
