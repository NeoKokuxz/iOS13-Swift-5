# 3.Classes, Inheritance & Advanced Optionals

## UISlider
//Max and Min value for the slider


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
  
}
```
