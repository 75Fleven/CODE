## DESCRIPTION

In the FeaturesExtract directory, there are a total of 5 `.m` files and 2 `.mat` files:

1. `data.mat` represents the EEG signals of the SCH dataset, which consists of 14 channels from 84 subjects.
2. `dataLabel.mat` stores the corresponding states, where 0 indicates normal and 1 indicates the presence of the disease.
3. The `*Entropy.m` files are for the extraction of entropy features.
4. `getFeatures.m` and `getFeaturesMatrix.m` are the scripts for obtaining the feature matrices.

Within the three *Test directories, there are a total of 6 `.m` files and 2 `.mat` files:

1. `featuresMatrix.mat` represents the feature matrix obtained by the `getFeaturesMatrix.m` script.
2. `dataLabel.mat` is the same as previously described.
3. There are 6 `*test.m` files, each representing the classification experiments for six different classifiers.

