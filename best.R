##  This function returns the best hospital in the state/commonwealth for one of
##  three outcomes: heart attack, heart failure, or pneumonia.  The
##  state/commonwealth must be one of the states/commonwealths found in the
##  State column of the data file.

best <- function(state, outcome)
{

##  Test to see if the outcome entered is valid.  If it is valid, colname will
##  hold the value of the column name.

    if(outcome == "heart attack")
    {
        colname = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
    }
    else if(outcome == "heart failure")
    {
        colname = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
    }
    else if(outcome == "pneumonia")
    {
        colname = "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
    }
    else
    {
        stop("invalid outcome")
    }


##  Load the file into a data frame.

    outcome_df <- read.csv("outcome-of-care-measures.csv", stringsAsFactors = FALSE)


##  Test to see if the state/commonwealth is valid

    if(is.na(match(state, outcome_df$State)))
    {
        stop("invalid state")
    }


##  Remove rows from other states/commonwealths and where the value of the
##  outcome is NA.

    outcome_df <- outcome_df[outcome_df$State == state & outcome_df[, colname] != "Not Available", ]


##  Convert the data column to numeric

    outcome_df[, colname] <- as.numeric(outcome_df[, colname])


##  Sort the data frame by the data column, then by the hospital name

    outcome_df <- outcome_df[order(outcome_df[, colname], outcome_df$Hospital.Name), ]


##  Return the hospital name in the first row, which is the best hospital in the
##  state/commonwealth for the desired outcome.

    outcome_df$Hospital.Name[1]
}
