#
# vector
#

v <- 1:10

v > 5
all(v>5)  # 벡터의 모든 요소가 조건에 만족하는가?
any(v>5)  # 벡터의 요소 중 조건에 만족하는게 있는가?

head(v)    #처음부터 일정 개수( default : 6개)
tail(v)    # 끝에서부터 일정 개수( default : 6개)
head(v, 3)
tail(v, 3)

x <- c(1, 2, 3)
y <- c(3, 4, 5)
z <- c(3, 1, 2)

#집합<<< 중복 데이터를 포함하지 않는다.
#집합( set ) : 중복 데이터가 없는 벡터


union(x, y)      #합집합
intersect(x, y)  #교집합
setdiff(x, y)    #차집합
setequal(x, y)   #동일한 요소가 있는가 확인



#
# 2.1 List
#
#List : 동일 자료형, 다른 자료형을 저장할 수 있는 벡터
#list() : List 생성 함수
#          요소는 Key(이름) = Value(값) 형식이다.
v <- c(90, 85, 70, 84)
l <- list( name = 'hong', age = 30, status = TRUE,
           score = v)

l

l[1]
l[4]

l[[ 1 ]]
l[[ 4 ]]
l[[ 4 ]][ 1 ]

l$name
l$score


#
#2.2 factor(범주형, categorical)
#
# factor 형: 문자 형태로 저장되며 범위를 갖는 값을 저장하는 data type
#factor() : 팫터형 벡터 생성 함수
bt <- c('A','B','B','O','AB','A')       #문자형 벡터
bt.factor <- factor(bt)                 #팩터형 벡터

bt
bt.factor

gender <- c('남','여','여','남','남','여','여','남')
gender.factor <- factor( gender )

gender[ 5 ]
gender.factor[ 5 ]

bt[ 3 ]
bt.factor[ 3 ]

levels(bt.factor)
levels(gender.factor)

as.integer(bt.factor)
as.integer(gender.factor)

gender.factor[5]
gender.factor[5] <- '중'
gender.factor

#
#2.3 matrix
#
#matrix(행렬, 2차원 배열) : 동일 자료형의 데잍터를 저장하는 백터 집합
#row(행), ★observation(관측값), ★data (값)
#column(열), ★★variable(변수)
#행과 열이 만나는 곳은 cell
#
# matrix() : matrix 생성 함수
# 매트릭스 채울때 <열 우선(기본)으로 채움

z <- matrix(1:20, nrow=4 )
z
class(z)
str(z)
dim(z)  # 차원 형태(몇행 몇열)

z <- matrix(1:20, nrow=4, ncol=5)
z

z <- matrix(1:20, nrow=4, ncol=5, byrow = T )  #행 우선 방식
z

x <- 1:4
y <- 5:8
z <- matrix(1:20, nrow=4, ncol= 5 )

m1 <- cbind(x, y)   #인수를 변수로 봄
m1
m2 <- rbind(x,y)   #인수를 관측치로 봄
m2
m3 <- rbind(m2, x) 
m3
m4 <- cbind(z, x)   
m4

#
# matrix에서 cell의 값 읽기
z[ 2, 3 ]
z[ 1, 4 ]
z[ 2, ]  #2행 전체
z[ ,4 ]  #4열 전체

z[ 2, 1:3 ]
z[ 1, c(1,2,4) ]
z[ 1:2, ]
z[ , c( 1, 4) ]

#
#matrix 행/열에 이름 지정
#
score <- matrix( c( 90, 85, 69, 78,
                   85, 96, 49, 95,
                   90, 80, 70, 70),
                nrow = 4, ncol = 3 )
score

rownames(score) <- c('hong', 'kim', 'lee', 'yoo' ) #행이름
colnames(score) <- c('english','math','science' ) #열이름
score

score['hong','math']
score['kim', c('math','science')]
score['lee',]
score[, 'english']

rownames(score)
colnames(score)
colnames(score)[2] #col names의 결과에 대해 2번째

c <-  colnames(score)
c[ 2 ]









# 2.4 data frame
#
#data frame : matrix와 동일한 구조를 갖으며 자료형에 구애받지 않고
#             저장하는 matrix
#
#data.frame() : data frame을 생성하는 함수
#변수의 타입은 다를 수 있다 matrix는 같음.
city <- c('seoul','busan', 'daejeon' )    #city<<문자벡터
rank <- c(1, 2, 3)                        #rank<숫자벡터
city.info <- data.frame(city, rank)   #변수의 데이터 타입이 다름
city.info               

