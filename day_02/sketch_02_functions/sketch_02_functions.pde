// functions encapsulate code blocks for reuse and for
// structuring the code in a more generic way

/* anatomy of a function:
int functionName(int param1, int param2, ...) { // starts with return type, funtion Name, passing parameters
  // code to be executed ... does something with the parameters eventually
  return 1; // someNumber of type int (or what ever is defined as return type
}
*/


// this is a basic hello world function
// a function needs to be declared (done here) 
// and then called (done at the bottom line 29)
// to execute it's 'body'
void thisIsAFuntion() {
  println("hello this is a function");
}

// this function takes an parameter
void thisFuntionTakesAnArgument(int number) {
  println(number);
}

// this function takes a parameter and returns something
int square(int number) {
  int squared = number * number;
  return squared; 
}

// function with more than one parameter
int multiply(int number, int number2) {
  return number * number2; 
}

// execute the functions
void setup() {
  thisIsAFuntion();
  thisFuntionTakesAnArgument(10);
  int number = square(5);
  println(number);
  
  println( multiply(5, 3) );
}
