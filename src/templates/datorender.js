import { render, renderBlock } from "datocms-structured-text-to-html-string";

renderBlock({});

const renderOptions = {
  renderBlock({ record, adapter: { renderNode } }) {
    return renderNode("figure", {}, renderNode("img", { src: record.url }));
  },
};

export const renderWithOptions = node => {
  render(node, renderOptions);
};
