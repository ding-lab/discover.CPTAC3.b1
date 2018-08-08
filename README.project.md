# CPTAC3 Complete analysis

The goal here is to obtain an SR file consisting of all CPTAC3 CCRC, LUAD, and UCEC batches (through July 2018).
`epazote:/Users/mwyczalk/Projects/CPTAC3/CPTAC3.Cases/dat/CPTAC3.Complete.cases.dat`
renamed as here as `dat/CPTAC3.C322.cases.dat` has columns: (case name, disease, batch number) 

Case names are collected in the directory above from these sources:
* LUAD: `origdata/20180403_CPTAC3_Broad_LUAD_Batch_Plan.xlsx`
  * From email from Michael Gillette 4/5/18
* UCEC 3-4: `origdata/UCEC_TMT_02092018_batches 3&4.xlsx`
  * From email from Emily Boja 2/14/18
* UCEC 2: `origdata/UCEC_TMT10_Batch2_SampleAndAliquotIDs.xls`
  * from email from Tao Liu 12/14/18
* UCEC 1: `origdata/Updated\ UCEC_TMT10_Batch\ 1_PNNL_UUID_added.xlsx`
  * from Mathangi Thiagarajan email 10/5/18
* CRCC 1-5: `origdata/180110_CCRCC-TMT_Sets1-23.xlsx`
  * from email from Emily Boja 2/14/18
  * Note that this is a summary dataset, is not what was used for discover
    at that time.  Assuming it is consistent
* Dan Cui requested (email, 7/2/18) the following three UCEC cases be added; we are calling this the d3 batch, and
  the dataset with them included is the C325 dataset
  * C3L-01925, C3N-01346, C3N-01349

## d3 batch
  * Preliminary analysis (7/8/18 and prior) has no WXS samples associated with the d3 cases above
  * These datasets were uploaded and an SR file containing them was generated 
  * Old version of SR file is labeled "v1.0" 

# Transient errors

On occasion, we see the following error:
```
result="<html><head><title>Hold up there!</title></head><body><center><h1>Hold up there!</h1><p>You are posting too quickly. Wait for few moments and try again.</p></body></html>"
```

A test for this response was implemented in queryGDC, and results in waiting 5 seconds before trying again

