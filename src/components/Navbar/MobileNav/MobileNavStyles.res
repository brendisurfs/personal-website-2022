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
}
