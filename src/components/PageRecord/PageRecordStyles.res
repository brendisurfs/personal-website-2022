open Emotion

module PageStyle = {
  let container = `
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  padding-top: 2rem;
  color: white;
  width: 100%;
  `->rawCss

  let wrapper = `
    width: 50%;
    margin: auto;
  `

  let title = `
    text-transform: uppercase;
    font-family: sans-serif;
  `->rawCss

  let bodyText = `
    font-size: 18px;
    font-weight: 300;
    font-family: sans-serif;
  `->rawCss
}
