import Foundation

func fibonacci(n: Int) {
    
    var num1 = 0
    var num2 = 1
    var fibArray = [num1, num2]
    //Write your code here.
    if n == 0 {
        print("Zero output")
    }else if n == 1 {
        print(num1)
    }else if n == 2 {
        print(fibArray)
    }else {
        for _ in 3...n {
            let num3 = num1 + num2
            num1 = num2
            num2 = num3
            fibArray.append(num3)
        }
        print(fibArray)
    }
}

fibonacci(n: 3)
