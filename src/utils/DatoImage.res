// bind to the dato image component
// type filterProp = {"filter": string, "transition": string}

@module("react-datocms") @react.component
external make: (~data: 'a, ~style: option<{..}>=?, ~pictureStyle: option<{..}>=?) => React.element =
  "Image"
