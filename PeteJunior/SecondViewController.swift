import UIKit

class SecondViewController: UIViewController {
    var superpowered:Superpowered!
    var displayLink:CADisplayLink!
    var layers:[CALayer]!

    @IBOutlet weak var nav: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let color:CGColorRef = UIColor(red: 0, green: 0.6, blue: 0.8, alpha: 1).CGColor
        layers = [CALayer(), CALayer(), CALayer(), CALayer(), CALayer(), CALayer(), CALayer(), CALayer()]
        for n in 0...7 {
            layers[n].backgroundColor = color
            layers[n].frame = CGRectZero
            self.view.layer.addSublayer(layers[n])
        }

        superpowered = Superpowered()

        // A display link calls us on every frame (60 fps).
        displayLink = CADisplayLink(target: self, selector: "onDisplayLink")
        displayLink.frameInterval = 1
        displayLink.addToRunLoop(NSRunLoop.currentRunLoop(), forMode: NSRunLoopCommonModes)
    }

    func onDisplayLink() {
        // Get the frequency values.
        let frequencies = UnsafeMutablePointer<Float>.alloc(8)
        superpowered.getFrequencies(frequencies)

        // Wrapping the UI changes in a CATransaction block like this prevents animation/smoothing.
        CATransaction.begin()
        CATransaction.setAnimationDuration(0)
        CATransaction.setDisableActions(true)

        // Set the dimension of every frequency bar.
        let originY:CGFloat = self.view.frame.size.height - 20
        let width:CGFloat = (self.view.frame.size.width - 47) / 8
        var frame:CGRect = CGRectMake(20, 0, width, 0)
        for n in 0...7 {
            frame.size.height = CGFloat(frequencies[n]) * 8000
            frame.origin.y = originY - frame.size.height
            layers[n].frame = frame
            frame.origin.x += width + 1
        }

        CATransaction.commit()
        frequencies.dealloc(8)
        
        //print(frequencies.memory)
    }
}

