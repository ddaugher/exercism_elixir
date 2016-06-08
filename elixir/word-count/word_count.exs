defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do

    sentence
    |> String.split(" ")
    |> count_words

  end

  defp count_words(list) do

    eval = fn(word, map) ->
      Map.put(map, word, (map[word] || 0) + 1)
    end

    list |> Enum.reduce(%{}, eval)
  end

end
