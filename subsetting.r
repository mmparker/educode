# Exploring some nuances in R's subsetting methods
# logical vectors vs. numeric

# Set up an example data.frame
dat <- data.frame(tfn = c(TRUE, FALSE, TRUE, NA),
                  onezed = c(1, 0, 1, NA))


# Basic evaluation of the vectors
dat$tfn
dat$tfn == TRUE # Returns NA for NA
dat$tfn %in% TRUE # Returns FALSE for NA

dat$onezed
dat$onezed == 1 # Returns NA for NA
dat$onezed %in% 1 # Returns FALSE for NA



# Subsetting based on those variables
dat

# First, using [ indexing
dat[dat$tfn, ] # Returns NA, which is not always okay
dat[dat$onezed, ]  # Ditto

dat[dat$tfn == TRUE, ] # Still returns NA
dat[dat$onezed == 1, ] # This one, too

dat[dat$tfn %in% TRUE, ] # Returns just the TRUE rows
dat[dat$onezed %in% 1, ] # Ditto


# Conclusion: when using [ indexing, use %in% when NAs are present



# Using subset()
# With the T/F/NA vector, all methods exclude NA
subset(dat, tfn)
subset(dat, tfn == TRUE)
subset(dat, tfn %in% TRUE)

# In subset(), the numeric vector ISN'T interpreted as a logical
dat[dat$onezed, ]    # Here, R accepts it as a logical!
subset(dat, onezed)  # But not acceptable here

# But these are all equivalent
subset(dat, as.logical(onezed))
subset(dat, onezed == 1)
subset(dat, onezed %in% 1)


# Conclusion: when using subset, == and %in% are both rendered NA-safe;
# but numeric 0/1 vectors are no longer automatically interpreted as logical
