# !/bin/bash

GPU_ID=5

SEQ=samui_walking_street1
SEQ_ID=1

#SEQ=tennis1
#SEQ_ID=0

#SEQ=soccer1
#SEQ_ID=2

#SEQ=table_tennis1
#SEQ_ID=0

CUDA_VISIBLE_DEVICES=$GPU_ID python offline_distillation.py --multirun \
    dataset.sequence=$SEQ \
    exp.id=${SEQ}_off_seq0_focal_sweep \
    dataset.max_frames=[15000] \
    dataset.sequence_id=$SEQ_ID \
    online_train.scheduler.name=poly,null \
    online_train.optimizer.lr=0.01,0.05,0.1 \
    online_train.optimizer.momentum=0.9,0.99 \
    online_train.focal_gamma=0.5,1.0,2.0