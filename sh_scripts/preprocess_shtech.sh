DATA_DIR='../data/primary_datasets/'
OUTPUT_DIR='../data/datasets/ucf_cc/'

python cc_utils/preprocess_shtech.py \
    --data_dir $DATA_DIR \
    --output_dir $OUTPUT_DIR \
    --dataset ucf_cc \
    --mode train \
    --image_size 256 \
    --ndevices 1 \
    --sigma '0.5' \
    --kernel_size '3' \
    --lower_bound 0 \
    --upper_bound 300 \
    # --with_density \
