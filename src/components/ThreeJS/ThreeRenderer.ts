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
let uniformMouse = new Vector2(0.0, 0.0);

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
  vertexShader: "",
  fragmentShader: "",
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
  uniformMouse.x = ev.clientX;
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
