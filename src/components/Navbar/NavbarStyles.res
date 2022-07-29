open Emotion

let navbarContainer = `
  padding: 1rem 2rem;
  display: flex;
  background: black;
  flex-direction: row;
  align-items: center;
  justify-content: space-between;
  `->rawCss

let navTitleStyle = `
  font-weight: bold;
  font-size: 32px;
  color: white;
`->rawCss

let navButtonWrapper = `
  gap: 12px;
  display: flex;
  justify-content: space-between;
  `->rawCss

let navButton = `
  &:hover {
    cursor: pointer;
  }
  `->rawCss
