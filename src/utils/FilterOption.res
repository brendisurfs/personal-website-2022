let filterProjectOption = project => {
  switch project {
  | Some(p) => p->React.string
  | None => ""->React.string
  }
}
