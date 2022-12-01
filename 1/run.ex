calories = input
  |> Kino.Input.read
  |> String.split("\n")
  |> Enum.chunk_by(&(&1 == ""))
  |> Enum.filter(&(Enum.count(&1) >= 1 && hd(&1) != ""))
  |> Enum.map(fn(val) ->
    Enum.map(val, &String.to_integer(&1))
  end)
  |> Enum.map(&Enum.sum(&1))

top_calories = Enum.max(calories)

top_three_calories = calories
  |> Enum.sort(&(&1 >= &2))
  |> Enum.take(3)
  |> Enum.sum()

IO.inspect(top_calories)
IO.inspect(top_three_calories)
