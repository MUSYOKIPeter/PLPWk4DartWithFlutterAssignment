import 'dart:io';

// Define an interface
abstract class Human {
  void introduce();
}

// Define a base class implementing the Human interface
class Person implements Human {
  // Properties
  String name;
  String phone;
  bool isBachelor;
  int age;

  // Constructor
  Person(this.name, this.phone, this.isBachelor, this.age);

  @override
  void introduce() {
    // Modify the introduction message
    String status = isBachelor ? "Bachelor" : "Student";
    print(
        "Greetings! My name is $name, of mobile number $phone. I am a $status at $age years old.");
  }
}

// Define a subclass that overrides the introduce method
class Student extends Person {
  String school;

  // Constructor
  Student(String name, String phone, int age, bool isBachelor, this.school)
      : super(name, phone, isBachelor, age);

  @override
  void introduce() {
    String status = isBachelor ? "Bachelor" : "Student";
    super.introduce(); // Invoke the superclass method
    print("I am $age years old and a $status at $school.");
  }
}

// Define a class to hold data from a file
class DataFromFile {
  late List<String> lines;

  DataFromFile(String filename) {
    try {
      File file = File(filename);
      lines = file.readAsLinesSync();
    } catch (e) {
      print("Error reading file: $e");
      lines = [];
    }
  }

  void printLines() {
    for (String line in lines) {
      print(line);
    }
  }
}

void main() {
  // Create instances
  Person person = Person("MUSYOKI Peter", "+254 759 988 589", true, 33);
  Student student = Student(
      "WAMBUI Dorcas", "+254 728 284 710", 31, false, "University of Nairobi");

  // Demonstrate method overriding
  person
      .introduce(); // Output: Greetings! My name is MUSYOKI Peter, of mobile number +254 759 988 589. I am a Bachelor at 33 years old.

  student
      .introduce(); // Output: Greetings! My name is WAMBUI Dorcas, of mobile number  +254 728 284 710. I am 31 years old and a Student at the University of Nairobi.

  // Initialize data from a file
  DataFromFile data = DataFromFile("data.txt");
  data.printLines();

  // Demonstrate the use of a loop
  print("Counting from 1 to 5:");
  for (int i = 1; i <= 5; i++) {
    print(i);
  }
}
