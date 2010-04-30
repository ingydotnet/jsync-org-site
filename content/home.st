^^ JavaScript and YAML Notation Coding

JSYNC is a simple data serialization language. It takes all the simplicity of "JSON"<http://www.json.org/> and combines it with the completeness of "YAML"<http://www.yaml.org>. This allows for _full data graph serialization._ The result is the ability serialize data in a language that is simple and familiar, while reusing the existing and ubiquitous set of JSON implementations.

^^^ Why JSON is Great!

# JSON is a very simple subset of JavaScript data syntax.
# There are existing JSON implementations in nearly every programming language in use today.
# JSON is very easy to implement.

JSON was a huge win for programming. It defined a very simple language and within a few months had solid implementations in several key languages. Today it is the ubiquitous encoding for transferring simple data.

JSON falls short because it can only serialize a strict (albeit highly useful) subset of data graphs. Namely: _string-keyed-mappings, sequences, strings, numbers, boolean_ and _null_ values. It cannot handle types, references and complex keys.

^^^ Why YAML is Great!

# YAML uses the same data model as JSON.
# YAML adds three things that are not present in JSON:
** Node Types
** Node Addresses and References
** Complex Mapping Keys
# With these additions, YAML can serialize any data graph.

Nearly a decade of diligence has been put into the YAML specification. It gets node typing, addressing and referencing right. It has stood the test of time. (YAML is also well known for catering to human readability, but that aspect of it is not leveraged by JSYNC.)

YAML falls short because it is very complex, and thus, very difficult to implement. (YAML was started in 2001, JSON in 2005, yet JSON dwarves YAML in stable implementations.)

^^^ Why JSYNC will be Great!!!

# JSYNC _*is*_ JSON.
** It starts with an enormous, stable code base for parsing and emitting.
# JSYNC _*adds*_ YAML (_the good parts_).
** It takes well defined typing and reference syntax, verbatim from the YAML spec.
# JSYNC _*becomes*_ a minimal, yet complete, data serialization language.
** Q.E.D.

By taking the best aspects of both JSON and YAML, JSYNC is in a clear win/win/win situation for completeness, robustness, and usability.

----

Here is a simple example of a JSYNC encoding:

.pre
[
    "!records",
    {
        "!": "record",
        "game": {
            "!": "game",
            "&": "001",
            "date": "!!date March 2, 1962",
            "versus": "New York"
        },
        "notes": ".!!! Awesome !!!",
        "number": 100,
        "player": {
            "!": "player",
            "&": "002",
            "name": "Wilt Chamberlain",
            "team": "Philadelphia"
        },
        "record": "Most points single game"
    },
    {
        "!": "record",
        "game": "*001",
        "notes": ".... add note here ...",
        "number": 59,
        "player": "*002",
        "record": "Most points, one half"
    }
]
.pre

The JSYNC encoded data structure above, is equivalent to the YAML encoded data structure below.

.pre
--- !records
- !record
  game: !game &001
    date: !!date March 2, 1962
    versus: New York
  notes: '!!! Awesome !!!'
  number: 100
  player: !player &002
    name: Wilt Chamberlain
    team: Philadelphia
  record: Most points single game
- !record
  game: *001
  notes: ... add note here ...
  number: 59
  player: *002
  record: Most points, one half
.pre

There is no way to encode this data structure in pure/standard JSON. You can, of course, build a scheme on top of JSON to represent everything. In fact, that's exactly what JSYNC does, and in the simplest and most standard way possible.

----

Copyright © 2010 Ingy döt Net

This document may be freely copied provided it is not modified.
