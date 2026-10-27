# IdeaCFG CLI Reference

## Usage

```bash
swipl -q -s ideacfg.pl -- COMMAND [OPTIONS]
```

## Commands

### convert

The input file is read as UTF-8 plain text. When `--output` is supplied, the
generated Prolog module is written to `<PATH>.pl`.

```bash
swipl -q -s ideacfg.pl -- convert \
  --name sonata \
  --input sonata.txt \
  --output generated/sonata
```

### show-operations

Extract and print the recognised operations from a UTF-8 text file.

```bash
swipl -q -s ideacfg.pl -- show-operations \
  --input investment.txt
```

### Not yet implemented

The `generate`, `parse`, and `test` CLI commands are reserved but not
implemented. They return exit code `3` (unsupported operation), not success.
The similarly named Prolog API predicates are also incomplete; see
[PROLOG_API.md](PROLOG_API.md).

### help

```bash
swipl -q -s ideacfg.pl -- help
```

## Exit Codes

| Code | Meaning |
|---|---|
| 0 | Success |
| 1 | Invalid input |
| 2 | Unresolved ambiguity |
| 3 | Unsupported operation |
| 4 | Unsafe generated code |
| 5 | Test failure |
| 6 | Resource limit exceeded |
| 7 | Internal error |
