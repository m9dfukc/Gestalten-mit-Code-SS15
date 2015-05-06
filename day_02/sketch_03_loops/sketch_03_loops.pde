// Loops help to interate some block of code
// There are two types of 'loops' available;
// the 'for loop' and the 'while loop'

/* Anatomy of a for loop:
//  - start   - condt - count
for (int i = 0; i < 20; i++) {
  // as long as the condition is true the for loop loops
  println("Hello");
  println(i);
}
*/

/* Anatomy of a while loop:
//    -     condition     -
while (someBooleanVariable) {
  // as long as the someBooleanVariable is 'true'
  // the while loop will loop
  
  // as soon as we set someBooleanVariable = false
  // the while loop will stop looping
}
*/

int number = 0;
boolean isExpressionTrue = true;

void setup() {

  println("comming from a while loop:");
  while(isExpressionTrue) {
    println(number);
    if (number > 100) {
       isExpressionTrue = false;
    }
    number = number + 1;
  }
  
  println("comming from a for loop:");
  for (int i = 0; i < 100; i = i + 1) {
    println(i);
  }
  
  println("finished");
}
