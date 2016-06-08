defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    eval = fn(word, map) ->
      Map.put(map, word, (map[word] || 0) + 1)
    end

    sentence
    |> downcase
    |> ignore_special_chars
    |> ignore_underscores
    |> ignore_commas
    |> String.split
    |> Enum.reduce(%{}, eval)
  end

  defp ignore_special_chars(sentence) do
    sentence |> String.replace(~r/[:!&@$%^&]/, "")
  end

  defp downcase(sentence) do
    sentence |> String.downcase
  end

  defp ignore_commas(sentence) do
    sentence |> String.replace(~r/[,]/, "")
  end

  defp ignore_underscores(sentence) do
    sentence |> String.replace(~r/[_]/, " ")
  end

end
