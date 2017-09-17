defmodule BitCoin do
    def start_mining(map, parent, k \\ 3) do
        #parent = self()
        # Spawns the function which mines the bit coin
        spawn fn -> mine(k, parent) end
        # receiving message from child
        map = receive do
            {:good_coin, coin_details} -> coin = String.split(coin_details)
                check_coin_validity(Enum.at(coin, 0), Enum.at(coin, 1), map)
        end
        start_mining(map, k)
    end
    def mine(k, parent) do
        prefix = String.duplicate("0", k)
        random_string = generate_string()
        coin_hash = generate_hash(random_string)
        if valid_coin(coin_hash, prefix) do
            # send message to parent process
            send(parent, {:good_coin, "#{random_string} #{coin_hash}"})
        end
        mine(k, parent) #{}"Bit coin not found"
    end
    # Checks the validity of coin and adding new coin to map
    def check_coin_validity(coin_str, coin_hash, map) do
        if Map.has_key?(map, coin_str) do
            map
        else
            IO.puts "Bit coin: #{coin_str} #{coin_hash}"
            Map.put(map, coin_str, coin_hash)
        end
    end
    defp generate_string(length \\ 23) do
        random_str = :crypto.strong_rand_bytes(length) |> Base.encode64 |> binary_part(0, length)
        "22163183;" <> random_str
    end

    defp generate_hash(random_str) do
        str_hash = :crypto.hash(:sha256, random_str) |> Base.encode16 |> String.downcase
        str_hash
    end
    # Returns true if the prefix is the start of the coin hash else false
    defp valid_coin(coin_hash, prefix) do
        String.starts_with? coin_hash, prefix
    end
end
#BitCoin.start_mining(%{}, 3)
