import * as THREE from "three";

const scene = new THREE.Scene();

// CAMERA ---
const camera = new THREE.PerspectiveCamera(
  70,
  window.innerWidth / window.innerHeight,
  0.01,
  10
);
camera.position.z = 1;

const geometry = new THREE.BoxGeometry(0.2, 0.2, 0.2);
const material = new THREE.MeshNormalMaterial();

const customGLSLMaterial = new THREE.RawShaderMaterial({
  vertexShader: "",
  fragmentShader: "",
});

const mesh = new THREE.Mesh(geometry, material);
scene.add(mesh);

// RENDERER
const renderer = new THREE.WebGLRenderer({ antialias: true });
renderer.setSize(window.innerWidth * 0.8, window.innerHeight * 0.8);
export const renderCanvas = () => {
  return renderer.domElement;
};

function animation(time: number) {
  mesh.rotation.x = time / 2000;
  mesh.rotation.y = time / 1000;
}
//
// exports the render target to Rescript.
export const renderTarget = () => {
  renderer.setAnimationLoop(animation);
  renderer.render(scene, camera);
};

// animation update
