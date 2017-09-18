# Project1
READ ME file for Distributed Operating Systems - Project 1
Date: September 18th September,2017

Group members:

1. Anmol Khanna, UFID:65140549, anmolkhanna93@ufl.edu
2. Akshay Singh Jetawat, UFID:22163183 akshayt80@ufl.edu,

# Introduction

- The project uses elixir and the actor worker model to generate bitcoins.

- The bitcoins are mined using the SHA-256 algorithm and the input string with the corresponding SHA-256 hash is printed.

- The project is implemented as a distributed system where the address of the address of the server is passed as an argument and then the server performs the mine operation.

- The performace of the system is measured using the ratio of the CPU time to Real time as a metric and we have discussed the performance for k=4 and k=5.

# Implementation Details

- Work Unit :
For generating the strings, we have used the random string function with a length of 64 bytes. We used the 64 byte because it will give us a higher probability of getting the bitcoins. In our actor worker model, we have designed the system in such a way that for each iteration the workers are assigned a specific task from the actor and this process continues as the workers start to complete their assigned tasks and it goes on untill the required number of bitcoins are generated.

- The test result for K=4 :
Starting server process
22163183;mIWvyFPQfAM9u3EOSuqbVCO    000065f77616178217f98e076b8e04de8dcc955635bfc27947902d2d26704ebb
22163183;aTRabYAVaAFfWBBAPYzSOrf    0000d94ac8f2b1cc29569333cce8dec41503abaee7f5a66656fc1470d73ae184
22163183;MI8SYsCUk5p9heRql5N/QY5    0000af71403ac78cf52eb6aeac9452ee8c31c1ea2aeccc2605cf9d9e422e387c
22163183;cQlFO0QjopGtHElvZYPnyqX    00001e8e6da5292a94de301b9b465902d53f0926bee0b0625db2a9e942a8690e
22163183;FHWh9RZ+H9Wz1n1hpYzp2A+    0000aaae4302fc9f0cb67d889bab79fd99f6b3631b4e2af551499f55f9571556
^C

- Result for K = 5 on a 2 core machine with Intel® Pentium(R) CPU B950 @ 2.10GHz processor:
Starting server process
22163183;aTIKRy7Ny9MN9A7Va2n/gTv    000001ac3b0e006ad28787b7262cc378b101fb7e0fa6e124a88dbbc47a2c5ce7
22163183;YOFmOAYP7mSsy6LMHdLFlAl    0000086a6299122dda28abb106ea65d47c5f77f4cb5e37c11014edf3fce74216
22163183;UnwtB/rVZ3IODiTuYMKa0Gr    00000e104caf58e7d6c183777bbdd2ceb1e95bba1b0a4f504b78d4a4844b4cf8
22163183;KTX+poti2mbNba291UgTi9a    00000e92b97e3447caf9dedd8266fd3b5222a503c4e9042535a0ce306dbffe37
22163183;UBaoUpskdRh7Ejci6yNs2gx    0000002a7fd982e707b5c4d4d269324513cc97a0dcc331e23970797df5459556
^C

real    0m42.799s
user    1m17.324s
sys     0m0.324s


Ratio of CPU time to Real time in this case is = (user + sys) / real = 

- From our distributed bitcoin miner system, we were able to mine a bitcoin with leading zero's counting to 7. i.e. for k = 7 we were able to mine a bitcoin.
22163183;sNNl2957gQUuzNOhvjVylgb        00000008547d730ea4cc1d7166acf2111dbb43d8ac45fca2e61a5307470ea672

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

