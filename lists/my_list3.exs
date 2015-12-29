defmodule MyList3 do

  def len(list),                     do: _len(list, 0)
  defp _len([], count),              do: count
  defp _len([ _ | tail ], count), do: _len(tail, count + 1)

  def square(list),   do: _square(list, [])
  defp _square([], acc), do: Enum.reverse(acc)
  defp _square([ head | tail ], acc), do: _square(tail, [ head * head | acc ])

  def map(list, func), do: _map(list, func, [])
  defp _map([], _, acc), do: Enum.reverse(acc)
  defp _map([ head | tail ], func, acc), do: _map(tail, func, [ func.(head) | acc ])
  
  def sum(list), do: _sum(list, 0)
  defp _sum([], total), do: total
  defp _sum([ head | tail ], total), do: _sum(tail, head + total)

  def sum1([]), do: 0
  def sum1([ head | [] ]), do: head
  def sum1([ h1 , h2 | tail ]), do: sum1([ h1 + h2 | tail ])

  def reduce([], value, _), do: value
  def reduce([ head | tail], value, func), do: reduce(tail, func.(value, head), func)

  def mapsum(list, func), do: _mapsum(list, func, 0)
  defp _mapsum([], _, result), do: result
  defp _mapsum([ head | tail ], func, result), do: _mapsum(tail, func, result + func.(head))

  def max(list), do: _max(list, 0)
  defp _max([], largest), do: largest
  defp _max([ head | tail ], largest) when head > largest, do: _max(tail, head)
  defp _max([ head | tail ], largest), do: _max(tail, largest)

end
