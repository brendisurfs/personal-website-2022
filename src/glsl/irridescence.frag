

const float iridStrength = 0.5;
const float iridSaturation = 0.7;
const float fresnelStrength = 3.;
const vec3 lightCol = vec3(.02, .7, .02);

vec2 mouse;

#define MRX(X)
mat3(1., 0., 0., 0., cos(X), -sin(X), 0., sin(X),
     cos(X)) // x axis rotation matrix

#define MRY(X)
    mat3(cos(X), 0., sin(X), 0., 1., 0., -sin(X), 0.,
         cos(X)) // y axis rotation matrix

#define MRZ(X)
    mat3(cos(X), -sin(X), 0., sin(X), cos(X), 0., 0., 0.,
         1.)                                  // z axis rotation matrix
#define MRF(X, Y, Z) MRZ(Z) * MRY(Y) * MRX(X) // x,y,z combined rotation macro
#define ROT MRF(iTime * .1 + mouse.y, iTime * .2 + mouse.x, iTime * .3)
    const int iter = 256;
const float far = 1000.;
#define EPSILON 0.00001

// iq's signed-box distance function
float sdBox(vec3 p, vec3 b) {
  vec3 d = abs(p) - b;
  return min(max(d.x, max(d.y, d.z)), 0.0) + length(max(d, 0.0));
}

float sdBoxR(vec3 p, vec3 b) {
  p = p * ROT;
  return sdBox(p, b);
}

vec3 normalBoxR(vec3 p, vec3 b) {
  float dx = sdBoxR(vec3(p.x + EPSILON, p.y, p.z), b) -
             sdBoxR(vec3(p.x - EPSILON, p.y, p.z), b);
  float dy = sdBoxR(vec3(p.x, p.y + EPSILON, p.z), b) -
             sdBoxR(vec3(p.x, p.y - EPSILON, p.z), b);
  float dz = sdBoxR(vec3(p.x, p.y, p.z + EPSILON), b) -
             sdBoxR(vec3(p.x, p.y, p.z - EPSILON), b);
  return vec3(dx, dy, dz);
}

vec3 normalBox(vec3 p, vec3 b) {
  float dx = sdBox(vec3(p.x + EPSILON, p.y, p.z), b) -
             sdBox(vec3(p.x - EPSILON, p.y, p.z), b);
  float dy = sdBox(vec3(p.x, p.y + EPSILON, p.z), b) -
             sdBox(vec3(p.x, p.y - EPSILON, p.z), b);
  float dz = sdBox(vec3(p.x, p.y, p.z + EPSILON), b) -
             sdBox(vec3(p.x, p.y, p.z - EPSILON), b);
  return vec3(dx, dy, dz);
}

// Color palette function taken from iq's shader @
// https://www.shadertoy.com/view/ll2GD3
#define pal(t) (.5 + .5 * cos(6.283 * (t + vec4(0, 1, 2, 0) / 3.)))

// rgb to grey scale
vec3 greyScale(vec3 color, float lerpVal) {

  float greyCol = 0.3 * color.r + 0.59 * color.g + 0.11 * color.b;
  vec3 grey = vec3(greyCol, greyCol, greyCol);
  vec3 newColor = mix(color, grey, lerpVal);
  return newColor;
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
  mouse = iMouse.xy / iResolution.xy;
  vec2 uv = fragCoord / iResolution.xy;
  uv -= vec2(.5);
  uv.x *= iResolution.x / iResolution.y;
  uv *= 5.;

  vec3 camPos = vec3(0., 0., -20.);
  vec3 screen = vec3(uv.x, uv.y, -5.);
  vec3 rayDir = normalize(screen - camPos);

  vec3 box = vec3(2., 2., 2.);

  float depth = 0.;

  for (int i = 0; i < iter; i++) {
    vec3 tpc = camPos + rayDir * depth;
    tpc = tpc * ROT;
    float distc = sdBox(tpc, box);
    if (distc < EPSILON) {
      break;
    }
    if (depth > far) {
      break;
    }
    depth += distc;
  }

  vec3 p = camPos + rayDir * depth;
  vec3 pc = camPos + rayDir * depth;
  vec3 rpc = pc * ROT;
  float c = sdBox(rpc, box);
  vec3 nc = normalize(normalBox(rpc, box));
  vec3 nco = normalize(normalBoxR(pc, box)); // normal for calculating fresnel
  c = smoothstep(1., .07, c);

  vec3 up;
  // calculating up and right surface vectors for texturing
  if (abs(dot(vec3(0., 0., 1.), nc)) > 1. - EPSILON ||
      abs(dot(vec3(0., 0., -1.), nc)) > 1. - EPSILON) {
    up = vec3(0., 1., 0.);
  } else {
    up = normalize(cross(vec3(0., 0., 1.), nc));
  }
  vec3 right;
  if (abs(dot(up, nc)) > 1. - EPSILON || abs(dot(-up, nc)) > 1. - EPSILON) {
    right = vec3(1., 0., 0.); //* -sign(nc.y) ;
  } else {
    right = normalize(cross(nc, up));
  }
  vec3 rpco = (rpc - box * (up + right)) / (box * 2.);
  float dRight = (dot((rpco), right)); // right surface vector
  float dUp = dot(rpco, up);           // up surface vector

  // lights
  vec3 lightPos = vec3(2., 2., -5.);
  vec3 lightDir = normalize(-lightPos);
  float ldc = dot(lightDir, -nc);
  vec3 rflct = reflect(normalize(pc - lightPos), nc);
  float spec = dot(rflct, normalize(camPos - pc));

  vec2 uvm = (abs(vec2(dRight, dUp))); // texture uv
  vec4 tex = texture(iChannel0, uvm);
  vec4 greyTex = vec4(greyScale(tex.rgb, 1.), 1.);
  float fres = 1. - dot(nco, normalize(camPos - pc));
  fres *= fresnelStrength;
  vec4 irid = pal((c) + (fres * greyTex)); // iridescence
  vec3 col = ((.4 + .3 * ldc + pow(spec, 2.) * 0.3) * lightCol) * .3 * c;
  col += greyScale(irid.rgb, 1. - iridSaturation) * c * iridStrength;
  fragColor = vec4(col, 1.0);
}
