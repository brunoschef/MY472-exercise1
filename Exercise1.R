approval <- read_csv("bidentrumpapproval.csv")

# Making function that adds new variable 'difference'
rating_difference <- function(dataset, month_col, president1_col, president2_col) {
  dataset$approval_difference <- dataset[[president1_col]] - dataset[[president2_col]]
  return(dataset)
}


approvalwithdiff <- rating_difference(approval, "Month", "BidenAvg", "TrumpAvg")

