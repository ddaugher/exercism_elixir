defmodule Bob do
  def hey(input) do
    cond do
        isEmptyString?(input) -> "Fine. Be that way!"
        isQuestion?(input) -> "Sure."
        isUppercaseCharacters?(input) -> "Whoa, chill out!"
        true -> "Whatever."
    end
  end

  def isEmptyString?(s) do
    String.strip(s) == ""
  end

  def isQuestion?(s) do
    String.ends_with?(s, "?")
  end

  def isUppercaseCharacters?(s) do
    isOnlyCharacters?(s) && String.upcase(s) == s
  end

  def isOnlyCharacters?(s) do
    String.match?(s, ~r/[[:alpha:]]+/)
  end
end
