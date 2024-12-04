defmodule AdventOfCode do
  @aoc_base_url "https://adventofcode.com"

  def fetch_input(day) do
    session = "your_session_cookie"
    url = "#{@aoc_base_url}/2024/day/#{day}/input"

    headers = [
      {"Cookie", "session=#{session}"}
    ]

    case HTTPoison.get(url, headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, body |> String.split("\n")}

      {:ok, %HTTPoison.Response{status_code: status_code}} ->
        {:error, "Failed to fetch input. Status code: #{status_code}"}

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, "HTTP request failed: #{reason}"}
    end
  end

end
