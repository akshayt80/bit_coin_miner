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
    if valid_ip(str) do
      server_ip = parse_ip(str)
      Client.start_link(server_ip)
    else
      # k is number of leading 0s
      k = elem(Integer.parse(str), 0)
      Server.start_link(k)
    end
  end

  defp valid_ip(str) do
    str =~ "."
  end

  defp parse_ip(str) do
    # convert input string 127.0.0.1 to tuple of integers like {127, 0, 0, 1}
    [a, b, c, d] = String.split(str, ".")
    {String.to_integer(a), String.to_integer(b), String.to_integer(c), String.to_integer(d)}
  end

end
