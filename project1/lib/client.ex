defmodule Client do

    def start_link(server_ip, port \\ 6666) do
        IO.puts "Starting client process"
        # Connect to server
        {:ok, socket} = :gen_tcp.connect(server_ip, port, [:binary, {:active, false},{:packet, 0}])
        # Receive k value from server
        {:ok, data} = :gen_tcp.recv(socket, 0)
        parent = self()
        k = elem(Integer.parse(data), 0)
        start_mining(socket, k, parent)
    end

    defp send_coin(server, data) do
        ok = server |> :gen_tcp.send(data)
    end

    defp start_mining(server, k, parent) do
        # Spawn the mining process separate
        spawn fn -> BitCoin.mine(k, parent) end
        receive do
            {:good_coin, coin_details} -> send_coin(server, coin_details)
        end
        start_mining(server, k, parent)
    end

end
