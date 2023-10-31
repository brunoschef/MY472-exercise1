approval <- read_csv("bidentrumpapproval.csv")

# Making function that adds new variable 'difference'
rating_difference <- function(dataset, month_col, president1_col, president2_col, state_pop, turnout_percent) {
  
  dataset$approval_difference <- dataset[[president1_col]] - dataset[[president2_col]]
  
  votes_biden <- (state_pop * turnout_percent * 0.01) * (dataset[[president1_col]] / 100)
  votes_trump <- (state_pop * turnout_percent * 0.01) * (dataset[[president2_col]] / 100)
  
  dataset$Biden_Votes <- votes_biden
  dataset$Trump_Votes <- votes_trump
  
  return(dataset)
}


approvalwithdiff <- rating_difference(approval, "Month", "BidenAvg", "TrumpAvg", 
                                      state_pop = 5200000, turnout_percent = 65)

