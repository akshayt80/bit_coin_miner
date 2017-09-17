defmodule Server do
   def start_link(k) do
        IO.puts "Starting server process"
        {:ok, listen_socket} = :gen_tcp.listen(6666,[:binary,
                                                    {:ip, {0,0,0,0}},
                                                    {:packet, 0},
                                                    {:active, false},
                                                    {:reuseaddr, true}])
        parent = self()
        # accepting new connections and receiving tcp messages in separate process
        spawn fn -> loop_acceptor(listen_socket, parent, k) end
        # performing mining in main process
        start_mining(%{}, k, parent)
    end
    defp loop_acceptor(socket, parent, k) do
        {:ok, worker} = :gen_tcp.accept(socket)
        # Send value of k as String
        :gen_tcp.send(worker, Integer.to_string(k))
        # Spawn receive message in separate process
        spawn fn -> serve(worker, parent) end
        # Loop to accept new connection
        loop_acceptor(socket, parent, k)
    end
    defp serve(worker, parent) do
        {:ok, data} = :gen_tcp.recv(worker, 0)
        send(parent, {:good_coin, data})
        serve(worker, parent)
    end
    defp start_mining(map, k, parent) do
        # Spawn the mining process separate
        spawn fn -> BitCoin.mine(k, parent) end
        # updates the map with the new map with accepted values
        map = receive do
            {:good_coin, coin_details} -> coin = String.split(coin_details)
                # Enums are not good to extract elements on a long list
                BitCoin.check_coin_validity(Enum.at(coin, 0), Enum.at(coin, 1), map)
        end
        start_mining(map, k, parent)
    end
end