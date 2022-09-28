varying vec2 vUv;
varying float vWave;
uniform vec2 uMouse;

uniform sampler2D uTexture;
uniform vec2 resolution;

float circle(vec2 uv, vec2 disc_center, float disc_radius, float border_size)
{
  uv -= disc_center;
  uv *= resolution;
  float dist = sqrt(dot(uv, uv));
  return smoothstep(disc_radius + border_size, disc_radius - border_size, dist);
}

void main() {
  vec2 newUV = vUv;
  float c = circle(vUv, uMouse, 0.0, 0.2);
  float wave = vWave;

  float r = texture2D(uTexture, newUV.xy += c * (0.1 * 0.5 * wave)).r;
  float g = texture2D(uTexture, newUV.xy += c * (0.1 * 0.525)).g;
  float b = texture2D(uTexture, newUV.xy += c * (0.1 * 0.55)).b;

  vec3 texture = vec3(r, g, b);
  gl_FragColor = vec4(texture, 1.);
}

