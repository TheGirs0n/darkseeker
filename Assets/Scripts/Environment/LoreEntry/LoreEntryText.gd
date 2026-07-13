extends CanvasLayer
class_name LoreEntryText

@export var lore_entry_title : RichTextLabel
@export var lore_entry_text : RichTextLabel

signal lore_closed

func set_title(title : String):
	lore_entry_title.text = title
	
	
func set_text(text : String):
	lore_entry_text.text = text


func close_pressed() -> void:
	queue_free()
	lore_closed.emit()
