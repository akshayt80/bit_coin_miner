defmodule Client do
    def start_link(server_ip \\ {127,0,0,1}) do
        {:ok, socket} = :gen_tcp.connect(server_ip, 6666, [:binary, {:active, false},{:packet, 0}])
        loop(socket)
    end
    defp loop(socket) do
        ok = socket |> :gen_tcp.send(get_message())
        loop(socket)
    end
    defp get_message() do
        #%{"Hello" => "World"}
        "Hello World!"
    end
end
#Client.start_link()
