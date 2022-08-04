open Emotion
// CARD SECTION
module Card = {
  let cardContainer = `
    position: relative;
    text-align: center;
    /* max-width: 100%; */
    /* max-height: 100%; */
    color: red;
    border: 1px solid black;
`->rawCss

  let description = `
    position: aboslute;
    top: 50%;
    left: 50%;
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
