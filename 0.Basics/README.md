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
