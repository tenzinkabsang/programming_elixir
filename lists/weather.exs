defmodule WeatherHistory do
  def for_location_27([]), do: []
  def for_location_27([[time, 27, temp, rain] | tail]) do
    [[time, 27, temp, rain] | for_location_27(tail)]
  end
  def for_location_27([ _ | tail]), do: for_location_27(tail)


  def for_location([], _target), do: []
  def for_location([ head = [ _, target, _, _ ] | tail ], target) do
    [ head | for_location(tail, target) ]
  end
  def for_location([_ | tail], target), do: for_location(tail, target)


  def data do
    [
      [11111111, 26, 11, 0.111],
      [22222222, 27, 22, 0.222],
      [33333333, 28, 33, 0.333],
      [44444444, 27, 44, 0.444],
      [55555555, 29, 55, 0.555]
    ]
  end
end
