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
    color: white;
    cursor: pointer;
    font-weight: 300;
    font-family: sans-serif;
    flex-direction: row;
    align-items: start;
    transition: color 0.15s ease-in-out;
    justify-content: space-between;
    &:hover {
      color: #c89720;
    }

  `->rawCss

  let tagContainer = `
    display: flex;
    flex-direction: row;
    gap: 12px;
  `->rawCss

  let bottomBorder = `
    width: 100%;
    color: red;
    height: 1px;
    background: white;
  `->rawCss

  let blogItemWrapper = `
    display: flex;
    flex-direction: column;
    gap: 12px;
  `->rawCss

  let listItemsContainer = `
  display: flex;
  gap: 2.5rem;
  flex-direction: column;

  `->rawCss
}
