# Discovery based on Batch 7 and PDA cases

New case list based on work here: /Users/mwyczalk/Projects/CPTAC3/CPTAC3.Cases/cases.analysis.011518
In particular, case list updated with 99 new cases, see commit cdd261b in https://github.com/ding-lab/CPTAC3.catalog.git

Using harmonized branch to discover RNA-Seq BAMs.  Note, after harmonized branch is tested, recommend merging back to master

NOTE: we need to add -core and -bulk suffixes back into AR file manually.  
Also, change reference "SUB" back to hg19.  This will be consistent with newer versions of discovery, which simply assume
that all submitted data is hg19 for now.  "SUB" is too weird and confusing

UUIDs associated with core and bulk PDA (see /home/mwyczalk_test/Projects/CPTAC3/discover/discover.PDA.20190205)
are in case.uuid and bulk.uuid, respectively.  This is done manually, original AR file saved to -orig.
