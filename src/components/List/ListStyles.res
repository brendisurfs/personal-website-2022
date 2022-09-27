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
    flex-direction: row;
    align-items: center;
    justify-content: space-between;
    &:hover {
      color: #c89720;
    }

  @keyframes animBorder {
    100% {
      border-bottom: 24px;
    }
  }
  `->rawCss

  let bottomBorder = `
    width: 100%;
    color: red;
    height: 1px;
    background: red;



  `->rawCss
}
