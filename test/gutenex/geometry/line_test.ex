defmodule Gutenex.Geometry.LineTest do
  use ExUnit.Case, async: true
  alias Gutenex.Geometry.Line

  test "#line should move to the start point and draw to the end" do
    assert Line.line({20, 30}, {60, 90}) == '20 30 m 60 90 l S\n'
  end

  test "#line should work with floats and all points passed in" do
    assert Line.line(20.798231, 30.7213, 60.1233, 90.678123) ==
           '20.80 30.72 m 60.12 90.68 l S\n'
  end

  test "#lines returns a list of lines" do
    lines = Line.lines([{{10, 20}, {30, 40}}, {{50, 60}, {70, 80}}, {{90, 100}, {110, 120}}])
    assert lines == [
      '10 20 m 30 40 l S\n',
      '50 60 m 70 80 l S\n',
      '90 100 m 110 120 l S\n'
    ]
  end
end
