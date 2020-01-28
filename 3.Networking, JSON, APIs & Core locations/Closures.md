# Closures 

## - Syntax
```Swift 
//Closure syntax
{ (parameters) -> return type in
  statements
}
```

## - Code examples
```Swift 
func calculator(num1: Int, num2: Int, operation:(Int, Int)-> Int) -> Int {
  return operation(num1, num2)
}

func add(n1:Int, n2:Int) -> Int {
  return n1+n2
}
##
calculator(num1:5, num2: 7, operation:add) //return 12 (5+7)
```

## Short-Hand syntax in Closures
- Normal Ver.
```Swift
calculator(num1: 3, num2: 5, operation: { (n1:Int, n2:Int)->Int in 
    return n1+n2
}) //return 8 (3+5)
```
- Short-Hand Syntax Ver.
```Swift
calculator(num1: 3, num2: 5, operation: {(n1, n2) in n1+n2}) //return 8 (3+5)
```
- Trailling Closure Syntax
```Swift
let result = calculator(num1: 1, num2: 2){$0+$1} //Note that {} is a trailling closure
```
- //Note: These shorten syntax is useful, however it reduce the reusability of the code
