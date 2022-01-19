//
//  ViewController.swift
//  Tank
//
//  Created by mac on 2022/1/1.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    var isActionPlaying: Bool = false
    //@IBOutlet var arView: ARView!
    @IBOutlet weak var arView: ARView!
    var tankAnchor:TinyToyTank._TinyToyTank?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the "Box" scene from the "Experience" Reality File
        //let boxAnchor = try! TinyToyTank.loadBox()
        tankAnchor = try! TinyToyTank.load_TinyToyTank()
        tankAnchor!.turret?.setParent(
          tankAnchor!.tank, preservingWorldTransform: true)
        tankAnchor?.actions.actionComplete.onAction = { _ in
          self.isActionPlaying = false
        }
        // Add the box anchor to the scene
        //arView.scene.anchors.append(boxAnchor)
        arView.scene.anchors.append(tankAnchor!)
    }
    @IBAction func cannonFire(_ sender: Any) {
        if self.isActionPlaying { return }
        else { self.isActionPlaying = true }
        tankAnchor!.notifications.cannonFire.post()
    }
    @IBAction func tankForward(_ sender: Any) {
        if self.isActionPlaying { return }
        else { self.isActionPlaying = true }
        tankAnchor!.notifications.tankForward.post()
    }
    @IBAction func tankLeft(_ sender: Any) {
        if self.isActionPlaying { return }
        else { self.isActionPlaying = true }
        tankAnchor!.notifications.tankLeft.post()
    }
    @IBAction func tankRight(_ sender: Any) {
        if self.isActionPlaying { return }
        else { self.isActionPlaying = true }
        tankAnchor!.notifications.tankRight.post()
    }
    
    @IBAction func turretLeft(_ sender: Any) {
        if self.isActionPlaying { return }
        else { self.isActionPlaying = true }
        tankAnchor!.notifications.turretLeft.post()

    }
    @IBAction func turretRight(_ sender: Any) {
        if self.isActionPlaying { return }
        else { self.isActionPlaying = true }
        tankAnchor!.notifications.turretRight.post()
    }
}
