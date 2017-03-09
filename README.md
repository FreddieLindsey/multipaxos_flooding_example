Frederick Lindsey (fl1414) and Cyrus Vahidi (cv114)

# Distributed Algorithms Coursework 2

## Running the systems

All systems run on the local machine. There are three configurations, `system.0`, `system.1`, and `system.2`. `system.0` has the default configuration as specified in the exercise.

To run any system, run the following:

```bash
$ make system.{x}
```

Clearly, you should replace `{x}` above with whichever system number you wish to run.

# Systems

Representative logs for each system are available such that `system.0`'s log can be found at `system.0.log`

## System.0

##### Configuration: 5 servers, 3 clients, 10 accounts, 1 second

The default configuration expects to transact 1000-2000 times per second (after flushing).

## System.1

##### Configuration: 50 servers, 3 clients, 10 accounts, 1 second

This configuration intends to show the slow down of the system as more machines are added and consensus takes much longer to be achieved. By having so many servers, there is a huge increase in the number of messages that must pass before consensus is achieved also. Importantly, what this configuration explicitly shows is how performance is dependent on the ability of any local system to context switch and how important the network is in determining performance.

## System.2

##### Configuration: 1 servers, 500 clients, 10 accounts, 1 second

Here, the configuration is used to flood the one server with messages to determine how flooding affects consensus. Consensus is trivially achieved as there is only one acceptor in the system. Any performance degradation can therefore be attributed to the flooding of replicas and other components such that the system is unable to process messages received effectively.
