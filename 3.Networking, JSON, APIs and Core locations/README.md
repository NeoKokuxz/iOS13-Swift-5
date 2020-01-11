# 3.Networking, JSON, APIs and Core locations

## Dark-mode and Vector 
- System color will change automatically, custom color will need to be added to asset in order to modify. 
  - Under asset -> add new color set (default -Light -Dark)
- Vector image will always stay shape when zoom in. 
  - Using vector image such as pdf file, 
  - Resize -> check - [X] Preserve Vector Data -> - [X] single scale
  
## Swift protocols & Delegate design parttern
- Delegate are protocols
```Swift 
protocol UITextFieldDelegate
```
- A text field calls the methods of its delegate in response to important changes. You use these methods to validate text that was typed by the user, to respond to specific interactions with the keyboard, and to control the overall editing process. Editing begins shortly before the text field becomes the first responder and displays the keyboard (or its assigned input view).

#### Protocols
```Swift
protocol myProtocol {
  //Define requirments 
}
```
- Adopt protocols 
![Protocol](https://github.com/NeoKokuxz/iOS13-Swift-5/blob/master/3.Networking%2C%20JSON%2C%20APIs%20and%20Core%20locations/protocol_example.png)
```Swift 
//Base
struct myStruct : myProtocol {}

class myClass : myProtocol {}

//Usage Struct & Class
struct myStruct : myFirstProtocol {
  //Define Struct here
}
class myClass : mySuperclass, myFirstProtocol, mySecondProtocol {
  //Class definition goes here
}
```
[ReadingGuide-Protocols](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html)
  
## APIs - Making Http requests with URLSession

![API-definition](https://github.com/NeoKokuxz/iOS13-Swift-5/blob/master/3.Networking%2C%20JSON%2C%20APIs%20and%20Core%20locations/APIs-Def.png)

- API links: ? -> starts a query, & -> starts new command 

## Parse JSON with Native JSON Decoder

## Computed Properties, closures & extensions

## Core location & GPS data
