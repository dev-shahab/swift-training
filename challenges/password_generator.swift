

func generate_Random_String(_ char_str: Array<String>) -> String{

  var pass: String = ""

  for i in 1 ... 6{
    let ran = Int.random(in: 0 ... 25)
    pass += char_str[ran]
  }

  return pass

}

let arr = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u",
            "v", "w", "x", "y", "z"]



var passCode:String = generate_Random_String(arr)
//var count: Int = 0
/*
while !passCode.hasPrefix("shahab"){
  count += 1
  passCode = generate_Random_String(arr)

}
*/
//print (type(of: arr))
print ("The Password is: \(passCode)") //| Generated in \(count) iterations")
