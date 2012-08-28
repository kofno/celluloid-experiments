# RCP Server

A basic (and dangerous) rcp server. Evaluates strings that come from a tcp client (say, telnet) and evals them in Ruby. Handles multiple connections by initializing an actor for each connection. No supervision is implemented.
