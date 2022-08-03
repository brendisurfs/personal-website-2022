open Emotion
// CARD SECTION
module CardContainer = %styled.div(`
  display: flex;
  max-width: 100%;
  max-height: 100%;
  flex-direction: column;
  border: 1px solid black;

`)

module Description = %styled.div(`
  display: flex;
  flex-wrap: wrap;
`)

module CardGrid = %styled.div(`
  display: grid;
  grid-template-columns: repeat(1, 1fr);

  @media (min-width: 768px) {
    grid-template-columns: repeat(3, 1fr);
  }
`)

let cgGrid = `
  display: grid;
  grid-template-columns: repeat(1, 1fr);

  ${Breakpoints.sm(`
    grid-template-columns: repeat(2,1fr);
  `)}

  ${Breakpoints.md(`
    grid-template-columns: repeat(3,1fr);
  `)}

`->rawCss
