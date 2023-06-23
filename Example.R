library(tidyverse)
dat <- read.csv("ADNIMERGE.csv")

# How many participants do we have?
length(unique(dat$RID))

#Index Column based on label
grep("RID", colnames(dat))

# Change VISCODE Variable into Univariate Categorical
#dat$VISCODE <- ifelse(dat$VISCODE == "bl", 0,
                      #ifelse(dat$VISCODE == "0", 0,
                             #as.numeric(gsub("[^0-9]", "", dat$VISCODE))))

# Time dependent measurements
col_fix <- c( "RID","PTID","VISCODE", "PTETHCAT","PTRACCAT")

# Time independent measurements
col_var <- c("DX_bl","AGE","PTGENDER","PTEDUCAT","EXAMDATE", "PIB","AV45","ABETA","TAU", "PTAU","CDRSB","ADAS11",
             "ADAS13", "ADASQ4","MMSE","RAVLT_immediate","RAVLT_learning",
             "RAVLT_forgetting","RAVLT_perc_forgetting","LDELTOTAL","DIGITSCOR",
             "TRABSCOR","FAQ","MOCA", "PTMARRY", "APOE4", "FDG", "DX") 

# Order the data nicely

long_dat <- dat[,c(col_fix, col_var)] %>% arrange(RID, EXAMDATE)

# From Long to Wide data format
wide_dat <- long_dat %>% pivot_wider(
  
  names_from = VISCODE,
  id_cols = c("RID","PTID","PTETHCAT","PTRACCAT"),
  values_from = c("DX_bl","AGE","PTGENDER","PTEDUCAT","EXAMDATE", "PIB","AV45","ABETA","TAU", "PTAU","CDRSB","ADAS11",
                  "ADAS13", "ADASQ4","MMSE","RAVLT_immediate","RAVLT_learning",
                  "RAVLT_forgetting","RAVLT_perc_forgetting","LDELTOTAL","DIGITSCOR",
                  "TRABSCOR","FAQ","MOCA", "PTMARRY", "APOE4", "FDG", "DX"),
  names_repair = unique
  
  )

#Reihe 17 in colnames fertig



