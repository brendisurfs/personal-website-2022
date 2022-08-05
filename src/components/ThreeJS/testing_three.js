import * as THREE from "three";
// init
var camera = new THREE.PerspectiveCamera(70, window.innerWidth / window.innerHeight, 0.01, 10);
camera.position.z = 1;
var scene = new THREE.Scene();
var geometry = new THREE.BoxGeometry(0.2, 0.2, 0.2);
var material = new THREE.MeshNormalMaterial();
var mesh = new THREE.Mesh(geometry, material);
scene.add(mesh);
export var renderer = new THREE.WebGLRenderer({
    antialias: true
});
renderer.setSize(window.innerWidth, window.innerHeight);
renderer.setAnimationLoop(animation);
function animation(time) {
    mesh.rotation.x = time / 2000;
    mesh.rotation.y = time / 1000;
    renderer.render(scene, camera);
}


//# sourceMappingURL=testing_three.js.map