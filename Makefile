SRC_DIR = multipaxos
BEAM_DIR = multipaxos/ebin
MODULES = $(patsubst %.erl,%,$(shell ls $(SRC_DIR)/*.erl))

ERLC = erlc -o $(BEAM_DIR)
ERL = erl -noshell -pa $(BEAM_DIR) -setcookie pass

# ------------------------------------------------------------------------------

all: part_1 part_2

part_1:
	latexmk -pdf part_1.tex

part_2: erl

erl: ebin ${MODULES:%=%.beam}

ebin:
	@mkdir -p $(BEAM_DIR)

%.beam: %.erl
	$(ERLC) $?

clean:
	latexmk -C
	$(RM) *.bbl **/*.bbl *.run.xml **/*.run.xml
	$(RM) -r $(BEAM_DIR)

.PHONY: all clean part_1 part_2 erl

# ------------------------------------------------------------------------------

system.0: part_2
	$(ERL) -s system_0 start

system.1: part_2
	$(ERL) -s system_1 start

system.2: part_2
	$(ERL) -s system_2 start
