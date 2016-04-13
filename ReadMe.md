- Steve Dekorte invented the Io language in 2002
- Io is a prototype language like Javascript(every object is a clone of another)   
-- Not compiled into a binary state   
-- Uses VM to directly interpret and execute Io source code   
-- Everything is an object   
- Everything in Io is an object(lists, strings, files even messages!!)
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
-- You can create new custom objects by cloning
```Io
person := Object clone
```
--Then object can be customised by assigning values to its slots
```Io
person name := "Gavin"
```
(Think of a slot as a key hash)     
-- We can also add a method to the object
```Io
person welcome := method(writeln("Welcome, ", self name))
```
-- Send welcome message to our person object
```Io
person welcome
```
-- Rename the person to gavin just by assigning it to a new slot
```Io
gavin := person
```
(Gavin and person are now both referring to the same object)    
    
-- How about creating another person?   
-- We need to just clone the object into another one
```Io
john := gavin clone
```
-- We customise john cloned from gavin with its name
```Io
john name := "John"   
john welcome
```
How its done:-   
john is cloned from gavin so the clone dispatches its message throught its prototype which is gavin.   
   
   



## Create a simple object and show how to use it
```Io
Account := Object clone
```
Account is defined as a clone of Object - sending a clone message to Object prototype
```Io
Account balance := 0
```
:= the initialization assignment operator creates a new slot on Account called balance   
Account holds one slot named balance with the value of zero   
A slot associates a value to a name within the context of a prototype   
Slots can contain values or methods   
```Io
Account deposit := method(v, balance = balance + v)
Account withdraw := method(v, balance = balance - v)
Account show := method(writeln("Account balance: $", balance))
myAccount := Account clone
myAccount show
myAccount deposit(10)
myAccount show
```
## Conditionals and Loops
```Io
i := 1
while(i <= 10, i println; i = i + 1);  
for(i, 1, 10, i println);
```
A while loop takes a condition and a message to evaluate - a ; conactenates two distince messages   
The for loop takes name of counter, the first value, the last value and a message sender  
```Io
 for(i, 1, 10, 2, i println, "extra argument");
```
With an optional increment and extra argument.   
Remove the optional increment and your extra message becomes the message - everything shifted to the left     
and your working in steps of i println, which returns i.   
```Io
if(condition, true code, false code)
```
The if control structure is implemented as a function   

## Messages   
**When does Io compute a message?**   
Most languages pass arguments as values on stacks.   
Java computes each value of a parameter first and then places those values on the stack.   
Io doesnt.   
It passes the message itself and the context.   
Then, the recievers evaluate the message.  
***Example***
```Io
unless := method(
    (call sender doMessage(call message argAt(0))) ifFalse(
    call sender doMessage(call message argAt(1))) ifTrue(
    call sender doMessage(call message argAt(3)))
)

unless(1 ==2, write("One is not two\n"), write("one is two"))
```
doMessage executes an arbitrary message.    
Io is interpreting the message parameters but delaying binding and exceution.    
In a typical object-oriented language:   
    - interpreter or compiler would compute all the arguments
    - including both code blocks
    - place the return values on the stack.
    








