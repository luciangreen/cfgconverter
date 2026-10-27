# IdeaCFG

IdeaCFG converts plain-text and structured descriptions into context-free
grammar (CFG/DCG) models, with separate extraction for mathematical operations.
The implementation is a SWI-Prolog project in [`ideacfg/`](ideacfg/).

## Get Started

Requires SWI-Prolog 8.0 or later.

```bash
cd ideacfg
swipl ideacfg.pl
```

See the [IdeaCFG guide](ideacfg/README.md) for supported features, the
[CLI reference](ideacfg/CLI.md), [Prolog API status](ideacfg/PROLOG_API.md),
[examples](ideacfg/EXAMPLES.md), and
[remaining implementation work](ideacfg/PROGRESS.md).

## Run Tests

From the repository root:

```bash
LC_ALL=C.UTF-8 swipl -q -s ideacfg/test/run_tests.pl -g run_tests -t halt
```
