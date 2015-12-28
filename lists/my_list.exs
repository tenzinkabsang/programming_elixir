defmodule MyList do
  def len([]), do: 0

  def len([_head | tail]) do
    1 + len(tail)
  end

  def square([]), do: []
  def square([head | tail]), do: [head * head | square(tail)]

  def map([], _func), do: []
  def map([head | tail], func), do: [func.(head) | map(tail, func)]

  def sum(list), do: _sum(list, 0)
  defp _sum([], total), do: total
  defp _sum([head | tail], total), do: _sum(tail, head + total)

  # Exercise
  def sum1([]), do: 0
  def sum1([head | tail]), do: head + sum1(tail)

  def sum2([]), do: 0
  def sum2([head | []]), do: head
  def sum2([head, head2 | tail]), do: sum2([head + head2 | tail])


  def reduce([], value, _func), do: value
  def reduce([head | tail], value, func), do: reduce(tail, func.(value, head), func)

  # Exercise: ListAndRecursion-1
  def mapsum(list, func),                 do: _mapsum(list, 0, func)
  def _mapsum([], total, _func), do: total
  def _mapsum([head | tail], total, func), do: _mapsum(tail, total + func.(head), func)

  # Exercise: ListAndRecursion-2
  #
  # MyList.max [1, 3, 8, 4, 2] # => 8
  def max(list),                      do: _max(list, 0)
  defp _max([], largest),             do: largest
  defp _max([head | tail], largest) when head > largest, do: _max(tail, head)
  defp _max([head | tail], largest),  do: _max(tail, largest)

  # Exercise: ListsAndRecursion-4
  def span(from, to), do: _span(from, to, [from])
  defp _span(from, to, _acc) when from > to, do: []
  defp _span(from, to, acc) when from == to, do: Enum.reverse(acc)
  defp _span(from, to, acc), do: _span(from + 1, to, [from + 1 | acc])

  # version 2
  def span2(from, to), do: _span2(from, to - from, [])
  defp _span2(from, len, _acc) when len < 0, do: []
  defp _span2(from, 0, acc), do: [from | acc]
  defp _span2(from, len, acc), do: _span2(from, len - 1, [ from + len | acc ])
end

