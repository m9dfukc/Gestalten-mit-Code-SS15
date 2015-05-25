/* Array Basics
 *
 * A array is basically a "stack" of values in "one" array variable.
 * Arrays need to be declared in a slightley differnt way that a "normal" variable.
 * 
 * Carefully read the reference documentation:
 * https://processing.org/reference/Array.html
 */
 
 // int[] -> declares that we wanna have an array with "integers" filled in,
 // new int[3] -> we wanna have a array ("stack") with 3 values in there
 int[] numbers = new int[3];
 
 void setup() {
   // let's fill in our values
   numbers[0] = 1;
   numbers[1] = 2;
   numbers[2] = 3;
   
   // let's access one element in the array, not [1] gives us the second element
   print("Print out the second element in the array: ");
   println(numbers[1]);
   
   
   println("-----------------------------------------");
   
   
   // let's output all of it's elements, use ".length" therefore
   println("Print out all elements of the array:");
   for(int i = 0; i < numbers.length; i++) {
     print("Value at position " + i + ": ");
     println(numbers[i]); 
   }
   
   
   println("-----------------------------------------");
   
   
   // let's reassign a value in the array
   numbers[2] = 9999;
   print("We just reassigned the last element in the array: ");
   println(numbers[2]);
   
 }
