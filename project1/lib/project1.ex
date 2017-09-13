defmodule Project1 do
  @moduledoc """
  Documentation for Project1.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Project1.hello
      :world

  """
  def main(args) do
    {_, [str], _} = OptionParser.parse(args)
    IO.puts is_integer(elem(Integer.parse(str), 0))
  end

  defp parse_args(args) do
    # Covering only expected arguments. We can add code to handle cases when unexpected arguments are passed or help text etc.
    # Checkout OptionParser lib for details. 
    
  end
end
