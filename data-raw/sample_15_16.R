library(readr)

sample_15_16 <- read_csv('data-raw/2016_sample_file.csv')

sample_15_16$Lodgment_method[sample_15_16$Lodgment_method == 'A'] <- 'Tax Agent'
sample_15_16$Lodgment_method[sample_15_16$Lodgment_method == 'S'] <- 'Self Preparer'

sample_15_16$PHI_Ind[sample_15_16$PHI_Ind == 0] <- "No"
sample_15_16$PHI_Ind[sample_15_16$PHI_Ind == 1] <- "Yes"

sample_15_16$Gender[sample_15_16$Gender == 0] <- "Male"
sample_15_16$Gender[sample_15_16$Gender == 1] <- "Female"


add_factor_labels <- function(sample_15_16) {
    # Adds factor labels from the variables file
    sample_15_16$Partner_status <- factor(sample_15_16$Partner_status, levels = c(0, 1),
                                          labels = c('Single', 'Married/De Facto'))

    sample_15_16$age_range <-
        factor(sample_15_16$age_range, levels = c(0:11),
               labels = c('70 and over', '65 to 69', '60 to 64',
                          '55 to 59', '50 to 54', '45 to 49',
                          '40 to 44', '35 to 39', '30 to 34',
                          '25 to 29', '20 to 24', 'under 20'))

    sample_15_16$Occ_code <-
        factor(sample_15_16$Occ_code,
               levels = c(0:9),
               labels = c('Occupation not listed/ Occupation not specified',
                          'Managers',
                          'Professionals',
                          'Technicians and Trades Workers',
                          'Community and Personal Service Workers',
                          'Clerical and Administrative Workers',
                          'Sales workers',
                          'Machinery operators and drivers',
                          'Labourers',
                          'Consultants, apprentices and type not specified or not listed'))

    sample_15_16$Region <-
        factor(sample_15_16$Region,
               levels = c(0:32),
               c("ACT major urban - capital city", "NSW major urban - capital city",
                 "NSW other urban", "NSW regional - high urbanisation",
                 "NSW regional - low urbanisation", "NSW rural",
                 "NT major urban - capital city", "NT regional - high urbanisation",
                 "NT regional - low urbanisation", "QLD major urban - capital city",
                 "QLD other urban", "QLD regional - high urbanisation",
                 "QLD regional - low urbanisation", "QLD rural",
                 "SA major urban - capital city", "SA regional - high urbanisation",
                 "SA regional - low urbanisation", "SA rural",
                 "TAS major urban - capital city", "TAS other urban",
                 "TAS regional - high urbanisation",
                 "TAS regional - low urbanisation", "TAS rural",
                 "VIC major urban - capital city", "VIC other urban",
                 "VIC regional - high urbanisation", "VIC regional - low urbanisation",
                 "VIC rural", "WA major urban - capital city", "WA other urban",
                 "WA regional - high urbanisation",
                 "WA regional - low urbanisation", "WA rural"))

    return(sample_15_16)
}

sample_15_16 <- add_factor_labels(sample_15_16)

devtools::use_data(sample_15_16, pkg = ".", compress = "xz")
