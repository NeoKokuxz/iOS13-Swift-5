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

### Networking Processes 
  - Step1 : Create URL
  - Step2 : Create URLSession
  - Step3 : Give URLSession a task
  - Step4 : Start the task
```Swift
let url = "API_URL goes here"
performRequest(urlString: url) //Pass the api url and request data
```
```Swift
    func performRequest(urlString:String){
        //Create URL
        if let url = URL(string: urlString) {
            //Create URL Session
            let session = URLSession(configuration: .default) //Use default configuration
            //Give session a task
            //CompletionHandler:
            let task = session.dataTask(with: url, completionHandler: handle(data:response:error:)) //Return URLSessionDataTask
            //Start the task
            //Note: newly-initialized tasks begin in suspended state -> use func resume()
            task.resume()
        }
    }
```
```Swift
    //This function handle the completion data
    func handle(data:Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            print("Error!")
            print(error!)
            return //exit out the function
        }
        
        if let safeData = data {
            //print data will not show the data itself, we have to turn it into string
            let dataString = String(data: safeData, encoding: .utf8) //utf8 is standard encoding on web
            print(dataString!)
        }
    }
```
### - Map, Reduce and Filter - 3 Highlevel functions
```Swift
//Map, Reduce and Filter - 3 Highlevel functions
array.map(addOne) //return [5,4,8,3,2,10] addOne to every number in array
//Normal closure
array.map( { (n1:Int) in
  n1+1
})

//Trailing closure
array.map{$0+1}
```

```Swift
//Map functionality
let array = [4,3,7,2,1,9]

let newArray = array.map("\($0)") //Print each number in array into newArray as String
print(newArray) //return ["4","3","7","2","1","9"]
```
## Parse JSON with Native JSON Decoder
JSON - JavaScript Object Notation
- Parse JSON data into an Swiftobject
```Swift

//This is decodable Object using Struct
struct WeatherData: Decodable {
    let name: String
}

//This is decoder for JSON file
let decoder = JSONDecoder()
decoder.decode(type: protocol, from: data) <- Note that this needs decodable type NOT object
//In order to use type over object, add .self to the object
decoder.decode(type: WeatherData.self, from: data) <- decodable type 
```
```Swift
    //Complete func for parseJSON
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionID: id, cityName: name, temp: temp)
            return weather //return weather object
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil //have to set return type WeatherModel to optional?
        }
    }
```
## Computed Properties, closures & extensions
### - Computed Properties vs. Stored Properties
```Swift
    //Stored Property
    let conditionID : Int
    let cityName : String
    let temp : Double
    
    //Computed Property
    var conditionName : String {
        //depends on the value of stored property conditionID
        switch conditionID {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
```

### - Closure
- normal function inside of another function
```Swift 
func calculator(num1: Int, num2: Int, operation:(Int, Int)-> Int) -> Int {
  return operation(num1, num2)
}

func add(n1:Int, n2:Int) -> Int {
  return n1+n2
}

calculator(num1:5, num2: 7, operation:add) //return 12 (5+7)
```
#### - Closure Syntax
```Swift 
//Closure syntax
{ (parameters) -> return type in
  statements
}
```

#### - Closure examples:
```Swift
func calculator(num1: Int, num2: Int, operation:(Int, Int)-> Int) -> Int {
  return operation(num1, num2)
}

//Closure example:
calculator(num1: 3, num2: 5, operation: { (n1:Int, n2:Int)->Int in 
    return n1+n2
}) //return 8 (3+5)

//Simplify the code
//Int, ->Int, and return can be shorten
calculator(num1: 3, num2: 5, operation: {(n1, n2) in n1+n2}) //return 8 (3+5)

//Also $0 means first parameter and $1 refers to second parameter like n1, n2
calculator(num1: 3, num2: 5, operation: {$0+$1}) //return 8 (3+5)

//trailing closure
let result = calculator(num1: 3, num2: 5) {$0+$1}
print(result) //return 8

/*
These shorten syntax is useful, however it reduce the reusability of the code
*/
```

```Swift
let array = [4,3,7,2,1,9]

func addOne(n1:Int) -> Int {
  return n1+1
}
```

#### - Typealiases
- Typealiases
 - Combine mutiple protocols together
 - Codable -> Decodable & Encodable //Decode from and Encode to JSON file
```Swift 
//Codable
struct WeatherData: Codable {
  //definition
}

//Decodable + Encodable = Codable
struct Main: Decodable & Encodable  {
  //definition
}
struct Weather: Decodable & Encodeable {
  //definition
}
```

#### - Parameter names
```Swift 
//Calling the function
myFunc(name:"Neo")

func myFunc(name iName: Type){
  print(iName) //return "Neo"
}

//To Omit parameter name just add _ to the external name before internal name
myFunc("Neo") //Omitted name

func myFunc(_ iName: Type){
  print(iName) //return "Neo"
}

```
- name is external name when calling the function, iName is the internal name that can be use inside the function itself.


#### - Extensions
- Similar overload function in Java
- Extent functions
```Swift
//Extent Double and make it round to desire precision places.
extension Double {
  func round(to places: Int) -> Double {
    let precision = pow(10, Double(places)) //10^5 power
    let n = self //Current double value 3.1415926
    n = n * precision //3.1415926 * 10^5
    n.round() //314159
    n = n / precision //3.14149
    return n
  }
}

var myDouble = 3.1415926
myDouble.round(to: 5) //5 precision places 3.14159
```
- Extent Protocols
```Swift
extension someProtocol {
  //define default behavior 
}

extension someFunc: someProtocol {
  //New functionality
}
```
#### Mark Comment
```Swift
//Mark: - <#Section Name#>
```
## Core location & GPS data
```Swift
import CoreLocation

//MARK: - CLLocationManagerDelegate
//use both method together to make locationManager work
extension WeatherViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()//Stop update location in order to request location later on
            let lat = location.coordinate.latitude
            let long = location.coordinate.longitude
//            print(lat, long)
            weatherManager.fetchWeather(Latitude: lat, Longitude: long)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

```
