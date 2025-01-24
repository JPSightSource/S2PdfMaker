defmodule S2PdfMaker.PDF do
  require Record
  alias S2PdfMaker.PDF.Context

  def export(%Context{} = context, stream) do
    context = add_page(context, stream)
    {render_context, ^context} = S2PdfMaker.PDF.Builder.build(context)
    S2PdfMaker.PDF.Exporter.export(render_context)
  end

  def add_page(%Context{} = context, stream) do
    next_page_number = context.current_page + 1

    %Context{
      context
      | current_page: next_page_number,
        pages: Enum.reverse([stream | context.pages])
    }
  end
end
