#week2hw

set.seed(15)
hw2 <- runif(50, 4, 50)
hw2 <- replace(hw2, c(4,12,22,27), NA)
hw2

is.na(hw2)
! is.na(hw2)

#1
hw2[! is.na(hw2)]

prob1 <- hw2[! is.na(hw2)]

prob1 <- ( prob1>14 & prob1<38 )


prob1 <- prob1[prob1 >14 & prob1 < 38]

prob1 <- hw2[! is.na(hw2)]

prob1 <- prob1[prob1 >14 & prob1 < 38]

#p2
times3 <- prob1*3

plus10 <- times3+10

#3 

final <- plus10[c(TRUE, FALSE)]