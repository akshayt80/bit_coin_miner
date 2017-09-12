defmodule BitCoin do
    def mine(k \\ 3) do
        prefix = String.duplicate("0", k)
        random_string = generate_string()
        coin_hash = generate_hash(random_string)
        #IO.puts "Received sha256: " <> coin_hash <> prefix
        case valid_coin(coin_hash, prefix) do
            true -> IO.puts "Bit Coin Found: " <> random_string <> " " <> coin_hash
            false -> "Bit coin not found"
        end
        mine(k)
    end
    defp generate_string(length \\ 23) do
        random_str = :crypto.strong_rand_bytes(length) |> Base.encode64 |> binary_part(0, length)
        #IO.puts "Random string: " <> random_str
        "22163183;" <> random_str
    end

    defp generate_hash(random_str) do
        str_hash = :crypto.hash(:sha256, random_str) |> Base.encode16 |> String.downcase
        #IO.puts "Generated hash: " <> str_hash
        str_hash
    end
    # Returns true if the prefix is the start of the coin hash else false
    defp valid_coin(coin_hash, prefix) do
        String.starts_with? coin_hash, prefix
    end
end
BitCoin.mine()
