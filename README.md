# Adding support for interfaces in GDScript

This script is designed to add the functionality to implement an interface-like structure (ILS) to your GDScript Godot project until an official solution is made available.

ILS's are primarily useful for implementing functionality and data storage that needs to function on multiple object or data types.  

## How to use

### Installing the interfaces script
Copy the i_interface_template.gd script into a directory named script_templates directly off your projects base directory (res://).

### Defining custom interfaces
To create a new ILO simply create a new script that extends Node, in the new script dialog, select the "Node: Interface Template" Template and click Create.

Add the string name of each function that the ILO will proxy to the method_list String Array.
At the end of the file, add each function and proxy it to the parent using something like:  
For non-void return types:
    func is_selected() -> bool:
        return owner.is_selected()
for void return types:
    func select() -> void:
	    owner.select() 

Finally, for each object type that you want to implement the features of the ILO, simply add the i_ilo_name script as a direct child of the 

TBC:

### Checking if a node implements a custom interface you created
To check if a node implements a custom interface you defined above,
you may type something like the following anywhere in your codebase:

    if Interface.node_implements_interface(myNode, Interface.ExampleInterface):
      ...
