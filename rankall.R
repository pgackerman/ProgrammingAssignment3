##  This function ranks all of the hospitals in each state for the specified
##  outcome.  It will build a data frame containing the hospital of the
##  specified rank, then return that data frame.

rankall <- function(outcome, num = "best")
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


##  Load the data file in to a data frame and remove all the NA values for the
##  specified outcome.

    outcome_df <- read.csv("outcome-of-care-measures.csv", stringsAsFactors = FALSE)
    outcome_df <- outcome_df[outcome_df[, colname] != "Not Available", ]


##  Convert the data column to numeric.

    outcome_df[, colname] <- as.numeric(outcome_df[, colname])


##  Build a vector of each state and sort it.

    states <- unique(outcome_df$State)
    states <- states[order(states)]


##  Build the data frame that will be returned.

    rank_df = data.frame(hospital = character(length(states)), state = character(length(states)), row.names = states, stringsAsFactors = FALSE)


##  Loop through each state

    for (i in 1:nrow(rank_df))
    {

##      Build a data frame containing data from only the current state in the
##      loop.

        state_df <- outcome_df[outcome_df$State == states[i], ]
        state_df <- state_df[order(state_df[, colname], state_df$Hospital.Name), ]


##      Determine the appropriate ranking in the state and put that hospital
##      name into the data frame that will be returned

        if (num == "best")
        {
            rank_df$hospital[i] <- state_df$Hospital.Name[1]
        }
        else if(num == "worst")
        {
            rank_df$hospital[i] <- state_df$Hospital.Name[nrow(state_df)]
        }
        else if(num > nrow(state_df))
        {
            rank_df$hospital[i] <- NA
        }
        else
        {
            rank_df$hospital[i] <- state_df$Hospital.Name[num]
        }

        rank_df$state[i] <- rownames(rank_df)[i]
    }

    rank_df
}
