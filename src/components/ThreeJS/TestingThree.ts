import * as THREE from "three"

// init

const camera = new THREE.PerspectiveCamera(
  70,
  window.innerWidth / window.innerHeight,
  0.01,
  10
)
camera.position.z = 1

const scene = new THREE.Scene()

const geometry = new THREE.BoxGeometry(0.2, 0.2, 0.2)
const material = new THREE.MeshNormalMaterial()

const mesh = new THREE.Mesh(geometry, material)
scene.add(mesh)

export const renderer = new THREE.WebGLRenderer({ antialias: true })
renderer.setSize(window.innerWidth, window.innerHeight)
// target the canvas we put out instead,
let targetCanvas = document.getElementById("three-canvas")
targetCanvas.appendChild(renderer.domElement)
// renderer.setAnimationLoop(animation)
// instead of using document.body.appendChild here,
// lets use it in rescript
export const renderThree = () => {
  targetCanvas.appendChild(renderer.domElement)
  renderer.render(scene, camera)
}

// animation

function animation(time: number) {
  mesh.rotation.x = time / 2000
  mesh.rotation.y = time / 1000

  renderer.render(scene, camera)
}
