import * as THREE from "three";

const scene = new THREE.Scene();
let cam = new THREE.PerspectiveCamera();
let sphere = new THREE.Mesh(
  new THREE.SphereGeometry(2),
  new THREE.MeshNormalMaterial()
);

let renderer = new THREE.WebGLRenderer({
  canvas: document.getElementById("bg-canvas") as HTMLCanvasElement,
});

scene.add(sphere);
