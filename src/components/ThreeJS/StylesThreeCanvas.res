open Emotion

module CanvasStyles = {
  let container = `
  top: 0;
  left: 0;
  z-index: -10;
  width: 100%;
  height: 100%;
  display: flex;
  position: fixed;
  align-items: center;
  justify-content: center;
  `->rawCss
}
