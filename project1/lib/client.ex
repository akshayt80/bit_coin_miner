defmodule Client do

    def start_link(server_ip, cores, port) do
        IO.puts "Starting client process"
        # Connect to server
        {:ok, socket} = :gen_tcp.connect(server_ip, port, [:binary, {:active, false},{:packet, 0}])
        # Receive k value from server
        {:ok, data} = :gen_tcp.recv(socket, 0)
        IO.puts "Received from server k=#{data}"
        parent = self()
        k = elem(Integer.parse(data), 0)
        start_mining(socket, k, parent, cores)
    end

    defp send_coin(server, data) do
        server |> :gen_tcp.send(data)
    end

    defp start_mining(server, k, parent, cores) do
        # Spawn the mining processes separately
        for n <- 1..cores, do: spawn fn -> BitCoin.mine(k, parent) end
        listener(server)
    end

    defp listener(server) do
        # send coins over tcp after we receive any valid coin from some process
        receive do
            {:good_coin, coin_details} -> send_coin(server, coin_details)
        end
        listener(server)
    end
end
