import {
  render,
  StructuredTextDocument,
} from "datocms-structured-text-to-html-string";
export const renderDast = (node: StructuredTextDocument) => {
  render(node, {
    renderBlock({ record, adapter: { renderNode } }) {
      return renderNode(
        "figure",
        {},
        renderNode("img", {
          src: record.url as string,
        })
      );
    },
  });
};
// const renderOptions = {
//   renderBlock({ record, adapter: { renderNode } }) {
//     return renderNode("figure", {}, renderNode("img", { src: record.url }));
//   },
// };

// export const renderWithOptions = node => {
//   render(node, renderOptions);
// };
