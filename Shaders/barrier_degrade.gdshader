shader_type canvas_item;

// The external value controlled via script (0.0 = fully visible, 1.0 = completely removed)
instance uniform float dissolve_amount : hint_range(0.0, 1.0) = 0.0;

// A noise texture used to determine the pattern of pixel removal
uniform sampler2D dissolve_texture : source_color, filter_nearest;

void fragment() {
    // Get the original color of the sprite pixel
    vec4 main_texture = texture(TEXTURE, UV);
    
    // Get the grayscale value from the noise texture
    float noise_value = texture(dissolve_texture, UV).r;
    
    // Remove the pixel if the noise value is less than or equal to the dissolve amount
    if (noise_value <= dissolve_amount) {
        discard;
    }
    
    // Output the original sprite color for remaining pixels
    COLOR = main_texture;
}
