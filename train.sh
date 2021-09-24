DATA='data-bin/oral-threshold4-size20000'  # input data
ARCH='transformer_tiny'  # model structure
SAVE='checkpoints/transformer.en-de.tiny'  # save dir

tgt='zh'
src='en'

CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7
fairseq-train $DATA --task translation \
      --arch $ARCH --share-decoder-input-output-embed --dropout 0.35 \
      --warmup-updates 150 --lr 0.003 \
      --max-tokens 8196 \
      --max-update 1000 \
      --source-lang $src \
      --target-lang $tgt \
      --save-dir $SAVE \
      --keep-last-epochs 6 \
      --find-unused-parameters --patience 5 \
      --optimizer adam
