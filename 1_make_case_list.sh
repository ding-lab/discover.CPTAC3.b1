# Cases for batches 1 and 2
# Will focus here on adjacent normal, but basically redoing entire search

# We will have one unified file with all cases, sorted.

OUT="dat/CPTAC3.b1-2.cases.dat"

TMPOUT1="dat/CCRC_Cases.tmp"
mkdir -p dat

# Batch2-CCRCC_TMT_Sets6-9.xlsx 
# https://drive.google.com/open?id=16oZEYoVizqktVgXWwsGU7ffn3CQeoKOk
# first sed incantation removes comments and blank lines, courtesy https://stackoverflow.com/questions/3350223/sed-remove-and-empty-lines-with-one-sed-command
cat <<EOF | sed -e '/\s*#.*$/d' -e '/^\s*$/d' | sed 's/$/\tCCRC/' | sort -u > $TMPOUT1
# Batch 1
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
# Batch 2
C3L-00097
C3L-00004
C3N-00953
C3L-00004
C3N-00150
C3N-00150
C3N-00953
C3L-00097
C3L-00583
C3N-00244
C3N-01178
C3N-01178
C3L-00088
C3N-00244
C3L-00583
C3L-00088
C3L-00814
C3L-00908
C3L-00814
C3L-00026
C3L-00908
C3L-00026
C3L-00447
C3L-00447
C3L-00416
C3N-00246
C3N-00148
C3N-00148
C3N-00246
C3L-00416
EOF


TMPOUT2="dat/UCEC_Cases.tmp"
# UCEC_TMT10_Batch2_SampleAndAliquotIDs.xlsx 
# https://drive.google.com/open?id=1fa_nBJYCi-IjLxr6hY8p7nRpOuMrOBIK
cat << EOF | sed -e '/\s*#.*$/d' -e '/^\s*$/d' | sed 's/$/\tUCEC/' | sort -u > $TMPOUT2
# Batch 1
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
# Batch 2
C3N-00333
C3N-00333
C3L-00006
C3L-00006
C3L-00769
C3L-00769
C3L-00362
C3L-01312
C3L-00449
C3L-00601
C3L-00601
C3N-00729
C3N-00729
C3L-00586
C3L-00586
C3N-01212
C3N-00836
C3N-00339
C3L-01246
C3L-01246
C3L-01257
C3L-01257
C3L-00780
C3L-00930
C3N-01217
C3N-00323
C3L-00918
C3N-00866
C3N-00866
C3L-00932
C3L-00932
C3L-00963
C3L-00963
C3N-00335
C3N-00326
C3L-00961
EOF

cat $TMPOUT1 $TMPOUT2 | sort > $OUT
rm $TMPOUT1 $TMPOUT2
echo Written to $OUT
