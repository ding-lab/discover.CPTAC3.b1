# CPTAC3 Batch 1 cases

OUT="dat/UCEC_Cases.dat"
mkdir -p dat

# The following have been removed from the list because they are not on GDC
# UCEC case C3L-01744
# CCRC case C3L-01861

# case participant_id copy/pasted from /Users/mwyczalk/Downloads/Updated\ UCEC_TMT10_Batch\ 1_PNNL_UUID_added.xlsx 
cat > $OUT <<EOF
C3N-00858
C3L-01252
C3L-00947
C3N-00734
C3L-01248
C3N-00850
C3L-00361
C3L-01249
C3N-00383
C3N-01001
C3L-00949
C3L-00032
C3L-01311
C3L-01256
C3L-00358
C3L-00942
C3N-00389
C3L-01307
C3L-01282
C3L-01304
C3L-00946
C3N-00322
C3N-00337
EOF
echo Written to $OUT

OUT="dat/CCRC_Cases.dat"

# copy/paste from column C of /Users/mwyczalk/Downloads/Updated\ CCRC\ TMT_Sets1-5_JHU_batch1samples_UUID_added.xlsx 
cat > $OUT <<EOF
C3L-00561
C3L-01287
C3L-01603
C3N-01524
C3L-00359
C3N-01214
C3N-00834
C3N-01261
C3L-00917
C3L-01352
C3N-00194
C3L-00010
C3L-00607
C3N-00495
C3N-00831
C3L-01281
C3N-01646
C3L-00791
C3L-00369
C3L-00183
C3N-01180
C3N-00168
EOF
echo Written to $OUT
