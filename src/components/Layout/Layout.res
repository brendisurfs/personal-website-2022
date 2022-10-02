open LayoutStyles
open Context

module Layout = {
  @react.component
  let make = (~children: React.element) => {
    let isFading = React.useContext(TransitionContext.transitionContext)
    Js.log(isFading)
    /*  */
    /* React.useEffect0(() => { */
    /* }) */

    /* let fadingStyle = ReactDOM.Style.make( */
    /* ~transition="opacity 0.7s ease-in-out", */
    /* ~opacity={fading == true ? "0" : "1"}, */
    /* (), */
    /* ) */

    /* let fadoutStyle = ReactDOM.Style.make(~transition="opacity 0.7s ease-in-out", ()) */

    <div className={layoutContainer}> <NavbarSwitcher /> children </div>
  }
}
