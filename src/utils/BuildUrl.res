let buildUrl = url => {
  url
  ->Js.String2.split(" ")
  ->Js.Array2.map(Js.String2.trim)
  ->Js.Array2.filter(x => x != "-")
  ->Js.Array2.map(Js.String2.toLowerCase)
  ->Js.Array2.map(x => Js.String2.replaceByRe(x, %re(`/\W+/g`), ""))
  ->Js.Array2.joinWith("-")
}
