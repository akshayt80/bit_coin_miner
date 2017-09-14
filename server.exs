defmodule Server do
    def start_link do
        {:ok, listen_socket} = :gen_tcp.listen(6666,[:binary,
                                                    {:ip, {0,0,0,0}},
                                                    {:packet, 0},
                                                    {:active, false},
                                                    {:reuseaddr, true}])
        loop_acceptor(listen_socket)
    end
    defp loop_acceptor(socket) do
        {:ok, worker} = :gen_tcp.accept(socket)
        spawn fn -> serve(worker) end
        loop_acceptor(socket)
    end
    defp serve(worker) do
        {:ok, data} = :gen_tcp.recv(worker, 0)
        IO.puts "Received message: #{data}"
        :gen_tcp.send(worker, data)
        serve(worker)
    end
end
Server.start_link
