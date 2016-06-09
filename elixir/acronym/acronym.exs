defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(string) :: String.t()
  def abbreviate(string) do
    string
    |> insert_space_at_cap
    |> ignore_commas
    |> String.split
    |> acronym
  end

  defp acronym(words) do
    stripFirst = fn(x) -> String.first(x) end

    Enum.map(words, stripFirst)
    |> Enum.join
    |> String.upcase
  end

  defp insert_space_at_cap(string) do
    String.replace(string, ~r/([[:upper:]])/, " \\1")
  end

  defp ignore_commas(sentence) do
    sentence |> String.replace(~r/[,]/, "")
  end

end
