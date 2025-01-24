# S2PdfMaker



PDF generation!

ps://github.com/ztmr/erlguten) library has turned into a full rewrite in Elixir.

## Plan



# Usage

```elixir
  # Load image, get alias
  {alpaca_alias, alpaca_rendition} = S2PdfMaker.PDF.Images.load("./test/support/images/alpaca.png")

  {:ok, pid} = S2PdfMaker.start_link
  S2PdfMaker.add_image(pid, alpaca_alias, alpaca_rendition) |>
  S2PdfMaker.begin_text |>
  S2PdfMaker.set_font("Helvetica", 48) |>
  S2PdfMaker.text_position(40, 180) |>
  S2PdfMaker.text_render_mode(:fill) |>
  S2PdfMaker.write_text("ABC") |>
  S2PdfMaker.set_font("Courier", 32) |>
  S2PdfMaker.text_render_mode(:stroke) |>
  S2PdfMaker.write_text("xyz") |>
  S2PdfMaker.end_text |>
  S2PdfMaker.move_to(400, 20) |>
  S2PdfMaker.draw_image(alpaca_alias, %{
      translate_x: 300,
      translate_y: 500,
    }) |>
  S2PdfMaker.export("./tmp/alpaca.pdf") |>
  S2PdfMaker.stop
```

Now open up that file and you should see some text near the bottom and a picture
of what I believe to be an alpaca. Could also be a llama.

By default, coordinates are in units of 1/72 inch as per the PDF
spec. Origin is in lower left corner of the page. This is roughly 1
point in printing terms.

```
  S2PdfMaker.line_width(pid, 0.01)          # very fine line
  |> S2PdfMaker.line({{0, 0}, {500, 500}})  # up and to the right
```
