module MVStyle = {
  let container = `
    padding: 1rem;
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
`->Emotion.rawCss

  let mobileTitle = `
  color: white;
  font-size: 1.75rem;
  text-transform: uppercase;
  font-family: Crasey, sans-serif;
  `->Emotion.rawCss

  let mobileMenuBtn = `
    cursor: pointer;
  `->Emotion.rawCss

  let menuDropdown = `
  right: 0%;
  position: absolute;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  width: 100%;
  height: 100%;
  background-color: rgba(20,20,20, .50);
  color: white;
  backdrop-filter: blur(10px);
  `->Emotion.rawCss

  let menuDropownButton = `
  font-size: 2rem;
  display: block;
  font-family: Crasey, sans-serif;
  `->Emotion.rawCss
}
