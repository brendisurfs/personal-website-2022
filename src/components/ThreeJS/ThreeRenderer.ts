import { ShaderPass } from "three/examples/jsm/postprocessing/ShaderPass";
import { EffectComposer } from "three/examples/jsm/postprocessing/EffectComposer";
import { RenderPass } from "three/examples/jsm/postprocessing/RenderPass";
import { RGBShiftShader } from "three/examples/jsm/shaders/RGBShiftShader";
import {
  BoxGeometry,
  Mesh,
  MeshNormalMaterial,
  PerspectiveCamera,
  PlaneGeometry,
  Scene,
  ShaderMaterial,
  Vector2,
  WebGLRenderer,
} from "three";

const scene = new Scene();
let uMouse = new Vector2(0.0, 0.0);

// CAMERA ---
const camera = new PerspectiveCamera(
  35,
  window.innerWidth / window.innerHeight,
  0.01,
  10
);
camera.position.z = 1;

const grid = new PlaneGeometry(2.0, 2.0);
const geometry = new BoxGeometry(0.2, 0.2, 0.2);
geometry.rotateX(10);
geometry.rotateY(20);

const material = new MeshNormalMaterial();

// custom overlay.
const customGLSLMaterial = new ShaderMaterial({
  uniforms: {
    uMouse: { value: new Vector2(-10, -10) },
  },
  vertexShader: `
precision mediump float;
#pragma glslify: snoise = require("glsl-noise/simplex/3d")

varying vec2 vUv;
varying float vWave;
uniform float uTime;
uniform vec2 mousePos;

void main() {
  vUv = uv;

  vec3 pos = position;
  float noiseFreq = 30.0;
  float noiseAmp = 0.1;
  vec3 noisePos = vec3(pos.x * noiseFreq + uTime * 0.5, mousePos.x, mousePos.y);
  pos.z += snoise(noisePos) * noiseAmp;
  vWave = pos.z;

  gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
}
  `,
  fragmentShader: `
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

  float r = texture2D(uTexture, newUV.xy += c * (wave * 0.5)).r;
  float g = texture2D(uTexture, newUV.xy += c * (0.1 * 0.525)).g;
  float b = texture2D(uTexture, newUV.xy += c * (0.1 * 0.55)).b;

  vec3 texture = vec3(r, g, b);
  gl_FragColor = vec4(texture, 1.);
}
`,
});
//
const mesh = new Mesh(geometry, material);
scene.add(mesh);

// RENDERER
const renderer = new WebGLRenderer({ antialias: true });
renderer.setSize(window.innerWidth * 0.8, window.innerHeight * 0.8);

// POST PROCESSING
const effectComposer = new EffectComposer(renderer);
effectComposer.setSize(window.innerWidth * 0.8, window.innerHeight * 0.8);
effectComposer.setPixelRatio(Math.min(window.devicePixelRatio, 2));

const renderPass = new RenderPass(scene, camera);
effectComposer.addPass(renderPass);

document.addEventListener("mousemove", (ev: MouseEvent) => {
  uMouse.x = ev.clientX;
});

const rgbShift = new ShaderPass(RGBShiftShader);
rgbShift.enabled = true;
effectComposer.addPass(rgbShift);

export const renderCanvas = () => {
  return renderer.domElement;
};

function animation(time: number) {
  mesh.rotation.x = time / 4000;
  mesh.rotation.y = time / 2000;
  effectComposer.render(time);
}

//
// exports the render target to Rescript.
export const renderTarget = () => {
  renderer.setAnimationLoop(animation);
};

// animation update
