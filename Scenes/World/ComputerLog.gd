extends Node2D

@onready var logContainer = $PanelContainer
@onready var logBook = $PanelContainer/Label

var toPrint : String

func _ready():
	var i = randi_range(0, 14)
	match i:
		1:
			toPrint = "June 20th - Guyana, South America
	We’ve been sent on a research expedition. Hopefully we can find something of note, maybe a new type of spider that my boss can name after himself."
		2:
			toPrint = "June 28th - Guyana, South America
	The local population doesn’t seem to like us too much, but it hasn’t caused many problems yet."
		3:
			toPrint = "July 5th - Guyana, South America
	A new unique organism was discovered deep in the jungle. It seems to be quite promising. "
		4:
			toPrint = "July 8th - Guyana, South America
	This entity has properties unlike any we’ve ever studied. It can adapt and react to stimuli in ways that appear to be transformative."
		5:
			toPrint ="July 28th - Facility, Undisclosed
	We’ve brought the subject back with us. It’s quite remarkable, DNA tests show that it can modify its genetic code in response to stimuli. Further tests are needed."
		6:
			toPrint = "August 5th - Redacted
	Redacted. Redacted. Redacted. Redacted. Redacted. Redacted. Redacted. Redacted. Redacted."
		7:
			toPrint = "August 14th - Facility, Undisclosed
	We’ve called the organism Abe. Abe seems to absorb a sample of any new organic matter that it comes into contact with. It’s unclear what it is entirely capable of."
		8:
			toPrint = "August 28th - Redacted.
	Redacted. Redacted. Redacted. Redacted. Redacted. Redacted. Redacted. Redacted. Redacted. Redacted. Redacted. Redacted."
		9:
			toPrint = "Sept 1st - Facility, Undisclosed
	Some of the DNA samples we took have started to grow. We’ve incinerated all but one, and it’s being held in containment for study."
		10:
			toPrint = "Oct 31st - Facility, Undisclosed
	The government has ordered us to investigate potential military applications of Abe. It seems plausible, but there’s no guarantee that it’s intelligent, or would show any allegiance to us."
		11:
			toPrint = "Nov 2nd - Facility, Undisclosed
	Abe has consumed a researcher. There is nothing left of him, not even a drop of blood. "
		12:
			toPrint = "Nov 3rd - Facility, Undisclosed
	I’ve asked for a shutdown of our program, but the government has demanded we continue our research. They believe that Abe can be used for untraceable assassinations. I pleaded with them, but it was no use."
		13:
			toPrint = "Nov 5th - Facility, Undisclosed
	I have destroyed Abe. It screamed my name while it died. It knew my name. It could talk. I will now do what needs to be done."
		_:
			toPrint = "entry reacted"
	logBook.text = toPrint
	pass # Replace with function body.



func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		logContainer.visible = true
		$AudioStreamPlayer.play()


func _on_area_2d_body_exited(body):
	if body.is_in_group("player"):
		logContainer.visible = false
