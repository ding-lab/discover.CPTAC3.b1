Discover and analyze submitted reads for all samples for CPTAC3 batch 1.

# Overview

The [discover.CPTAC3.b1](https://github.com/ding-lab/discover.CPTAC3.b1) project obtains information about 
BAM and FASTQ files associated with a given set of cases from the GDC. It is specific to a specific batch of CPTAC3 cases, but
is designed to easily extend to other GDC case sets.

`discover.CPTAC3.b1` consists of simple wrapper scripts which delegate the bulk of processing to additional libraries:

* [CPTAC3.case.discover](https://github.com/ding-lab/CPTAC3.case.discover) contains the core logic to obtain
GDC data associated with given cases
* [query.GDC](https://github.com/ding-lab/queryGDC) is a command line client for Genomic Data Commons graphGL queries

These above libraries provide additional documentation and technical background.

# CPTAC3 Batch 2 statistics

See `stats-test/README` for details and analysis.  Summary is for 40 cases in batch 2, without the 3 "straggler cases"
discussed with Mathangi 1/22/18.
```
File type count:
  80 RNA-Seq    Primary Tumor
  40 WGS    Blood Derived Normal
  40 WGS    Primary Tumor
  40 WXS    Blood Derived Normal
  40 WXS    Primary Tumor
```

Disk space requirements:

* Total: 8.151 Tb
* RNA-Seq: 0.307 Tb
* WGS: 5.699 Tb
* WXS: 2.144 Tb

# Installation

All code to obtain data for CPTAC3 Batch 1 cases, including the additional libraries, can be obtained with,
``` 
git clone --recursive https://github.com/ding-lab/discover.CPTAC3.b1.git 
```

## Dependencies

All these scripts run in a Linux or OS X environment.  `queryGDC` requires
`python` and the `json` library. Both typically come installed in a developer
environment.

`CPTAC3.case.discover` scripts rely on `jq` for parsing; [see here for installation instructions](https://stedolan.github.io/jq/download/).

## Token

All queries require a GDC authorization token, [as described
here](https://docs.gdc.cancer.gov/Data_Submission_Portal/Users_Guide/Authentication/).
Download the token and save it to some filename, e.g. `gdc-user-token.txt`.

# Configuration

Since `discover.CPTAC3.b1` is specific to a particular set of cases in a particular local environment, the code needs to be
modified as appropriate.  It is useful to create a branch of the workflow and rename this directory appropriately:
```
cd ..
mv discover.CPTAC3.b1 my_new_project
cd my_new_project
git checkout -b my_new_project 
```

## Configure `discover.paths.sh`

The file `discover.paths.sh` defines several locale-specific environment variables and paths, and must be edited as appropriate.

1. Define `PROJECT` as `my_new_project`
2. Define `GDC_TOKEN` as the full path to the downloaded `gdc-user-token.txt`

## Define cases of interest

Script here obtain information about all Submitted Aligned Reads (BAM files) and Submitted Unaligned Reads (FASTQ files)
associated with a set of cases (e.g., UCEC case `C3L-00006`).  These cases, and the diseases associated with them, are defined
in the file `1_make_case_list.sh`, which must be edited as appropriate.

*TODO*: Right now, scripts assume that only UCEC and CCRC cases are being investigated.  In the future this can be generalized; for now, 
steps 1-7 must be edited to point to the correct disease files; such edits should be self-explanatory.  Only files in `discover.CPTAC3.b1`
(not in `CPTAC3.case.discover` or `query.GDC`) need to be edited.

# Run Scripts

All scripts are run in numerical order.  [CPTAC3.case.discover](https://github.com/ding-lab/CPTAC3.case.discover) has more detailed 
description of the nature of these scripts.

## Output

The final output is written to the file `dat/my_new_project.SR.dat`.  This file provides a comprehensive summary of submitted reads (aligned and unaligned)
with the columns,
```
   case, disease, experimental_strategy, sample_type, samples, filename, filesize, data_format, UUID, md5sum
```
where

* `experimental_strategy` is one of WGS, WXS, RNA-Seq
* `sample_type` is one of "Primary Tumor", "Blood Derived Normal"
* `samples` is `;`-separated list of all sample names associated with this SR
* `data_format` is either BAM for FASTQ

Example output for one case, `C3L-00006`:

```
C3L-00006   UCEC    WGS Blood Derived Normal    C3L-00006-31    CPT0000120163.WholeGenome.RP-1303.bam   151985198519    BAM 14c0cb14-71e4-4f26-89f1-349ce26f0bf9    fe6d49f2c01725954df1fe15016c214a
C3L-00006   UCEC    RNA-Seq Primary Tumor   C3L-00006-01    170802_UNC31-K00269_0072_AHK3GVBBXX_TAGCTT_S17_L005_R1_001.fastq.gz 3875867464  FASTQ   8a1efc47-1c29-417f-a425-cdbd09565dcb    220251611f5168663d5273deffa65203
C3L-00006   UCEC    RNA-Seq Primary Tumor   C3L-00006-01    170802_UNC31-K00269_0072_AHK3GVBBXX_TAGCTT_S17_L005_R2_001.fastq.gz 4295485553  FASTQ   8c3fe9b7-7acd-4867-8d9c-a8e5d1516eda    e651d3e28763687d67f1427d288681d1
C3L-00006   UCEC    WXS Primary Tumor   C3L-00006-01    CPT0001460007.WholeExome.RP-1303.bam    33843236954 BAM b821093d-2551-4327-96d5-07bc91c6d8aa    2ff4d23084057ef0a6aadedaf00e9bea
C3L-00006   UCEC    WXS Blood Derived Normal    C3L-00006-31    CPT0000120163.WholeExome.RP-1303.bam    34319355475 BAM cc3a2843-4c09-4270-a0be-62a0dfccce7f    6db1db1d9fa6cf47b9f89d86a2877015
C3L-00006   UCEC    WGS Primary Tumor   C3L-00006-01    CPT0001460007.WholeGenome.RP-1303.bam   172574887163    BAM d7d6b810-7183-4cd3-8847-8794ec578fb9    8afb6a100ad07d5d8f6a53e13d16a919
```

## Support 

Please contact Matt Wyczalkowski <m.wyczalkowski@wustl.edu> for with questions and bug reports.
