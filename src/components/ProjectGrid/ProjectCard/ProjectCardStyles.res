open Emotion
// CARD SECTION
module Card = {
  let cardContainer = `
    width: 50%;
    ${Breakpoints.xxl(`
      width: 25%;
    `)}
    display: flex;
    aspect-ratio: 1/1;
    position: relative;
    flex-direction: column;
`->rawCss

  let textContainer = `
    gap: 0.5rem;
    display: flex;
    font-weight: 300;
    letter-spacing: 2px;
    align-items: center;
    flex-direction: column;
    font-family: sans-serif;
    justify-content: center;

   /* POS FOR TEXT */
    color: rgba(0,0,0, 0);
    position: absolute;
    height: 100%;
    width: 100%;
    z-index: 40;
    top: 50%;
    left: 50%;

    .image-overlay {
      filter: grayscale(100%);
    }

    text-align: center;
    transform: translate(-50%, -50%);
    transition: color 0.5s ease-in-out, background 0.5s ease-in-out;
    &:hover {
      color: white;
      cursor: pointer;
      background: rgba(0, 0, 0, 0.4);
    }
`->rawCss

  let sectionTitle = `
  padding: 0 2rem;
  font-family: sans-serif;
  font-weight: bold;
  color: white;
  `->rawCss

  let title = `
    font-size: 18px;
  `->rawCss

  let description = `
  `->rawCss

  // GRID
  let cardGrid = `
  display: grid;
  padding: 2rem;
  grid-template-columns: repeat(1, 1fr);

`->rawCss
}

/* ${Breakpoints.xs(` */
/* grid-template-columns: repeat(2,1fr); */
/* `)} */
/*  */
/* ${Breakpoints.md(` */
/* grid-template-columns: repeat(3,1fr); */
/* `)} */
