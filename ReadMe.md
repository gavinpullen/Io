- Steve Dekorte invented the Io language in 2002
- Io is a prototype language like Javascript(every object is a clone of another)   
    Not compiled into a binary state   
    Uses VM to directly interpret and execute Io source code     
- Everything in Io is an object(lists, strings...)
- Every interaction with an object is a message
- Prototype-based is a style of OOP in which behaviour re-use(inheritance) is performed
via a process of cloning existing objects that serve as prototypes
- Io knows nothing about classes. A prototype is both a class and an instance
- To get a new instance you just clone an existing prototype

```Io
"Hello World" print
```
The "Hello World" object - which happens to be a string - is being sent the message print.   
Receivers go on the left and messages on the right

```Io
2 + 5
```
The message + is being sent to the object 2 with 5 as a parameter.   
Rewritten as 2 + (5)   
The + is a method defined on the number object that takes another number as a parameter.   

```Io
1 + 5 * 8 + 1
```
Translates to
```Io
1 + (5 * (8) + 1)
```
**Messages can be chained**
```Io
Date now year
```
We send now message to Date object followed by year message which gives the year of current date.
       
You can create new custom objects by cloning
```Io
person := Object clone
```
Then object can be customised by assigning values to its slots
```Io
person name := "Gavin"
```
(Think of a slot as a key hash)    
    
We can also add a method to the object
```Io
person welcome := method(writeln("Welcome, ", self name))
```
Send welcome message to our person object
```Io
person welcome
```
Rename the person to gavin just by assigning it to a new slot
```Io
gavin := person
```
(Gavin and person are now both referring to the same object)    
    
How about creating another person?       
We need to just clone the object into another one
```Io
john := gavin clone
```
We customise john cloned from gavin with its name
```Io
john name := "John"   
john welcome
```
How its done:-   
john is cloned from gavin so the clone dispatches its message throught its prototype which is gavin.   
   
## Conditionals and Loops
**if**   
The if message can be used in this form:    
```Io
if(condition, true code, false code)
```     
Examples:    
```Io
if(a == 10, "a is 10" print)
```
These are the same
```Io
if(y < 10, x := y, x := 0)
x := if(y < 10, y, 0)
```
Conditions can also be used like this
```Io
if(y < 10) then(x := y) else(x := 2)
if(y < 10) then(x := y) elseif(y == 11) then(x := 0) else(x := 2)
```
**for**    
The for loop takes name of counter, the first value, the last value and a message sender 
```Io
for(i, 1, 10, i println)
```
With an optional increment:
```Io
 for(i, 1, 10, 2, i println);
```
## Concurrency
The main components are coroutines, actors and futures.   
**Coroutines**    
The foundation of concurrency is the coroutine. A coroutine provides a way to voluntaily suspend and resume execution of a process. Think of a coroutine as a function with multiple entry and exit points. Each yield will voluntarily suspend the process and transfer to another process.    
    
You can fire a message asynchronously by using @ or @@.    
@ returns a future.    
@@ returns nil and starts the message in its own thread.