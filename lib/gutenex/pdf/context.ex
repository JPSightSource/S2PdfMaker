defmodule S2PdfMaker.PDF.Context do
  alias S2PdfMaker.PDF.Page

  defstruct(
    meta_data: %{
      creator: "Elixir",
      creation_date: :calendar.local_time(),
      producer: "S2PdfMaker",
      author: "",
      title: "",
      subject: "",
      keywords: ""
    },
    images: %{},
    fonts: S2PdfMaker.PDF.Font.standard_fonts(),
    templates: [nil],
    template_aliases: %{},
    pages: [],
    scripts: [],
    convert_mode: "utf8_to_latin2",
    current_page: 1,
    media_box: Page.page_size(:letter),
    generation_number: 0
  )
end
