

# Here are a couple of ways to calculate annual attrition of 10%
startpop <- 20000
nyears <- 9
attr.rate <- 0.1

# Simple vectors
vectorcalc <- startpop * ((1- attr.rate)^seq_len(nyears))

# Full sequence
c(startpop, vectorcalc) 

# Full sequence minus first value
vectorcalc 

# Ultimate value
vectorcalc[nyears] 


# With Reduce
# Full sequence
Reduce(f = function(a, b){a*b}, 
       x = rep(0.9, nyears), 
       init = startpop, 
       accumulate = TRUE)

# Full sequence minus first value
Reduce(f = function(a, b){a*b}, 
       x = rep(0.9, nyears), 
       init = startpop, 
       accumulate = TRUE)[-1]

# Ultimate value
Reduce(f = function(a, b){a*b}, 
       x = rep(0.9, nyears), 
       init = startpop)

