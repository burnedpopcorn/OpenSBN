varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec3 u_blendColor;
void main()
{ 
    vec4 s_col = vec4 (texture2D( gm_BaseTexture, v_vTexcoord ));
    float channels = (s_col.r + s_col.g + s_col.b);
    if (channels > 0.0) {
        s_col.rgb = u_blendColor;
    } else { // Multiply Blend
        s_col.rgb = u_blendColor * u_blendColor * u_blendColor;
    }
    gl_FragColor =  v_vColour * s_col;
}