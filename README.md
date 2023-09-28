# inconsistent-lsids

This is a listing of inconsistent use of `scientificNameID` in OBIS datasets. Inconsistent use means that a `scientificName` is combined with multiple distinct `scientificNameID`s and corresponding interpreted scientific names, for example by extrapolating instead of copying in Excel.

This repository contains the following CSV files:

- [issues.csv](issues.csv?plain=1): listing of scientific names with originating dataset.
  - `dataset_id`: dataset ID
  - `originalScientificName`: provided scientific name
  - `n_interpreted`: number of corresponding interpreted scientific names
  - `interpreted`: interpreted scientific names
  - `aphiaids`: Aphia IDs
  - `url`: dataset URL
- [issue_datasets.csv](issue_datasets.csv?plain=1): listing of datasets with potential issues.
  - `dataset_id`: dataset ID
  - `url`: dataset URL
  - `n_names`: number of problematic names 
