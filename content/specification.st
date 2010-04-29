^ JSYNC Specification

There are three things to remember about JSYNC:

# All JSYNC encodings are also valid "JSON"<http://www.json.org> encodings (although they do not necessarily mean the same thing).  This means that any JSON parser implementation can be used to parse any JSYNC stream.
# All JSON encodings are also valid JSYNC encodings (although they do not necessarily mean the same thing).
# JSYNC adds type additional type information (using '!') and reference information (using '&' and '*').

The following JSYNC concepts are shown by first showing a YAML encoding and then showing the same encoding using JSYNC.

^^ A Typed Mapping

A type is added to a mapping by adding a key/value pair where the key is the string "!" and the value is the YAML tag. This will look natural to people familiar with YAML, where tags always start Since "!" is the first printable, non-space character in the unicode sequence, it will always be emitted first by JSON encoders that sort their keys.

.pre
--- !soldier
name: Pyle
rank: Private
...

{
    "!":"soldier",
    "name":"Pyle",
    "rank":"Private"
}
.pre

^^ A Typed Sequence

A type is added to sequence by adding a string beginning with a '!' to the start of the sequence.

.pre
--- !grocery-list
- bread
- milk
- eggs
...

[
    "!grocery-list",
    "bread",
    "milk",
    "eggs"
]
.pre
