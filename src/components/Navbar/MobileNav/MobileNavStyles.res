module MVStyle = {
  let container = `
    padding: 1rem;
    display: flex;
    align-items: center;
    flex-direction: row;
    justify-content: space-between;
`->Emotion.rawCss

  let mobileTitle = `
  color: white;
  cursor: pointer;
  font-size: 1.75rem;
  text-transform: uppercase;
  font-family: Crasey, sans-serif;
  transition: color 0.25s ease-in-out;

  &:hover {
    color: #c89720;
  }
  `->Emotion.rawCss

  let mobileMenuBtn = `
    cursor: pointer;
  `->Emotion.rawCss

  let menuDropdown = `
  right: 0%;
  width: 100%;
  height: 100%;
  display: flex;
  position: absolute;
  align-items: center;
  flex-direction: column;
  justify-content: center;
  background-color: rgba(20,20,20, .50);
  backdrop-filter: blur(10px);
  `->Emotion.rawCss

  let menuDropownButton = `
  font-size: 4rem;
  display: block;
  cursor: pointer;
  color: lightgray;
  font-family: Crasey, sans-serif;
  transition: color 0.25s ease-in-out;

  &:hover {
    color: #c89720;
  }
  `->Emotion.rawCss
}
