x <-5*6
x

is.vector(x)
length(x)

x[2] <- 31
x

x[5] <- 44
x
x[11]
x[0]

x <- 1:4
x
y <-x^2
y


z <- vector(mode = mode(x), length = length(x) )


x <- 1:5
y <- 3:7
x
y
  
  
 x+y 
  
z <- y[-5]
z
x+z
str(c("hello", "workshop","participant"))

str(c(9:11, 200, x))

str(c("somethings", pi, 2:4, pi >3))

str(c(pi, 2:4, pi >3))

c("somethings", pi, 2:4, pi >3)

str(list(c("somethings", pi, 2:4, pi > 3)))

w <- rnorm(10)
seq_along(w)
w
which(w < 0)
w[which(w < 0)]

w < 0
w[ w < 0]
w[ -c(2, 5)]

x <- list(vegetable="cabbage", 
        number = pi,
        series = 2.4,
      telling = pi > 3)

x
x$vegetable
str(x[1])

x <- list(vegetable = list("cabbage", "apple", "carrot"), 
          number =list(c(pi, 0,2,NA)),
          series = list(list(2:2, 3:5)),
          telling = pi > 3)

str(x)




