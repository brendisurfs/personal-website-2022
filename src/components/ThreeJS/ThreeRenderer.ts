import { EffectComposer } from "three/examples/jsm/postprocessing/EffectComposer";
import { RenderPass } from "three/examples/jsm/postprocessing/RenderPass";
import { OrbitControls } from "three/examples/jsm/controls/OrbitControls";
import { GLTF, GLTFLoader } from "three/examples/jsm/loaders/GLTFLoader";

import {
  Mesh,
  Scene,
  Clock,
  Vector2,
  DoubleSide,
  PlaneGeometry,
  TextureLoader,
  WebGLRenderer,
  ShaderMaterial,
  PerspectiveCamera,
  OctahedronGeometry,
  MeshNormalMaterial,
  MeshBasicMaterial,
} from "three";

//@ts-ignore
import vertexShader from "@shaders/dist.vert";
//@ts-ignore
import fragmentShader from "@shaders/dist.frag";
import { ShaderPass } from "three/examples/jsm/postprocessing/ShaderPass";

const sizes = {
  width: window.innerWidth,
  height: window.innerHeight,
};

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

/**
 *
 * Custom materials
 *
 * */

let darkMagicianTex = new TextureLoader().load("/dark-magician.jpg");
const customMeshMat = new MeshBasicMaterial({
  map: darkMagicianTex,
});

const customGLSLMaterial = new ShaderMaterial({
  side: DoubleSide,
  uniforms: {
    tDiffuse: { value: null },
    uMouse: { value: new Vector2(-10, -10) },
    uTime: { value: 0.0 },
    uVelocity: {
      value: 0.0,
    },
    resolution: {
      value: new Vector2(1, window.innerWidth / window.innerHeight),
    },
  },
  vertexShader: vertexShader,
  fragmentShader: fragmentShader,
});

/**
 *
 * GEOMETRY
 *
 * */
let yulaPeopleModel: GLTF;

let normalMat = new MeshNormalMaterial();
const cardGrid = new PlaneGeometry(3.0, 5.0, 80, 80);
let customPoly = new OctahedronGeometry(2.0);
let errorMesh = new Mesh(cardGrid, customMeshMat);

const yulaPeople = new GLTFLoader();
// load the geo, display the loader.
yulaPeople.load(
  "static/yula_people.gltf",
  gltf => {
    let model = gltf.scene.children[0];
    scene.add(model);
    // const mesh = new Mesh(model, customGLSLMaterial);
    // mesh.rotation.x = 0.5;
    // mesh.rotation.y = 0.5;
    // scene.add(mesh);
  },

  progress => {
    console.log(progress);
  },
  error => {
    console.error(error);
    scene.add(errorMesh);
  }
);

//

/**
 *
 * RENDERER
 *
 * */

let followMouse = new Vector2();
let previousMouse = new Vector2();

const renderer = new WebGLRenderer({ antialias: true });
renderer.setSize(sizes.width, sizes.height);

// POST PROCESSING
const effectComposer = new EffectComposer(renderer);
effectComposer.setSize(window.innerWidth, window.innerHeight);
effectComposer.setPixelRatio(Math.min(window.devicePixelRatio, 2));

const renderPass = new RenderPass(scene, camera);

let customRenderPass = new ShaderPass(customGLSLMaterial);
customRenderPass.renderToScreen = true;

effectComposer.addPass(renderPass);
effectComposer.addPass(customRenderPass);

let targetSpeed = 0;
const calcSpeed = () => {
  const speed = Math.sqrt(
    (previousMouse.x - uMouse.x) ** 2 + (previousMouse.y - uMouse.y) ** 2
  );

  targetSpeed -= 0.1 * (targetSpeed - speed);
  followMouse.x -= 0.1 * (followMouse.x - uMouse.x);
  followMouse.y -= 0.1 * (followMouse.y - uMouse.y);

  previousMouse.x = uMouse.x;
  previousMouse.y = uMouse.y;
};

document.addEventListener("mousemove", (ev: MouseEvent) => {
  uMouse.x = ev.clientX / window.innerWidth;
  uMouse.y = 1.0 - ev.clientY / window.innerHeight;
  calcSpeed();
});

window.addEventListener("resize", () => {
  sizes.width = window.innerWidth;
  sizes.height = window.innerHeight;

  camera.aspect = sizes.width / sizes.height;
  camera.updateProjectionMatrix();
  renderer.setSize(sizes.width, sizes.height);
});

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
  // errorMesh.rotation.x = Math.cos(uMouse.y * Math.PI * -1) * 0.5;
  // errorMesh.rotation.y = Math.cos(uMouse.x * Math.PI * -1) * -0.5;

  customGLSLMaterial.uniforms.uTime.value = clock.getElapsedTime() + 0.05;
  customGLSLMaterial.uniforms.uVelocity.value = Math.min(targetSpeed, 0.05);
  customGLSLMaterial.uniforms.uMouse.value = followMouse;

  effectComposer.render(time);
}

//
// exports the render target to Rescript.
export const renderTarget = () => {
  renderer.setAnimationLoop(animation);
};

// animation update
