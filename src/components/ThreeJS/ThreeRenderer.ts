import * as THREE from "three";

import fragShader from "public/shaders/test.glsl";

const scene = new THREE.Scene();

// CAMERA ---
const camera = new THREE.PerspectiveCamera(
  70,
  window.innerWidth / window.innerHeight,
  0.01,
  10
);
camera.position.z = 1;

const grid = new THREE.PlaneGeometry(2.0, 2.0);
const geometry = new THREE.BoxGeometry(0.2, 0.2, 0.2);
geometry.rotateX(10);
geometry.rotateY(20);

const material = new THREE.MeshNormalMaterial();

const customGLSLMaterial = new THREE.RawShaderMaterial({
  vertexShader: fragShader,
  fragmentShader: `
    precision mediump float;

    void main()
    {
      gl_FragColor = vec4(1.0,0.0,0.0,1.0);
    }
  `,
});

const mesh = new THREE.Mesh(geometry, customGLSLMaterial);
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
  // renderer.render(scene, camera);
}
//
// exports the render target to Rescript.
export const renderTarget = () => {
  // renderer.setAnimationLoop(animation);
  renderer.render(scene, camera);
};

// animation update
