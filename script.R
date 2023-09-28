library(arrow)
library(dplyr)
library(robis)

datasets <- dataset() %>%
  select(id, url)

df <- open_dataset("~/Desktop/temp/obis_20230726.parquet") %>%
  filter(!is.na(originalScientificName) & !is.na(scientificNameID) & !is.na(AphiaID)) %>%
  group_by(dataset_id, originalScientificName, AphiaID, scientificName) %>%
  summarize() %>%
  collect()

issues <- df %>%
  group_by(dataset_id, originalScientificName) %>%
  summarize(n_interpreted = n_distinct(scientificName), interpreted = paste0(sort(scientificName), collapse = ";"), aphiaids = paste(sort(AphiaID), collapse = ";")) %>%
  filter(n_interpreted > 1) %>%
  arrange(desc(n_interpreted)) %>%
  left_join(datasets, by = c("dataset_id" = "id")) %>%
  filter(!is.na(url)) %>%
  arrange(url, originalScientificName)

issue_datasets <- issues %>%
  group_by(dataset_id, url) %>%
  summarize(n_names = n()) %>%
  arrange(url)

write.csv(issues, file = "issues.csv", row.names = FALSE, na = "")
write.csv(issue_datasets, file = "issue_datasets.csv", row.names = FALSE, na = "")
