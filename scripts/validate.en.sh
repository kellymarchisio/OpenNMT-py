#!/bin/bash
# Adapted from Marian v1.5 wmt2017-transformer example.
mosesdecoder=/home/pkoehn/moses

cat $1 \
    | sed 's/\@\@ //g' \
    | $mosesdecoder/scripts/recaser/detruecase.perl 2>/dev/null \
    | $mosesdecoder/scripts/tokenizer/detokenizer.perl -l en 2>/dev/null \
    | $mosesdecoder/scripts/generic/multi-bleu-detok.perl $2 \
    | sed -r 's/BLEU = ([0-9.]+),.*/\1/'
