#!/usr/bin/env bash

SOURCE_DIR="/nfs/psych-bhampstelab/NACC_deidentify/"
TARGET_KEY="s3://naccimageraw/MRI/43/"

INCLUDE_ZIPS="???17umm?????_?????.zip"
EXCLUDE_DIRS="already_pushed_to_nacc"

date;

aws s3 cp                                 \
  ${SOURCE_DIR}                           \
  ${TARGET_KEY}                           \
  --profile nacc                          \
  --exclude "*"                           \
  --include "${INCLUDE_ZIPS}"             \
  --exclude "${EXCLUDE_DIRS}/*"           \
  1>log/$(date +"%Y-%m-%d_%H-%M-%S").log  \
  2>err/$(date +"%Y-%m-%d_%H-%M-%S").err  ;

date;

