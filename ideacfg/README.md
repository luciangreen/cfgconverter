# IdeaCFG

**IdeaCFG** is a SWI-Prolog system that converts descriptions of human arts, sciences, humanities, professional disciplines, algorithms and other academic ideas into executable context-free grammars.

## Purpose

IdeaCFG separates:
- **Choices and composition** → represented as CFG/DCG rules
- **Calculation and verification** → represented as deterministic Prolog predicates

This ensures that mathematical operations are never inefficiently enumerated as grammar alternatives.

## Installation

Requires SWI-Prolog 8.0 or later.

```bash
cd ideacfg
swipl ideacfg.pl
```

## First Example

```prolog
?- idea_to_cfg(rectangle,
    'A rectangle consists of a width and a height. Its area is width multiplied by height.',
    Result).
```

Expected output includes:
- Grammar rule: `RECTANGLE → WIDTH HEIGHT`
- Direct predicate: `rectangle_area(Width, Height, Area) :- Area is Width * Height.`

## Conversion Pipeline

```
natural-language or structured idea
        ↓
concept and operation extraction
        ↓
direct Prolog computation layer
        +
CFG or DCG symbolic structure layer
        ↓
executable Prolog program
        ↓
generation, parsing, explanation and testing
```

## Distinction Between CFG and Direct Operations

| Element Type | Representation |
|---|---|
| Structural choices | CFG/DCG |
| Sequences and composition | CFG/DCG |
| Arithmetic calculations | Direct Prolog |
| Comparisons and constraints | Direct Prolog |
| Grammar-selected operations | Hybrid |

## Command Examples

### REPL

```prolog
?- ideacfg.
IdeaCFG> new sonata.
IdeaCFG> add "A sonata has an exposition, development and recapitulation."
IdeaCFG> analyse.
IdeaCFG> show(cfg).
IdeaCFG> show(operations).
IdeaCFG> quit.
```

### CLI

```bash
swipl -q -s ideacfg.pl -- convert --name sonata --input examples/sonata.txt --output generated/sonata
swipl -q -s ideacfg.pl -- show-operations --input examples/economics.txt
swipl -q -s ideacfg.pl -- help
```

## Repository Structure

```
ideacfg/
├── ideacfg.pl          Main entry point
├── pack.pl             SWI-Prolog pack descriptor
├── prolog/             Core modules
├── test/               Test suites
├── examples/           Domain examples
└── generated/          Output directory
```

## Limitations

- Not every academic idea is context-free; the system creates approximations where needed.
- Natural-language understanding may be ambiguous; ambiguities are reported, not silently resolved.
- Generated grammars are not complete theories of their domains.
- Direct calculation does not establish truth of the underlying scholarly theory.
- See LIMITATIONS.md for full details.

## Feature and Implementation Status

Implemented feature areas include text, sentence-list and structured-term
inputs; concept, relation and operation extraction; CFG/DCG construction;
grammar transformations; optimisation; explanation; a REPL; and the
mathematics, science, arts and humanities examples. The module-level references
and examples are indexed in [EXAMPLES.md](EXAMPLES.md).

The CLI currently supports `help`, `convert`, and `show-operations`. CLI
`generate`, `parse`, and `test` are not implemented and return an unsupported
operation status. Several advertised API entry points remain placeholders;
their exact status and limitations are listed in [PROLOG_API.md](PROLOG_API.md)
and [PROGRESS.md](PROGRESS.md).

## Running Tests

Run all 14 plunit test files from the repository root:

```bash
LC_ALL=C.UTF-8 swipl -q -s ideacfg/test/run_tests.pl -g run_tests -t halt
```

Run a focused test file, for example:

```bash
LC_ALL=C.UTF-8 swipl -q -s ideacfg/test/test_cli.pl -g run_tests -t halt
```

For available commands and supported arguments, see [CLI.md](CLI.md).
