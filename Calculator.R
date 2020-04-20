# Author: Justin Houstin
# Date:   04/19/2020

add <- function(x, y) {
  return(x + y)
}

sub <- function(x, y) {
  return(x - y)
}

mul <- function(x,y) {
  return (x * y)
}

div <- function(x,y) {
  return (x / y)
}

exp <- function(x,y) {
  return (x ^ y)
}

get_numbers <- function(cmd, ans) {
  print('Type "ans" to place use the answer from the previous operation.')
  print('Default ans is 0')
  
  x <- readline(prompt = "Please type the first number: ")
  if(x == "ans") {
    x <- ans
  } else {
    x <- as.numeric(x)
  }
  
  repeat {
    y <- readline(prompt = "Please enter the second number: ")
    if(y == "ans") {
      y <- ans
    } else {
      y <- as.numeric(y)
    }
    if (y == 0 & cmd == "div") {
      print("Can't divide by zero...")
    } else {
      break
    }
  }
  
  numbers <- c(x, y)
  return(numbers)
}

ans = 0
print("Welcome to R calculator v2.73!")
print("Available commands are: +, -, *, /, and ^")
print("")

repeat {
  cmd = tolower(readline(prompt = "Enter Command: "))
  if(cmd == "quit") {
    break
  }
  
  numbers <- get_numbers(cmd, ans)
  x <- numbers[1]
  y <- numbers[2]
  
  switch(cmd,
         "+" = ans <- add(x, y),
         "-" = ans <- sub(x, y),
         "*" = ans <- mul(x, y),
         "/" = ans <- div(x, y),
         "^" = ans <- exp(x, y),
         print("Not a valid command"))
  
  if (op != "X") {
    print(paste(x, cmd, y, "=", ans))
  }
}