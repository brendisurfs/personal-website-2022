import * as THREE from "three";
// init
export var renderThree = function() {
    var animation = function animation(time) {
        mesh.rotation.x = time / 2000;
        mesh.rotation.y = time / 1000;
        renderer.render(scene, camera);
    };
    var camera = new THREE.PerspectiveCamera(70, window.innerWidth / window.innerHeight, 0.01, 10);
    camera.position.z = 1;
    var scene = new THREE.Scene();
    var geometry = new THREE.BoxGeometry(0.2, 0.2, 0.2);
    var material = new THREE.MeshNormalMaterial();
    var mesh = new THREE.Mesh(geometry, material);
    scene.add(mesh);
    var renderer = new THREE.WebGLRenderer({
        antialias: true
    });
    renderer.setSize(window.innerWidth, window.innerHeight);
    // target the canvas we put out instead,
    // targetCanvas.appendChild(renderer.domElement)
    // renderer.setAnimationLoop(animation)
    // instead of using document.body.appendChild here,
    // lets use it in rescript
    var targetCanvas = document.getElementById("three-canvas");
    targetCanvas.appendChild(renderer.domElement);
    renderer.render(scene, camera);
// animation
};


//# sourceMappingURL=TestingThree.js.map