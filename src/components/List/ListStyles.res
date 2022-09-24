open Emotion
module ListStyle = {
  let container = `
  display: flex;
  align-items: center;
  flex-direction: column;
  justify-content: center;
  padding: 2rem;
  `->rawCss
  let listItem = `
    display: flex;
    width: 40rem;
    color: white;
    cursor: pointer;
    font-weight: 300;
    font-family: sans-serif;
    transition: color 0.15s ease-in-out;
    flex-direction: row;
    align-items: center;
    border-bottom: 1px solid grey;
    justify-content: space-between;
    &:hover {
      color: salmon;
    }
  `->rawCss
}
