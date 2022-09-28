import { ShaderPass } from "three/examples/jsm/postprocessing/ShaderPass";
import { EffectComposer } from "three/examples/jsm/postprocessing/EffectComposer";
import { RenderPass } from "three/examples/jsm/postprocessing/RenderPass";
import { OrbitControls } from "three/examples/jsm/controls/OrbitControls";
import { RGBShiftShader } from "three/examples/jsm/shaders/RGBShiftShader";
import {
  BoxGeometry,
  Clock,
  DoubleSide,
  Mesh,
  MeshNormalMaterial,
  PerspectiveCamera,
  PlaneGeometry,
  Scene,
  ShaderMaterial,
  TextureLoader,
  Vector2,
  WebGLRenderer,
} from "three";

import vertexShader from "@shaders/dist.vert";
import fragmentShader from "@shaders/dist.frag";

const scene = new Scene();
let uMouse = new Vector2(0.0, 0.0);

// CAMERA ---
const camera = new PerspectiveCamera(
  75,
  window.innerWidth / window.innerHeight,
  0.01,
  100
);
camera.position.z = 5;

const grid = new PlaneGeometry(3.0, 6.0, 80, 80);
const geometry = new BoxGeometry(0.2, 0.2, 0.2);
geometry.rotateX(10);
geometry.rotateY(20);

const material = new MeshNormalMaterial();

// custom overlay.
const customGLSLMaterial = new ShaderMaterial({
  side: DoubleSide,
  uniforms: {
    uMouse: { value: new Vector2(-10, -10) },
    uTime: { value: 0.0 },
    uTexture: {
      value: new TextureLoader().load("/dark-magician.jpg"),
    },
    resolution: {
      value: new Vector2(1, window.innerWidth / window.innerHeight),
    },
  },
  vertexShader: vertexShader,
  fragmentShader: fragmentShader,
});
//
const mesh = new Mesh(grid, customGLSLMaterial);
mesh.rotation.x = 0.5;
mesh.rotation.y = 0.5;
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
  uMouse.x = ev.clientX / window.innerWidth;
  uMouse.y = 1.0 - ev.clientY / window.innerHeight;
});

const rgbShift = new ShaderPass(RGBShiftShader);
rgbShift.enabled = false;
effectComposer.addPass(rgbShift);

export const renderCanvas = () => {
  return renderer.domElement;
};

const clock = new Clock();
const controls = new OrbitControls(camera, renderer.domElement);
controls.maxPolarAngle = Math.PI * 0.75;
controls.minPolarAngle = Math.PI * 0.25;
controls.enableDamping = true;
controls.enableZoom = false;
controls.enablePan = false;
controls.enableRotate = false;

function animation(time: number) {
  mesh.rotation.x = Math.cos(uMouse.y * Math.PI * -1) * 0.5;
  mesh.rotation.y = Math.cos(uMouse.x * Math.PI * -1) * -0.5;
  customGLSLMaterial.uniforms.uTime.value = clock.getElapsedTime();
  customGLSLMaterial.uniforms.uMouse.value = uMouse;
  effectComposer.render(time);
}

//
// exports the render target to Rescript.
export const renderTarget = () => {
  renderer.setAnimationLoop(animation);
};

// animation update
