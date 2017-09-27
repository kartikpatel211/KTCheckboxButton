# KTCheckboxButton
Custom control Checkbox Button in Swift

Adopt CheckboxButtonDelegate into your class to get checked/unchecked events.
 
Take a UIButton in storyboard and set CheckboxButton as a class in identifier inspector. Bind UIButton control into your controller class as below.
 
@IBOutlet weak var cbButtonOne: CheckboxButton!
 
Now assign your class as delegate of control to get events. 
cbButtonOne.delegate = self
 
Add delegate function into your class that will called when user check or uncheck the CheckBox.
 
func button(button : CheckboxButton, didSelected: Bool) -> Void {
  print("button: \(button.titleLabel?.text) - selected: \(didSelected)")
}
