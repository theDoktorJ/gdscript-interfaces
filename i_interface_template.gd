# meta-name: Interface Template
# meta-description: Custom interface template for Godot
# meta-default: false
# meta-space-indent: 4

extends _BASE_
class_name _CLASS_

const NAME: StringName = &"_CLASS_"

# List of methods to be checked.  They must be implemented below and proxied to the owner/parent
var method_list: Array[String] = [
	"is_selected",
	"select",
	"deselect",
]

# set to metadata and remove from metadata on the parent
func _notification(what: int) -> void:
	match what:
		NOTIFICATION_PARENTED:
			## Insert itself into parent as a metadata
			get_parent().set_meta(NAME, self)
			
		NOTIFICATION_UNPARENTED:
			## Remove itself from parent as a metadata
			get_parent().set_meta(NAME, null)

func _ready() -> void:
	## set the owner since 
	owner = get_parent()
	## enforce methods.
	for method_name: String in method_list:
		if (not owner.has_method(method_name)):
			_fail(method_name)
		

# fail and log failure.
func _fail(method_name: String) -> void:
	var script_class: String = (get_script() as Script).get_global_name()
	var message: String = script_class + ": Class implementing " + script_class + " needs " + method_name + " method."
	assert(false, message)
# Log the failure
#	Log.log_error(self.get_path(), message)

# implement and proxy enforced methods.
# Example method with return
func is_selected() -> bool:
	return owner.is_selected() ## proxying the call to parent
	
# implement and proxy enforced methods.
# example method with void
func select() -> void:
	owner.select() ## proxying the call to parent
	
# implement and proxy enforced methods.
func deselect() -> void:
	owner.deselect() ## proxying the call to parent
