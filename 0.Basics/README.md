# Basics


## Dictionary
```Swift
 var dict : [String : Int] = ["Neo" : 91712345678]
```

## Define & Unwrap Optionals
```Swift
 var name : String = nil (which will cause error)
 var name : String? = nil (this turned into optional string)
 name = "Neo Koku" //Print name will return Optional("Neo Koku")

 //inorder to unwrap, add ! behind the string such as name!
 //print(name!) will return Neo Koku (unwrapped)
 //However if optional string is nil, the ! will found fatal error
```

## Design Patterns & Code Structures

## Simple Timer 
```Swift
timer:Int = 0
//then set timer to desired time 
Timer.scheduleTimer(timeInterval: 1.0, target:self, selector:#selector(updateTimer), userInfo:nil, repeats:true)

//print out the remaining time
@obj func updateTimer(){
 if time>0 {
  print("\(time) sec")
  time -= 1
 }
}
```

## 2D Array - [[String]]
```Swift
var arr = [["Hello World", "True"], 
           ["2nd Array", "False"]]
```
## Get button text - current title
```Swift
//sender: UIButton
var text = sender.currentTitle //Whatever text display on button
```
