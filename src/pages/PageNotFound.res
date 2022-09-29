open React
open Layout

open Emotion
module ErrorStyles = {
  let container = `
  color: white;
  left: 50%;
  top: 50%;
  margin: auto;
  `->rawCss
  let wrapper = `
  display: flex;
  flex-direction: column;
  align-items: center;
  `->rawCss
}

@react.component
let make = () =>
  <Layout>
    <div className={ErrorStyles.container}>
      <div className={ErrorStyles.wrapper}>
        <h3> {"404"->string} </h3> <div> {"Weird, nothing here. Want to go back?"->string} </div>
      </div>
    </div>
  </Layout>
