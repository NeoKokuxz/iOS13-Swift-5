# Loops

```Swift
titleLabel.text = ""
let titleText = "⚡️FlashChat"
var charCount = 0
for letter in titleText {
 //Timer setup
 Timer.scheduledTimer(withTimeInterval: 0.1 * Double(charCount), repeats: false) { (timer) in
 self.titleLabel.text?.append(letter)
 }//End of timer
 charCount += 1
}
```
## - For In Loop
```Swift
let names = ["A", "B", "C"]
for name in names {
 print(name) //A B C
}
```

```Swift
//with in range
for _ in 1...5

//Half range
for_ in 1...<5 // 1-4
```

## While Loop
```Swift
while conditionTrue {
 print("Loop running")
}
```
