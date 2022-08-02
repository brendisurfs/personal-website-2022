module CardContainer = %styled.div(`
  flex-direction: column;
  border: 1px solid red;
  max-height: 100%;
  max-width: 100%;
  padding: 2rem;
  display: flex;
`)

module Description = %styled.div(`
  display: flex;
  flex-wrap: wrap;
`)
module CardGrid = %styled.div(`
  display: grid;
  grid-template-columns: repeat(4, 1fr);
`)
