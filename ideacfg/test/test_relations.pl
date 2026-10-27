%% test_relations.pl — Tests for relation extraction.
:- use_module(library(plunit)).
:- use_module('../prolog/ideacfg_relations').
:- use_module('../prolog/ideacfg_ir').
:- use_module('../prolog/ideacfg_input').

:- begin_tests(relation_extraction).

test(extract_sequence_from_contains) :-
    idea_from_sentences(rel_test1, ['An experiment contains a hypothesis, method and conclusion.'], IR),
    extract_relations(rel_test1, IR, Rels),
    member(sequence(_, Members, _, _), Rels),
    length(Members, N),
    N >= 2.

test(extract_alternatives_from_may_be) :-
    idea_from_sentences(test, ['A proof may be induction or contradiction.'], IR),
    extract_relations(test, IR, Rels),
    member(alternative(_, Members, [], _), Rels),
    length(Members, N),
    N >= 2.

test(extract_optional_from_may_include) :-
    idea_from_sentences(test, ['A report may include appendix.'], IR),
    extract_relations(test, IR, Rels),
    member(optional(_, appendix, [], _), Rels).

test(extract_repetition_from_one_or_more) :-
    idea_from_sentences(test, ['A body contains one or more arguments.'], IR),
    extract_relations(test, IR, Rels),
    member(repetition(_, arguments, 1, unbounded, [], _), Rels).

test(extract_sequences_list) :-
    idea_from_terms(seq_test, [sequence(body, [intro, main, conclusion], [], src)], IR),
    extract_sequences(IR, Seqs),
    Seqs = [sequence(body, [intro, main, conclusion], [], src)].

test(extract_sequence_from_has) :-
    idea_from_sentences(sonata_test,
        ['A sonata has an exposition, development and recapitulation.'], IR),
    extract_relations(sonata_test, IR, Rels),
    member(sequence(_, Members, _, _), Rels),
    Members = [exposition, development, recapitulation].

:- end_tests(relation_extraction).
