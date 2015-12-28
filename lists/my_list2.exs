defmodule MyList2 do

  def len(list),                     do: _len(list, 0)
  defp _len([], count),              do: count
  defp _len([ head | tail ], count), do: _len(tail, count + 1)


  def square(list),                   do: _square(list, [])
  defp _square([], acc),              do: Enum.reverse(acc)
  defp _square([ head | tail ], acc), do: _square(tail, [ head * head | acc ])

  def add_1(list),                   do: _add_1(list, [])
  defp _add_1([], acc),              do: Enum.reverse(acc)
  defp _add_1([ head | tail ], acc), do: _add_1(tail, [ head + 1 | acc ])

  def map(list, func),                   do: _map(list, func, [])
  defp _map([], _, acc),                 do: Enum.reverse(acc)
  defp _map([ head | tail ], func, acc), do: _map(tail, func, [ func.(head) | acc ])

  def sum(list),                      do: _sum(list, 0)
  defp _sum([], result),              do: result
  defp _sum([ head | tail ], result), do: _sum(tail, head + result)

  def sum1([]),              do: 0
  def sum1([ head | tail ]), do: head + sum1(tail)

  def sum2([]),                do: 0
  def sum2([ head | [] ]),     do: head
  def sum2([ h1, h2 | tail ]), do: sum2([ h1 + h2 | tail ])

  def mapsum(list, func),                      do: _mapsum(list, func, 0)
  defp _mapsum([], _, result),                 do: result
  defp _mapsum([ head | tail ], func, result), do: _mapsum(tail, func, func.(head) + result)

  def max(list),                                           do: _max(list, 0)
  defp _max([], largest),                                  do: largest
  defp _max([ head | tail ], largest) when head > largest, do: _max(tail, head)
  defp _max([ head | tail ], largest),                     do: _max(tail, largest)

  def swap(list),                   do: _swap(list, [])
  defp _swap([], acc),              do: Enum.reverse acc
  defp _swap([ a, b | tail ], acc), do: _swap(tail, [ a, b | acc ])
  defp _swap([ _ ], _),             do: raise "Can't swap a list with an odd number of elements"

  def for_location([], target), do: []
  def for_location([ head = [_, target, _, _] | tail ], target) do
    [ head | for_location(tail, target) ]
  end
  def for_location([ _ | tail], target), do: for_location(tail, target)

  # Tail-Call Optimization
  def for_location1(list, target), do: _for_location1(list, target, [])
  defp _for_location1([], _target, acc), do: Enum.reverse(acc)
  defp _for_location1([ head = [_, target, _, _] | tail ], target, acc) do
    _for_location1(tail, target, [ head | acc ])
  end
  defp _for_location1([ _ | tail ], target, acc), do: _for_location1(tail, target, acc)

  def test_data do
    [
      [11111111, 26, 11, 0.111],
      [22222222, 27, 22, 0.222],
      [33333333, 28, 33, 0.333],
      [44444444, 27, 44, 0.444],
      [55555555, 29, 55, 0.555]
    ]
  end

  def find_customer(name), do: _find_customer(_customers, name, [])
  defp _find_customer([], _, acc), do: Enum.reverse(acc)
  defp _find_customer([ head = %{name: name, age: _} | tail ], name, acc), do: _find_customer(tail, name, [ head | acc ])
  defp _find_customer([ _ | tail ], name, acc), do: _find_customer(tail, name, acc)

  defp _customers do
    [
      %{name: "Bob", age: 12},
      %{name: "Mikey", age: 20},
      %{name: "Bob", age: 22}
    ]
  end

end
