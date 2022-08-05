open Emotion

module PageStyle = {
  let container = `
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  color: white;
  width: 100%;
  `->rawCss

  let wrapper = `
    width: 66%;
    margin: auto;
  `
}
