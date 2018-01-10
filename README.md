Discover and analyze submitted reads for all samples for CPTAC3 batch 1.

# Overview

The [discover.CPTAC3.b1](https://github.com/ding-lab/discover.CPTAC3.b1) project obtains information about 
BAM and FASTQ files associated with a given set of cases from the GDC. It is specific to the CPTAC3 project, but
the techniques will be generally applicable to other projects.

The 'discover.CPTAC3.b1' project consists of simple wrapper scripts which rely on additional libraries:

* [CPTAC3.case.discover](https://github.com/ding-lab/CPTAC3.case.discover) contains the core logic to obtain
GDC data associated with given cases
* [query.GDC](https://github.com/ding-lab/queryGDC) is a command line client for Genomic Data Commons graphGL queries

The above libraries provide additional documentation.

# Installation

All code to obtain data for CPTAC3 Batch 1 cases, including the above libraries, can be obtained with,
``` 
git clone --recursive
https://github.com/ding-lab/discover.CPTAC3.b1.git 
```

## Dependencies

* `queryGDC` requires `python` and the `json` library; these typically come installed in a developer environment.
* `CPTAC3.case.discover` scripts rely on `jq` for parsing; [see here for installation instructions](https://stedolan.github.io/jq/download/).

## Token

All queries require a GDC authorization token, [as described
here](https://docs.gdc.cancer.gov/Data_Submission_Portal/Users_Guide/Authentication/).
Save the token to some file, e.g. `gdc-user-token.txt`.

# Configuration

Since `discover.CPTAC3.b1` is specific to a particular set of cases in a particular environment, code here needs to be
modified as appropriate.  It is useful as a start to create a branch of the workflow and rename this directory appropriately.
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

The script here are designed to obtain information about all Submitted Aligned Reads (BAM files) and Submitted Unaligned Reads (FASTQ files)
associated with a set of cases (e.g., UCEC case `C3N-00858`).  These cases, and the diseases associated with them, are defined
in the file `1_make_case_list.sh`, which must be edited as appropriate.

*TODO*: Right now, assumed that only UCEC and CCRC cases are being investigated.  In the future this can be generalized; for now, 
all steps 1-7 must be edited to point to the correct disease files; such edits should be self-explanatory.  Only files in `discover.CPTAC3.b1`
(not in `CPTAC3.case.discover` or `query.GDC`) need to be edited.

# Run Scripts

All scripts are run in numerical order.  [CPTAC3.case.discover](https://github.com/ding-lab/CPTAC3.case.discover) has more detailed 
description of the nature of these scripts.

Please contact Matt Wyczalkowski <m.wyczalkowski@wustl.edu> for with questions and bug reports.
