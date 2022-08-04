open Emotion
// CARD SECTION
module Card = {
  let cardContainer = `
    display: flex;
    flex-direction: column;
    aspect-ratio: 1/1;
    position: relative;
    width: 100%;
    border: 1px solid black;
`->rawCss

  let textContainer = `
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;

   /* POS FOR TEXT */
    color: red;
    z-index: 40;
    position: absolute;
    width: 100%;
    height: 100%;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    text-align: center;
    opacity: 0;
    transition: all 0.5s ease-in-out;
    &:hover {
      opacity: 1;
    }
`->rawCss

  let title = `
  `->rawCss

  let description = `
  `->rawCss

  // GRID
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
