//  ViewController.swift
//  soccerrsimulator
//
//  Created by Sirini Karunadasa on 7/5/21.
//



import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var screenEdgeRecognizer: UIScreenEdgePanGestureRecognizer!
    var currentRadius:CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Screen Edge Pan Gestures
        screenEdgeRecognizer = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(ViewController.rotateBall(_:))) // #selector(rotateBall(_:)))   // Selector(("rotateBall:")))
        screenEdgeRecognizer.edges = .left
        view.addGestureRecognizer(screenEdgeRecognizer)
    }

    @objc func rotateBall(_ sender: UIScreenEdgePanGestureRecognizer) {
        //
        if sender.state == .ended {
            
            if self.currentRadius==360.0 {
                self.currentRadius=0.0
            }
            
            UIView.animate(withDuration: 1.0, animations: {
                self.currentRadius += 90.0
                self.imageView.transform = CGAffineTransform(rotationAngle: (self.currentRadius * CGFloat(Double.pi)) / 180.0)
            })
        }
      }

}

//based on open scorce code from https://github.com/soonin/IOS-Swift-ScreenEdgePanGestures

