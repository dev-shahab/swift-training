class Person{
  var name:String?
  init(_ name: String)
  {
    self.name = name
  }
}



class Employee{

  var name:Person?
  var emp_id:Int?
  var salary:Int?
  var designation:String?
  var emp_stat: String { //Variable Computer
    if (name != nil && designation != nil)
    {
      return "\(name!.name!) is a \(designation!)"
    }
    else if (name != nil) {
      return "\(name!.name!) is not assigned any Designation yet!"
    }
    else{
      return "Blank"
    }
  }
  init(_ name:String, _ id: Int, _ salary:Int,_ designation: String){
    self.name = Person(name)
    self.emp_id = id
    self.salary = salary
    //self.designation = designation
  }

}



print("Bismillah")

let e1 = Employee("Shahab", 123, 100000, "Associate Software Engineer")
print(e1.emp_stat)
