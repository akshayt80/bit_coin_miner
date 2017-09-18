defmodule Project1 do
  def main(args) do
    {_, [str], _} = OptionParser.parse(args)
    # Using number of cores to spawn mining processes and multiplying 3 to make
    # sure if any process dies due to any reason we have other process to take its place
    cores = System.schedulers_online * 3
    # Port on which tcp communication will hapen
    port = 6666
    if valid_ip(str) do
      server_ip = parse_ip(str)
      Client.start_link(server_ip, cores, port)
    else
      # k is number of leading 0s
      k = elem(Integer.parse(str), 0)
      Server.start_link(k, cores, port)
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
