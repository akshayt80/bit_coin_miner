# Project1
READ ME file for Distributed Operating Systems - Project 1
Date: September 18th September,2017

Group members:

1. Anmol Khanna, UFID:65140549, anmolkhanna93@ufl.edu
2. Akshay Singh Jetawat, UFID:22163183 ,

# Introduction

- The project uses elixir and the actor worker model to generate bitcoins.

- The bitcoins are mined using the SHA-256 algorithm and the input string with the corresponding SHA-256 hash is printed.

- The project is implemented as a distributed system where the address of the address of the server is passed as an argument and then the server performs the mine operation.

- The performace of the system is measured using the ratio of the CPU time to Real time as a metric and we have discussed the performance for k=4 and k=5.

# Implementation Details

- Work Unit :
For generating the strings, we have used the random string function with a length of 64 bytes. We used the 64 byte because it will give us a higher probability of getting the bitcoins. In our actor worker model, we have designed the system in such a way that for each iteration the workers are assigned a specific task from the actor and this process continues as the workers start to complete their assigned tasks and it goes on untill the required number of bitcoins are generated.

- The test result for K=4 :

- Result for K = 5 :

Ratio of CPU time to Real time in this case is = (user + sys) / real = 

- From our distributed bitcoin miner system, we were able to mine a bitcoin with leading zero's counting to 7. i.e. for k = 7 we were able to mine a bitcoin.

- We were able to run our code with 4 machines each having four cores and getting the CPU utilization of atleast 350%.

# Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `project1` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:project1, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/project1](https://hexdocs.pm/project1).

