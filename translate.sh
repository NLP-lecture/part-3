#!/usr/bin/bash
set -e

model_dir=checkpoints/transformer.en-de.tiny

# set device
gpu=7

# data set
who=test
ensemble=5
batch_size=128
beam=10
src_lang=en
tgt_lang=zh
length_penalty=2.6
data_dir=oral-threshold4-size20000

checkpoint=checkpoint_best.pt

if [ -n "$ensemble" ]; then
        if [ ! -e "$model_dir/last$ensemble.ensemble.pt" ]; then
                PYTHONPATH=`pwd` python3 scripts/average_checkpoints.py --inputs $model_dir --output $model_dir/last$ensemble.ensemble.pt --num-epoch-checkpoints $ensemble
        fi
        checkpoint=last$ensemble.ensemble.pt
fi

output=$model_dir/translation.log

export CUDA_VISIBLE_DEVICES=$gpu

fairseq-generate data-bin/$data_dir \
  -s $src_lang -t $tgt_lang \
  --path $model_dir/$checkpoint \
  --gen-subset $who \
  --batch-size $batch_size \
  --beam $beam \
  --lenpen $length_penalty \
  --remove-bpe > translate.txt

