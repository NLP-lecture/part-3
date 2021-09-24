cat train_origin.en train_origin.fr > train_origin.enfr

subword-nmt learn-bpe -s 10000 < train_origin.enfr > code
subword-nmt apply-bpe -c code < train_origin.en > train.en
subword-nmt apply-bpe -c code < train_origin.fr > train.fr
subword-nmt apply-bpe -c code < valid_origin.en > valid.en
subword-nmt apply-bpe -c code < valid_origin.fr > valid.fr
subword-nmt apply-bpe -c code < test_origin.en > test.en
subword-nmt apply-bpe -c code < test_origin.fr > test.fr
