let xs = styles => {
  `
  @media (min-width: 365px) {
      ${styles}
    }`
}

let sm = styles => {
  `
  @media (min-width: 570px) {
      ${styles}
    }`
}

let md = styles => {
  `
  @media (min-width: 768px) {
      ${styles}
    }`
}

let lg = styles => {
  `
  @media (min-width: 992px) {
      ${styles}
    }`
}

let xl = styles => {
  `
  @media (min-width: 1200px) {
      ${styles}
    }`
}

let xxl = styles => {
  `
  @media (min-width: 1800px) {
      ${styles}
    }`
}