class(city.info)
str(city.info)           #obs 관측치 variable 변수
dim(city.info)

name <- c('hong','kim','lee')
age <- c(22, 20, 25)
gender <- factor(c('m','f','m'))
blood.type <- factor(c('a','o','b'))

person.info <- data.frame(name, age, gender, blood.type)
person.info

str(person.info)



#
#data frame 요소 읽기
#
city.info[ 1, 1 ]
city.info[ 1, ]
city.info[ ,1 ]
city.info[city.info$city == 'seoul', ]
city.info[ , 'rank' ]

person2.info <- data.frame( name = c('hong','kim','lee'),
                           age = c(22, 20, 25),
                           gender = factor(c('m','f','m')),
                           blood = factor(c('a','o','b')))
person2.info

person.info$name
person.info[person.info$name == 'hong', ]
#hong 이름의 데이터 전체
person.info[person.info$name == 'hong', c('name','age')]
#hong 이름의 데이터 이름 나이를 출력하라

data()

iris
head( iris )
tail( iris )

class( iris )
str( iris )
dim( iris )


iris[ , c(1:2)]
iris[ , c(1, 3, 5)]
iris[ , c('Sepal.Length', 'Species')]
iris[ 1:5, ]
iris[ 1:5, c(1, 3)]


#
# matrix / dataframe 에서 사용하는 함수
#
class(state.x77)
class(iris)

dim(state.x77)
dim(iris)

str( state.x77)
str( iris )

nrow(state.x77)
nrow( iris )

ncol( state.x77)
ncol( iris)

head(state.x77)
head( iris )

tail( state.x77)
tail( iris )

unique( iris[, 5 ])   #중복을 배제한 값

table( iris[ , 5 ])   #(도수분포표)/factor타입이 유리
#                      table 그룹별로 개수를 카운팅 해줌.
table( person.info[ , 'blood.type'])      
table( person.info[ , 'gender'])   



#
# matrix/data frame 산술 연산 함수
#colSum colMeans rowSums rowMeans 는 고정된 함수 
colSums(iris[ , -5]); apply(iris[ , 1:4], 2, sum)      #열별 합
colMeans(iris[ , -5]); apply(iris[ , 1:4 ], 2, mean)   # 열별 평균
rowSums(iris[ , -5]); apply(iris[ , -5],1, sum)        #행별 합
rowMeans(iris[ , -5]); apply(iris[ ,- 5], 1, mean)     #행별 평균
apply(iris[ , -5], 2, median )                         #행별 중앙값

sx <-  state.x77
head( sx )
sx.t <-  t( sx )   #행과 열의 방향 전환, 전치
head( sx.t )

# 조건에 맞는 행과 열 추출(data frame 만 가능)

subset(iris, Sepecies == 'setosa')
subset(iris, Sepal.Length > 5.0 & Sepal.Width> 4.0)

subset( iris, Sepal.Length > 5.0 & Sepal.Width > 4.0)[, c( 2, 4)]


#
#matrix/data frame 산술연산
#
m1 <-  matrix(1:20, 4, 5)
m1
m2 <- matrix(21:40, 4, 5)
m2


2 * m1
m2 - 5
2 * m1 +3 *m2

m1 + m2
m2 - m1
m2 / m1
m1 * m2


#
# matrix를 data frame으로, data frame을 matrix로 변환
#
st <- data.frame(state.x77)
class(st)
str(st)
dim(st)

iris.m <- as.matrix(iris)  #<<as는 변환함수
class(iris.m)
str(iris.m)
dim(iris.m)

#data type 확인 함수 
is.matrix(state.x77)
is.matrix(iris.m)
is.data.frame( st )
is.data.frame( iris )

#
#R 데이터 타입 : 숫자, 문자, 논리, factor, NULL, NA
#
#R에서 data 저장에 사용되는 요소
#   -변수
#   #1차원 배열
#    -vector 
#    -list
#    #2차원 배열
#     -matrix
#     -data frame


#
# 2.5 파일 읽기/쓰기
#
#
#csv file 내용 읽어서 data frame 생성
#
air <- read.csv('airquality.csv', header = T)
air2 <- read.csv('airquality.csv', header = F)

class(air)
class(air2)

str(air)
str(air2)

dim(air)
dim(air2)

air 
air2







