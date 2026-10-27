# IdeaCFG Prolog API

## Conversion

```prolog
idea_to_cfg(+IdeaName, +Input, -Result).
idea_to_cfg(+IdeaName, +Input, +Options, -Result).
```

Input may be an atom (plain text), list of atoms (sentences), or list of structured terms.

## Parsing — Partial

```prolog
idea_parse(+IdeaName, +Tokens, -Tree).
idea_parse(+IdeaName, +Tokens, +Options, -Tree).
```

The API currently requires a model loaded in the current Prolog process.
`idea_load/2` accepts a serialized IR term; generated modules are not a
persisted model format.

## Generation — Partial

```prolog
idea_generate(+IdeaName, -Tokens).
idea_generate(+IdeaName, +Options, -Tokens).
```

## Direct Computation — Not Implemented

```prolog
idea_compute(+IdeaName, +Operation, +Inputs, -Output).
idea_compute(+IdeaName, +Bindings, -Results).
```

The current predicate returns a `computed(IdeaName, Operation, Inputs)` term;
it does not evaluate an operation. The bindings-style example below is planned,
not currently supported:
```prolog
?- idea_compute(compound_interest,
                [principal-1000, rate-0.05, periods-10],
                Result).
```

## Validation — Placeholder

```prolog
idea_validate(+IdeaName, +Tree, -Report).
```

## Explanation — Partial

```prolog
idea_explain(+IdeaName, -Explanation).
idea_explain_rule(+IdeaName, +RuleId, -Explanation).
idea_explain_operation(+IdeaName, +OperationId, -Explanation).
```

## Export — Placeholder

```prolog
idea_export(+IdeaName, +Path).
idea_export(+IdeaName, +Format, +Path).
```

Formats are recognized (`prolog`, `cfg`, `dcg`, `markdown`, `json`), but export
does not yet serialize model content.

## Loading and Unloading

```prolog
idea_load(+Path, -IdeaName).
idea_unload(+IdeaName).
```

## Testing — Placeholder

```prolog
idea_test(+IdeaName, -Report).
```

## Input Forms

```prolog
idea_from_text(+IdeaName, +Text, -Model).
idea_from_sentences(+IdeaName, +Sentences, -Model).
idea_from_terms(+IdeaName, +Terms, -Model).
idea_from_hybrid(+IdeaName, +Text, +Declarations, -Model).
```

## Human Review — Not Implemented

```prolog
accept_rule(+IdeaName, +RuleId).
reject_rule(+IdeaName, +RuleId).
replace_rule(+IdeaName, +RuleId, +Replacement).
```

These review predicates are planned and are not currently exported by the API.

## Running the Tests

From the repository root, run the complete plunit suite with SWI-Prolog 8.0+:

```bash
LC_ALL=C.UTF-8 swipl -q -s ideacfg/test/run_tests.pl -g run_tests -t halt
```

To run one test file, for example:

```bash
LC_ALL=C.UTF-8 swipl -q -s ideacfg/test/test_cli.pl -g run_tests -t halt
```
