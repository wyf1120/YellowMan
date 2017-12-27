//
//  ViewController.swift
//  Minions
//
//  Created by 吴宇飞 on 2017/12/27.
//  Copyright © 2017年 gyd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var bodyLayer:CAShapeLayer?
    let r:CGFloat = 100.0
    let startX:CGFloat = 100.0
    let startY:CGFloat = 120.0
    var eyeRaduis:CGFloat?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawBody(rect: self.view.bounds)
        drawEye(rect: self.view.bounds)
        drawMouth()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    //画身体
    func drawBody(rect:CGRect) -> () {
        bodyLayer = CAShapeLayer();
        
        let patch = UIBezierPath()
        patch.move(to: CGPoint(x: startX, y: startY))
        patch.addArc(withCenter: CGPoint(x: startX+r, y: startY), radius: r, startAngle: 0, endAngle: CGFloat(Double.pi), clockwise: false)
        patch.addLine(to: CGPoint(x: startX+r*2, y: startY));
        patch.addLine(to: CGPoint(x: startX+r*2, y: startY+r))
        patch.addArc(withCenter: CGPoint(x: startX+r, y: startY+r), radius: r, startAngle: 0, endAngle: CGFloat(Double.pi), clockwise: true)
        patch.addLine(to: CGPoint(x: startX, y: startY+r))
        patch.addClip()
        patch.lineCapStyle = .square
        bodyLayer?.path = patch.cgPath
        bodyLayer?.fillColor = UIColor.yellow.cgColor
        self.view.layer.addSublayer(bodyLayer!)
    }
    
    //眼睛
    
    func drawEye(rect:CGRect) -> () {
        let eyeLayer = CALayer()
        eyeLayer.bounds = CGRect(x: 0, y: 0, width: r*2, height: 20);
        eyeLayer.position = CGPoint(x: startX+r, y: startY+10);
        eyeLayer.backgroundColor = UIColor.black.cgColor
        bodyLayer?.addSublayer(eyeLayer)
        
        for index in 0..<3 {
            let eyeLayer1 = CAShapeLayer()
            if index == 0
            {
                eyeRaduis = r*0.5
                eyeLayer1.fillColor = UIColor.black.cgColor
            }
            else if index == 1
            {
                eyeRaduis = r*0.4
                eyeLayer1.fillColor = UIColor.white.cgColor
            }
            else if index == 2
            {
                eyeRaduis = r*0.2
                eyeLayer1.fillColor = UIColor.gray.cgColor
            }
            eyeLayer1.path = drawEye1(point: CGPoint(x: startX+r, y: startY+10), radius: eyeRaduis!).cgPath
            bodyLayer?.addSublayer(eyeLayer1);
        }
    }
    
    func drawEye1(point:CGPoint ,radius:CGFloat) -> UIBezierPath {
        let path = UIBezierPath(arcCenter: point, radius: radius, startAngle: 0, endAngle: CGFloat(Double.pi*2), clockwise: true)
        return path
    }
    
    //画嘴巴
    func drawMouth() -> () {
        let startPoint = CGPoint(x: 150, y: 250)
        let controlPoint = CGPoint(x: 200, y: 270)
        let endPoint = CGPoint(x: 250, y: 250)
        let path = UIBezierPath()
        path.lineWidth = 3
        path.move(to: startPoint)
        path.addQuadCurve(to: endPoint, controlPoint: controlPoint)
        //path.addCurve(to: startPoint, controlPoint1: controlPoint, controlPoint2: endPoint)
        
        let mouthLayer = CAShapeLayer()
        mouthLayer.path = path.cgPath
        mouthLayer.fillColor = UIColor.clear.cgColor
        mouthLayer.strokeColor = UIColor.black.cgColor
        bodyLayer?.addSublayer(mouthLayer)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

