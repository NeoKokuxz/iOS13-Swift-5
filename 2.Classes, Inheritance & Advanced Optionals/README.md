# 3.Classes, Inheritance & Advanced Optionals

## UISlider
//Max and Min value for the slider

```Swift
Slider.value //check slider current value
```

## String Formatting
```Swift
String(format: "String", argument) //Standar
weightLabel.text = String(format: "%.0f", sender.value) + "lb" 
```

## Class and Inheritance
```Swift 
//Super Class
Class Enemy {
  var HP = 100
  var DMG = 20
  
  func move {
    print("Move forward 1m")
  }
  
  func attack {
    print("Land a hit! deal \(DMG) damage!")
  }
}
```

```Swift
//Sub Class that Inherit from Enemy class
//Class subclassName : superclassName {}
Class Dragon : Enemy {
  
  //subclass can override the method from super class
  override move {
    print("Dragon moving forward 5m")
  }
  
  override attack {
    super.attack() //Will call the attack method from Enemy super class
    print("Fire attack! Deals 20 damage")
  }
}
```

# Struct vs. Class
- struct is pass by value, immutable.
- class is pass by reference, inheritance. 
Stuct doesn't need init and Class does need </br>
let name = class() //only holds reference to the object
```
var name = struct() //it will modify the object once value change by destorying the old one. 
                    //struct also create new object instead of passing reference to it.
                    //Example: struct 2 = struct 1 => result a copy of struct 1 into stuct 2, not passing the reference to struct 1.
```                    
```Swift
//Stuct modification always need mutating infront of the func
Stuct Enemy {
  var HP : Int
  var Attack : Int
}

Class Enemy {
  var HP : Int
  var Attack : Int
  
  init(HP:Int, Attack:Int){
    self.HP = HP
    self.Attack = Attack
  }
}
//Class creation
let dragon = Enemy(HP: 50, Attack: 30) //Must provide values
```

## Custom UIViewController
- UIKit

```Swift
import UIKit

class MyViewController : UIViewController {
  override func viewDidLoad {
    super.viewDidLoad()
    
    let label = UILabel()
    label.text = "name: Neo"
    label.frame = CGRect(x:0, y:0, width: 100, height: 50)
    view.addSubview(label)
  }
}
```
# DownCasting as! or as?

```Swift
override func prepare(for segue: UIStoryboardSegue, sender: Any?){
  if segue.identifier == "calculateSeg" {
    //telling swift that our destination will always be ResultViewControll through calculateSeg
    let destinatVC = segue.destination as! ResultViewViewController
    destinatVC.resultValue = BMIValue
    }
}
```

# Advanced Optionals
- Force Unwrapping
  - Check for nil value before force unwrapping the optional string. 
```Swift
  var optional : String? = "Hello" //optional("Hello")
  optional! //Force Unwrapping the value to Hello
  
```
- Check for nil value
```Swift
if optional != nil {
  optional!
}
```
- Optional Binding
```Swift
//Note that safeOptional is a String while optional is String?
//The if statement makes only optional != nil
if let safeOptional = optional {
  safeOptional
}
```
- Nil Coalescing Operator
```Swift
//provide defaultValue while nil 
optional ?? defaultValue //structure
optional = nil
let text = optional ?? "I am default string" //if nil, give it the default string. 
```
- Optional Chaining 
```Swift
//? means only if optional isn't nil, then process to property or method after
optional?.property
optional?.method()

struct MyOptional {
  var property = 50
  func method(){
    print("I am a method inside optional! wowowow")
  }
}

//set up myOptional using MyOptional struct
let myOptional: MyOptional? 

//set myOptional to nil
myOptional = nil

print(myOptional!.property) //Force unwrapping will cause fatal error and crash.
print(myOptional?.property) //It will not crash and print nil value instead.

//if myOptional is initialized
myOptional = MyOptional() //Using the struct
myOptional.method() //this will print the string "I am a method inside optional! wowowow" 

```


