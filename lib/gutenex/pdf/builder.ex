defmodule S2PdfMaker.PDF.Builder do
  alias S2PdfMaker.PDF.Context
  alias S2PdfMaker.PDF.Builders.ImageBuilder
  alias S2PdfMaker.PDF.Builders.FontBuilder
  alias S2PdfMaker.PDF.Builders.PageBuilder
  alias S2PdfMaker.PDF.Builders.PageTreeBuilder
  alias S2PdfMaker.PDF.Builders.CatalogBuilder
  alias S2PdfMaker.PDF.Builders.MetaDataBuilder

  # The way I'm building this looks suspiciously like a GenServer...
  @doc """
  Takes in a PDF.Context and returns a PDF.RenderContext
  """
  def build(%Context{} = context) do
    {_render_context, ^context} =
      {%S2PdfMaker.PDF.RenderContext{}, context}
      |> ImageBuilder.build()
      |> FontBuilder.build()
      |> PageTreeBuilder.build()
      |> PageBuilder.build()
      |> CatalogBuilder.build()
      |> MetaDataBuilder.build()
  end
end
