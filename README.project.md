# Testing discovery of GDC Harmonized (hg38) data

File CPTAC-3_AlignedReads_GDC-Manifest.txt from Mathangi email 7/17/18
```
        GDC harmonized whole exome data (batch 1) are available for your review.
        Please find attached the manifest file with basic metadata.
        Please start reviewing the harmonized bams.
        Anyone with dbGaP submitter access for CPTAC-3 should currently be able to
        download any of these files either by using the GDC Data Transfer Tool or the
        API directly. Please check
        https://docs.gdc.cancer.gov/Data_Submission_Portal/Users_Guide/Pre_Release_QC/
        for additional documentation.  If you have any question about the content,
        please contact me. If you have questions or technical issues with the actual
        connection or downloading, please contact GDC helpdesk
        (support@nci-gdc.datacommons.io). I will let you know as soon as the variant
        calls are ready which should be very soon.
```



Total required disk space 27.1442 Tb based on direct parsing of this file

Preliminary testing for UCEC case C3L-00938


Alliquot ID CPT0016260006 (sample ID 94e9963b-ecb8-490c-854c-2043f19224f1) has IS_TUMOR=Y
Alliquot ID CPT0016330002 (sample ID 98c830a5-8735-4f5f-812d-3e7f7c3aa514) has IS_TUMOR=N

## GDC Discovery
details from Katmai: /home/mwyczalk_test/Projects/CPTAC3/import/import.CPTAC3.hg38.b1

cases obtained from above, > CPTAC-3_AlignedReads_GDC-Manifest.cases.txt

### obtaining aligned_reads

Aligned_reads have a link to submitted_aligned_reads they are associated with.  Can recover this information using, e.g.,
```
{
 aligned_reads(with_path_to: {type: "submitted_aligned_reads", id: "8f7864c6-eaaa-48b7-8aac-3c5d2dbe3ccb"}) {
    experimental_strategy
    data_category
    data_format
    id
    file_name
    file_size
    md5sum
  }
}
```

Test dataset dat/CPTAC3.C325.SR.dat downloaded from denali:/home/mwyczalk_test/Projects/CPTAC3/Discover/discover.CPTAC3.C322/dat/CPTAC3.C325.SR.dat
