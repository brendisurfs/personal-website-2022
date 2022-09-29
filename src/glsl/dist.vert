precision mediump float;

#pragma glslify: snoise = require("glsl-noise/simplex/3d")

varying vec2 vUv;
varying float vWave;
uniform float uTime;
uniform vec2 mousePos;

void main() {
  vUv = uv;


  vec3 pos = position;
  float noiseFreq = 3.5;
  float noiseAmp = 2.0;
  vec3 noisePos = vec3(pos.y * noiseFreq + uTime, mousePos.x, mousePos.y);
  pos.z += snoise(noisePos) * noiseAmp;
  vWave = pos.z;


  gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
}

