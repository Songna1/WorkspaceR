#송나영 작성일 5.14 / 제출일 5.15
#
#문1)
#1.
score <- matrix(c(10, 40, 60, 20, 
                  21, 60, 70, 30),
                  nrow = 4,ncol = 2,)
                colnames(score) <- c('m','f')
score

#2.
colnames(score) <- c('male','female')
score

#3.
score[2, ]

#4.
score[ ,'female']

#5.
score[3,2]


#
#문2)
#
#1.
st <- data.frame( state.x77 )

#2.
class(st)
 
#3.
colnames(st)

#4
row.names(st)

#5.
dim(st)

#6.
str(st) 

#7.
rowSums(st)&rowMeans(st)

#8.
colSums(st)&colMeans(st)

