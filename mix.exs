defmodule S2PdfMaker.Mixfile do
  use Mix.Project

  def project do
    [
      app: :s2_pdf_maker,
      name: "S2PdfMaker",
      version: "0.1.01",
      source_url: "https://github.com/JPSightSource/S2PdfMaker.git",
      elixir: "~> 1.18",
      deps: deps(),
      description: description(),
      package: package()
    ]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [
      {:imagineer, "~> 0.3"},
      {:ex_doc, "~> 0.19", only: :dev},
      {:apex, "~>1.0"}
    ]
  end

  defp description do
    """
    PDF Generation in Elixir
    """
  end

  defp package do
    [
      licenses: ["MIT"],
      links: %{github: "https://github.com/JPSightSource/S2PdfMaker.git"},
      contributors: ["Chris Maddox",  "James Parker"]    ]
  end
end
