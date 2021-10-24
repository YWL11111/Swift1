//
//  ViewController.swift
//  Swift1
//
//  Created by 叶宛灵 on 2021/9/20.
//  Copyright © 2021 叶宛灵. All rights reserved.
//

import UIKit
import SDWebImage
//https://smashinghub.com/wp-content/uploads/2014/08/cool-loading-animated-gif-1.gif
let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height

class ViewController: UIViewController {
    let label1 = UILabel(frame: CGRect.init(x: 20, y: 30, width: 100, height: 30))
    let photo1 = UIImageView(frame: CGRect.init(x: 20, y: 70, width: 250, height:400))
    let gif2 = FLAnimatedImageView(frame: CGRect(x: 20, y: 70, width: 250, height:400))
    let view1 = UIView(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: screenHeight))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        
        view1.backgroundColor = UIColor.yellow
        view.addSubview(view1)
        
        label1.text = "ywl"
        label1.backgroundColor = UIColor.green
        label1.textAlignment = .center
        label1.textColor = UIColor.black
        view1.addSubview(label1)
      
        photo1.image = UIImage(named: "ywl")
        photo1.contentMode = .scaleAspectFit
        photo1.center = view1.center
        view1.addSubview(photo1)
        let button1 = UIButton(frame: CGRect.init(origin: CGPoint.init(x: 130, y: 50), size: CGSize.init(width: 100, height: 30)))
        button1.setTitle("bbbbton", for: UIControl.State.normal)
        button1.addTarget(self, action: #selector(button1Tap), for: UIControl.Event.touchUpInside)
        view.addSubview(button1)
        button1.backgroundColor = UIColor.blue
        button1.setTitleColor(.black, for: .normal)
        
        let gifImage = FLAnimatedImage(animatedGIFData: try! Data(contentsOf: URL(string: "https://smashinghub.com/wp-content/uploads/2014/08/cool-loading-animated-gif-1.gif")!))

        gif2.animatedImage = gifImage
        self.gif2.isHidden = true

        view1.addSubview(gif2)
        gif2.center = view1.center

    }
    
    @objc func button1Tap() {
        let title = label1.text
        
        if title == "ywl" {
            self.photo1.alpha = 0
            UIView.animate(withDuration: 3, animations: {
                self.gif2.isHidden = false
                self.view1.backgroundColor = .purple
            }) { (_) in
                self.gif2.isHidden = true
                self.photo1.image = UIImage(named: "wjk")
                self.photo1.alpha = 1
                self.label1.text = "wjkaaaa"
            }
        }
        else {
            self.photo1.alpha = 0
            UIView.animate(withDuration: 3.0, animations: {
                self.gif2.isHidden = false
                self.view1.backgroundColor = .yellow
            }) { (_) in
                self.gif2.isHidden = true
                self.label1.text = "ywl"
                self.photo1.image = UIImage(named: "ywl")
                self.photo1.alpha = 1
            }
        }
    }
    
    
}

