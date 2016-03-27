- Steve Dekorte invented the Io language in 2002
- Io is a prototype language like Javascript(every object is a clone of another)
- Everything in Io is an object(lists, strings, files even messages!!)
- Prototype-based is a style of OOP in which behaviour re-use(inheritance) is performed
via a process of cloning existing objects that serve as prototypes
- Io knows nothing about classes. A prototype is both a class and an instance
- To get a new instance you just clone an existing prototype

```Io
"Hello World" print
```
// The "Hello World" object - which happens to be a string - is being sent the message print.   
// Receivers go on the left and messages on the right

## Create a simple object and show how to use it
```Io
Account := Object clone
```
// Account is defined as a clone of Object - sending a clone message to Object prototype
```Io
Account balance := 0
```
// := the initialization assignment operator creates a new slot on Account called balance   
// Account holds one slot named balance with the value of zero   
// A slot associates a value to a name within the context of a prototype   
// Slots can contain values or methods   
```Io
Account deposit := method(v, balance = balance + v)
Account withdraw := method(v, balance = balance - v)
Account show := method(writeln("Account balance: $", balance))
myAccount := Account clone
myAccount show
myAccount deposit(10)
myAccount show
```
