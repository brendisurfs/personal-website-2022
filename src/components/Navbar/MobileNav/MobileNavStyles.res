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
  font-size: 20px;
  text-transform: uppercase;
  font-family: Crasey, sans-serif;
  `->Emotion.rawCss

  let mobileMenuBtn = `
    cursor: pointer; 
  `->Emotion.rawCss

  let menuDropdown = `
  transition: right 0.5s ease-in-out;
  top: 5%;
  position: absolute; 
  width: 200px;
  height: 200px;
  background: white;
  `->Emotion.rawCss
}