# AnimationDemo
I started this demo to learn the built-in animation methods in UIKit. 

![home screen](Assests/homescreen.png)
![secondary screen](Assests/secondaryscreen.png)

## Snippet
Here is a snippet of some code I created to animate the imageViews I used in the secondary screen.

'''swift
ronImage1.isUserInteractionEnabled = true

let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(PulseController.addPulse))
        tapGestureRecognizer.numberOfTapsRequired = 1
        ronImage1.addGestureRecognizer(tapGestureRecognizer)
        
@objc func addPulse() {
        let pulse = PulseAnimation(numberOfPulses: 1, radius: 110, position: ronImage1.center)
        pulse.animationDuration = 0.8
        pulse.backgroundColor = UIColor.blue.cgColor
        
        self.view.layer.insertSublayer(pulse, below: ronImage1.layer)
    }
'''

## GIF

![gif](Assests/app.gif)
