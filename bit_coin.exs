length = 23
random_str = :crypto.strong_rand_bytes(length) |> Base.encode64 |> binary_part(0, length)
IO.puts "Random string: " <> random_str
str_hash = :crypto.hash(:sha256, "22163183 " <> random_str) |> Base.encode16 |> String.downcase 
IO.puts "Generated hash: " <> str_hash