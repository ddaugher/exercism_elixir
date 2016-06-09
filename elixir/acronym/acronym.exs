defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(string) :: String.t()
  def abbreviate(string) do

    string
    |> String.split
    |> acronym

  end

  # defp acronym(list) do
  #   # stripFirst = fn(x, acc) -> acc + String.first(x) end
  #
  #   Enum.reduce(list, "", fn(x, acc) -> Enum.join(x, acc)  end)
  #
  # end

  defp acronym(words) do
    stripFirst = fn(x) -> String.first(x) end

    #Enum.map(words, &String.first/1)
    Enum.map(words, stripFirst)
    |> Enum.join
    |> String.upcase
  end

end
