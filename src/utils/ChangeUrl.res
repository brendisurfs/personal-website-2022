open Js.Global
let changeUrl = url => {
  let _ = setTimeout(() => RescriptReactRouter.push(url), 777)
}
