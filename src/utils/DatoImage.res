// bind to the dato image component
type cssProperties = {"aspectRatio": string}
type filterProp = {"filter": string, "transition": string}

@module("react-datocms") @react.component
external make: (
  ~data: 'a,
  ~style: option<cssProperties>=?,
  ~pictureStyle: option<filterProp>=?,
) => React.element = "Image"
