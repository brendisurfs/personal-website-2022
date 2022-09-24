

float fresnel(float amount, vec3 normal, vec3 view)
{
	return pow((1.0 - clamp(dot(normalize(normal), normalize(view)), 0.0, 1.0 )), amount);
}

layout(location = 0) in vec2 v_Uv;
layout(location = 1) in vec3 v_Normal;
layout(location = 0) out vec4 o_Target;
layout(set 1, binding = 0) uniform CustomFresnelMaterial {
  vec4 Color;
}

void main() {
  float FRESNEL_AMOUNT = 1.0;
  o_Target = fresnel(FRESNEL_AMOUNT, Color.xyz,  v_Normal);
}



