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
  grid-template-columns: repeat(4, 1fr);
`)

// TYPE Section
module TitleType = %styled.div(`
  padding: 2rem 0;
  font-weight: bold;
`)
module TypeContainer = %styled.div(`
  display: flex;
  flex-direction: column;
`)
