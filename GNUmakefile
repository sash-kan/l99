# simple makefile from eunitinpractice.pdf
ERLC_FLAGS=
SOURCES=$(wildcard src/*.erl)
HEADERS=$(wildcard src/*.hrl)
OBJECTS=$(SOURCES:src/%.erl=ebin/%.beam)
NOTESTS=$(filter-out %_tests.beam,$(OBJECTS))

all: ebin $(OBJECTS) test

notest: ebin $(OBJECTS)

notests: ebin $(NOTESTS)

ebin:
	mkdir $@

ebin/%.beam : src/%.erl $(HEADERS) GNUmakefile
	erlc $(ERLC_FLAGS) -o ebin/ $<

test:
	erl -noshell -pa ebin \
-eval 'eunit:test("ebin",[verbose])' \
-s init stop

clean:
	-rm $(OBJECTS)
