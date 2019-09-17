best <- function(state, outcome)
{
    if(is.na(match(outcome, c("heart attack", "heart failure", "pneumonia"))))
        stop("invalid outcome")
}
