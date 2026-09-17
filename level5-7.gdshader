shader_type canvas_item;


uniform vec2 texture_size = vec2(512.0, 512.0);


uniform float horizontal_shift_per_repeat = 0.0;

void fragment() {

    vec2 pixel_uv = UV * texture_size;
    float vertical_row = floor(pixel_uv.y / texture_size.y);
    
    pixel_uv.x -= vertical_row * horizontal_shift_per_repeat;
    vec2 final_uv = fract(pixel_uv / texture_size);
    
    COLOR = texture(TEXTURE, final_uv);
}