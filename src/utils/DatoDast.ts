import {
  render,
  RenderSettings,
  StructuredTextGraphQlResponse,
} from "datocms-structured-text-to-html-string";

type BlogRecordType = {
  __typename: string;
  id: any;
  img: {
    url: string;
  };
};

export function renderDast(
  gqlResponse: StructuredTextGraphQlResponse<any, any>
) {
  let renderOptions: RenderSettings<BlogRecordType> = {
    renderBlock({ record, adapter: { renderNode } }) {
      // this is where that generic extends.
      return renderNode("img", {
        src: record.img.url,
      });
    },
  };
  return render(gqlResponse, renderOptions);
}
