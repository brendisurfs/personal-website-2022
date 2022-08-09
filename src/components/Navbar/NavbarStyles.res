open Emotion

module Nav = {
  let container = `
  padding: 1rem 2rem;
  display: flex;
  background: black;
  flex-direction: row;
  align-items: center;
  gap: 10px;
  justify-content: center;
  border: 1px solid red;
  `->rawCss

  let innerWrapper = `
  width: 66%;
  display: flex;
  align-items: center;
  `->rawCss

  let title = `
  font-family: Kingthings_Petrock, sans-serif;
  text-transform: uppercase;
  letter-spacing: 4px;
  font-size: 24px;
  color: white;
  &:hover {
    cursor: pointer;
  }
  display: flex;
  flex-direction: row;
  align-items: center;
  gap: 10px;
  justify-content: center;
`->rawCss

  let buttonWrapper = `
  gap: 12px;
  display: flex;
  justify-content: space-between;
  `->rawCss

  let button = `
  text-transform: capitalize;
  font-family: sans-serif;
  border-bottom: 1px solid white;
  padding-bottom: 10px;
  letter-spacing: 2px;
  font-size: 16px;
  color: white;
  &:hover {
    cursor: pointer;
  }
  `->rawCss
}
