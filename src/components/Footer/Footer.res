open FooterStyles

@react.component
let make = () => {
  open Js
  let currentYear = Date.make()->Date.getFullYear->React.float

  let copyText = <div> {" Brendan Prednis "->React.string} currentYear </div>

  // <footer className={footerWrapper}> copyText </footer>
}
