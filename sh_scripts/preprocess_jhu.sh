DATA_DIR='../data/primary_datasets/'
OUTPUT_DIR='../data/datasets/jhu_plus/'

python cc_utils/preprocess_jhu.py \
    --data_dir $DATA_DIR \
    --output_dir $OUTPUT_DIR \
    --dataset jhu_plus \
    --mode test \
    --image_size 256 \
    --ndevices 1 \
    --sigma '0.5' \
    --kernel_size '3' \
    --lower_bound 0 \
    --upper_bound 300 \
    # --weather fog \
    # --with_density \
