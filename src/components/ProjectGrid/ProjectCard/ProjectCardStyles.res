open Emotion
// CARD SECTION
module Card = {
  let cardContainer = `
  display: flex;
  max-width: 100%;
  max-height: 100%;
  flex-direction: column;
  border: 1px solid black;
`->rawCss

  let description = `
  display: flex;
  flex-wrap: wrap;
`->rawCss

  let cardGrid = `
  display: grid;
  grid-template-columns: repeat(1, 1fr);

  ${Breakpoints.sm(`
    grid-template-columns: repeat(2,1fr);
  `)}

  ${Breakpoints.md(`
    grid-template-columns: repeat(3,1fr);
  `)}

`->rawCss
}
