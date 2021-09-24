src=en
tgt=fr
TEXT=../translation_data/multi30k
fairseq-preprocess --source-lang $src --target-lang $tgt \
  --trainpref $TEXT/train \
  --validpref $TEXT/valid \
  --testpref $TEXT/test \
  --destdir data-bin/multi30k \
  --workers 8 
  #--thresholdtgt 4 \
  #--thresholdsrc 4 \
  #--nwordstgt 20000 \
  #--nwordssrc 20000
