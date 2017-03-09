# Frederick Lindsey (fl1414) and Cyrus Vahidi (cv114)

SRC_DIR = multipaxos
BEAM_DIR = multipaxos/ebin
MODULES = $(patsubst %.erl,%,$(shell ls $(SRC_DIR)/*.erl))

ERLC = erlc -o $(BEAM_DIR)
ERL = erl -noshell -pa $(BEAM_DIR) -setcookie pass

# ------------------------------------------------------------------------------

all: part_1 part_2

part_2: erl

erl: ebin ${MODULES:%=%.beam}

ebin:
	@mkdir -p $(BEAM_DIR)

%.beam: %.erl
	$(ERLC) $?

clean:
	$(RM) -r $(BEAM_DIR)

.PHONY: all clean part_1 part_2 erl

# ------------------------------------------------------------------------------

system.0: part_2
	$(ERL) -s system_0 start

system.1: part_2
	$(ERL) -s system_1 start

system.2: part_2
	$(ERL) -s system_2 start
