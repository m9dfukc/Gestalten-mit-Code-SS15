// Variable & Types:
// A variable holds a value so you can access that value later on
// Every variable needs to have a 'type' which descripes it's content (String f.e.)
String str = "hello";
int number = (1 + 2) + 1;
float floatingNumber = 1.0;
boolean bool = false;

// Convert one type into another:
float stillFloatingNumber = (float)1 + 2.0;
int stillIntegernumber = (int)1.0 + 2;

// Print the stuff to the console (lower bottom)
println(str);
println(number);
println(floatingNumber);
println(bool);
println(stillFloatingNumber);
println(stillIntegernumber);

// Reassign variables to new values:
// See there is no new type definition, we use the old 'str' variable
// and assign a new value
str = "goodbye";
println(str);
