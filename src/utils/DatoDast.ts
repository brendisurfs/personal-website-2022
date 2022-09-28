import {
  render,
  RenderSettings,
  StructuredTextGraphQlResponse,
} from "datocms-structured-text-to-html-string";

type BlogRecordType = {
  __typename: string;
  id: string;
  img: { [param: string]: string };
};

export function renderDast(
  gqlResponse: StructuredTextGraphQlResponse<any, any>
) {
  let renderOptions: RenderSettings<BlogRecordType> = {
    renderBlock({ record, adapter: { renderNode } }) {
      return renderNode("img", {
        // this is where that generic extends.
        src: record.img.url,
      });
    },
  };
  return render(gqlResponse, renderOptions);
}
