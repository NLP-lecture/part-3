DATA='data-bin/multi30k'  # input data
ARCH='transformer_tiny'  # model structure
SAVE='checkpoints/transformer.en-fr.tiny'  # save dir

tgt='fr'
src='en'

CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7
fairseq-train $DATA --task translation \
      --arch $ARCH --share-all-embeddings --dropout 0.35 \
      --warmup-updates 150 --lr 0.006 \
      --max-tokens 8196 \
      --max-update 1000 \
      --source-lang $src \
      --target-lang $tgt \
      --save-dir $SAVE \
      --keep-last-epochs 6 \
      --find-unused-parameters --patience 5 \
      --optimizer adam
