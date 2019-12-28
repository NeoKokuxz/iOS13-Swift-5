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

## Design Patterns & Code Structures
```Swift
struct book {
 //Properties:
 let name = "Neo"
 var nickName = ["Naoki","Ty", "Jack"]
 var resources = ["money":20, "car":5, "gold":30]
 
 //Method
 func info() {
  print("Book infomation")
 }
}

var myBook = book()

print(myBook.nickName) //Naoki, Ty, Jack

//add more into array
myBook.nickName.append("Youssef") //will add into the nickName array

print(myBook.info) //will print Book infomation

// structname() => init(){}
struct town {
 var name : [String]
 var population : Int
 var stats : [String:Int]
 //init(townName: String, people: Int, info: [String: Int]){
  //townName = name
  //people = population
  //info = stats
  //or using self
  //}
 init(name:String, population:Int, stats: [String: Int]){
  self.name = name
  self.population = population
  self.stats = stats
 }
}

var newTown = town(townName: "HelloLand", people: 5, info:["Neo":23])
newTown.population += 1 //Makes it 5=>6
newTown.stats.append([String:Int]) //?

```


