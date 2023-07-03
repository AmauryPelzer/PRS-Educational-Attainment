library(tidyverse)
dat <- read.csv("ADNIMERGE.csv")

col <- c(
  #ID Variables
  "RID","PTID","DX_bl","AGE","PTGENDER","PTEDUCAT","PTETHCAT",
  "PTRACCAT","PTMARRY","APOE4","EXAMDATE_bl","CDRSB_bl","ADAS11_bl",
  "ADAS13_bl","ADASQ4_bl","MMSE_bl","RAVLT_immediate_bl",
  "RAVLT_learning_bl","RAVLT_forgetting_bl","RAVLT_perc_forgetting_bl",
  "LDELTOTAL_BL","DIGITSCOR_bl","TRABSCOR_bl","FAQ_bl","mPACCdigit_bl",
  "mPACCtrailsB_bl","FLDSTRENG_bl", "FSVERSION_bl","Ventricles_bl",
  "Hippocampus_bl","WholeBrain_bl","Entorhinal_bl","Fusiform_bl",
  "MidTemp_bl","ICV_bl","MOCA_bl","EcogPtMem_bl","EcogPtLang_bl",
  "EcogPtVisspat_bl","EcogPtPlan_bl","EcogPtOrgan_bl","EcogPtDivatt_bl",
  "EcogPtTotal_bl","EcogSPMem_bl","EcogSPLang_bl","EcogSPVisspat_bl",
  "EcogSPPlan_bl","EcogSPOrgan_bl","EcogSPDivatt_bl","EcogSPTotal_bl",
  "ABETA_bl","TAU_bl","PTAU_bl","FDG_bl","PIB_bl","AV45_bl",
  
  #Time Dependent Variables
  "VISCODE","FDG","ABETA","TAU","PTAU","CDRSB","ADAS11","ADAS13","ADASQ4","MMSE",
  "RAVLT_immediate","RAVLT_learning","RAVLT_forgetting","RAVLT_perc_forgetting",
  "LDELTOTAL","DIGITSCOR","TRABSCOR","FAQ","MOCA","EcogPtMem","EcogPtLang",
  "EcogPtVisspat","EcogPtPlan","EcogPtOrgan","EcogPtDivatt","EcogPtTotal",
  "EcogSPMem","EcogSPLang","EcogSPVisspat","EcogSPPlan","EcogSPOrgan",
  "EcogSPDivatt","EcogSPTotal","DX","mPACCdigit","mPACCtrailsB","Years_bl",
         
  #Uncertain
  "PIB","AV45","Ventricles","Hippocampus","WholeBrain",
  "Entorhinal","Fusiform","MidTemp","ICV"
  ) 

# Define Variables of Interest & Order
long_dat <- dat[,col] %>% arrange(RID, EXAMDATE) %>% rename(DX_bas = DX_bl)

# From Long to Wide data format
wide_dat <- long_dat %>% pivot_wider(
  
  names_from = VISCODE,
  
  id_cols = c("RID","EXAMDATE","PTID","PTETHCAT","PTRACCAT","AGE", "PTGENDER", "DX_bas", 
              "PTEDUCAT", "CDRSB_bl", "ADAS11_bl","ADAS13_bl","ADASQ4_bl",
              "MMSE_bl","RAVLT_immediate_bl","RAVLT_learning_bl","RAVLT_forgetting_bl",
              "RAVLT_perc_forgetting_bl", "LDELTOTAL_BL","DIGITSCOR_bl","TRABSCOR_bl",
              "FAQ_bl","mPACCdigit_bl","mPACCtrailsB_bl", "ABETA_bl", "TAU_bl", "PTAU_bl"),
  
  values_from = c("AV45","ABETA","TAU", "PTAU","CDRSB","ADAS11",
                  "ADAS13", "ADASQ4","MMSE","RAVLT_immediate","RAVLT_learning",
                  "RAVLT_forgetting","RAVLT_perc_forgetting","LDELTOTAL","DIGITSCOR",
                  "TRABSCOR","FAQ","MOCA", "PTMARRY", "APOE4", "FDG", "DX", "mPACCdigit","mPACCtrailsB"),
  
  names_repair = unique
  )

#Domain 1: Psychometric Measures
psymeas <- c()

  
  
  
  
  

  
  
#Code Island

#Index Column based on label
#grep("RID", colnames(dat))

# How many participants do we have?
#length(unique(dat$RID))