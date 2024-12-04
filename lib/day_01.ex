defmodule Day01 do
  def run() do
    session = "your_session_cookie"

    case AdventOfCode.fetch_input(1, session) do
      {:ok, input} ->
        input
        |> parse_input()
        |> calculate_differences()

      {:error, reason} ->
        IO.puts(reason)
    end

  end

  defp parse_input(input) do
    input
    |> Enum.reject(&String.trim(&1) == "")
    |> Stream.map(&parse_line/1)
    |> Enum.to_list()
  end

  defp parse_line(line) do
    line
    |> String.split(~r{\s}, trim: true)
    |> Enum.map(&String.to_integer/1)
    |> List.to_tuple()
  end

  defp calculate_differences(pairs) do
    {left, right} = Enum.unzip(pairs)

    left
    |> Enum.sort()
    |> Enum.zip(Enum.sort(right))
    |> Enum.map(fn {l, r} -> abs(l - r) end)
    |> Enum.sum()
  end
end
