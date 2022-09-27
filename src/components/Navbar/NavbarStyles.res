open Emotion

module Nav = {
  let container = `
  display: flex;
  background: black;
  flex-direction: row;
  width: 100%;
  margin: 0 auto;
  justify-content: center;
  z-index: 100;
  `->rawCss

  let innerWrapper = `
  width: 100%;
  padding: 1rem 2rem;
  display: flex;
  align-items: center;
  flex-direction: row;
  justify-content: space-between;
  gap: 1rem;
  `->rawCss

  let title = `
  z-index: 100;
  font-family: Crasey, sans-serif;
  text-transform: uppercase;
  font-size: 1rem;
  color: white;
  &:hover {
    cursor: pointer;
  }
  display: flex;
  flex-direction: row;
  align-items: center;
  gap: 10px;
  justify-content: center;
  h1 {
    margin: 0;
  }
`->rawCss

  let buttonWrapper = `
  gap: 12px;
  display: flex;
  justify-content: space-between;
  `->rawCss

  let button = `
  text-transform: uppercase;
  font-family: Crasey, sans-serif;
  letter-spacing: 2px;
  font-size: 16px;
  color: white;
  &:hover {
    cursor: pointer;
  }
  `->rawCss

  let boxButton = `
  width: 2.5rem;
  height: 2.5rem;
  cursor: pointer;
  background: white;
  position: relative;
  border-radius: 30px;
  transition: width 0.2s ease-in-out, height 0.2s ease-in-out;
  &:hover {
    height: 2rem ;
    width: 6rem;
  }
  `->rawCss

  let boxPlus = `
    justify-content: center;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    z-index: 998;
    background: black;
    border-radius: 7px;
    width: 0.15rem;
    height: 1.15rem;
  `->rawCss

  let boxMinus = `
    justify-content: center;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    z-index: 998;
    background: black;
    border-radius: 7px;
    height: 0.15rem;
    width: 1.15rem;
  `->rawCss
}
