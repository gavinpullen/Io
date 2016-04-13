# Prints the slots available on each prototype up the chain. 
Object ancestors := method( 
   prototype := self proto   
    if(prototype != Object, 
        writeln("Slots of ", prototype type, "\n---------------") 
            prototype slotNames foreach(slotName, writeln(slotName)) 
        writeln 
            prototype ancestors 
    ) 
) 
 
Vehicle := Object clone 
Vehicle description := method( 
    "Anything that moves and carries host(s)" 
) 
 
Lamborgini := Vehicle clone 
Lamborgini sound := method( 
    "vroooom" println 
) 
 
car := Lamborgini clone 
car model := method( 
    "Aventador" println 
) 

car ancestors
