# Australian Tax Data

This R package contains documented and cleaned versions of the 2012-13, 2013-14 and 2014-15 ATO 2 per cent sample files.

See [the ATO website](https://www.ato.gov.au/About-ATO/Research-and-statistics/Taxation-statistics/) for further information.

## Installation and usage

Install it from github with:

```{r}
devtools::install_github("thmcmahon/ozTaxData")
```

Load the dataset with:

```{r}
data(sample_13_14) 
```

More information on the variables in the dataset is available in the help file.

```{r}
?sample_13_14
```