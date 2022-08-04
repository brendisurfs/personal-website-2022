// bind to the dato image component
type cssProperties = {"aspectRatio": string}
@module("react-datocms") @react.component
external make: (~data: 'a, ~style: option<cssProperties>=?) => React.element = "Image"
