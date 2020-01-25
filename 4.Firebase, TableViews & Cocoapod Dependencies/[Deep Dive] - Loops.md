# Loop

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
