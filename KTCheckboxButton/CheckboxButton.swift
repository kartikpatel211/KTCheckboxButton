//
//  CheckboxButton.swift
//  KTCheckboxButton
//
//  Created by Kartik Patel on 12/21/16.
//  Copyright © 2016 Kartik Patel. All rights reserved.
//

import UIKit

protocol CheckboxButtonDelegate {
    func button(button : CheckboxButton, didSelected: Bool) -> Void
}

class CheckboxButton: UIButton {
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    var delegate : CheckboxButtonDelegate?
    
    var fillContentLayer = CAShapeLayer.init()
    let fillContentStrokeColorWhenSelected = UIColor.green.cgColor
    let fillContentFillColorWhenSelected = UIColor.green.cgColor
    let fillContentStrokeColorWhenNotSelected = UIColor.clear.cgColor
    let fillContentFillColorWhenNotSelected = UIColor.clear.cgColor
    
    override init(frame : CGRect){
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    func initialize(){
        let contentBtnWidth : CGFloat = 20.0
        
        let outerBorderContentMargin : CGFloat = 1.0
        let outerBorderContentLineWidth : CGFloat = 2.0
        let outerBorderContentStrokeColor = UIColor.black.cgColor
        let outerBorderContentFillColor = UIColor.clear.cgColor
        
        let fillContentMargin : CGFloat = 2.0
        
        
        let originYForOuterBorder = (self.frame.size.height - contentBtnWidth)/CGFloat(2.0)
        
        let outerBorderWidth = contentBtnWidth - (outerBorderContentMargin * 2)
        
        let fillContentOriginX = outerBorderContentMargin + outerBorderContentLineWidth + fillContentMargin
        let fillContentOriginY = originYForOuterBorder + outerBorderContentLineWidth + fillContentMargin
        let fillContentWidth = contentBtnWidth - ((outerBorderContentMargin + outerBorderContentLineWidth + fillContentMargin) * 2)
        
        let outerContentPath = UIBezierPath.init(rect: CGRect.init(x: outerBorderContentMargin, y:originYForOuterBorder, width: outerBorderWidth, height: outerBorderWidth))
        let outerContentLayer = CAShapeLayer.init()
        outerContentLayer.path = outerContentPath.cgPath
        outerContentLayer.lineWidth = outerBorderContentLineWidth
        outerContentLayer.fillColor = outerBorderContentFillColor
        outerContentLayer.strokeColor = outerBorderContentStrokeColor
        self.layer.addSublayer(outerContentLayer)
        
        let fillContentPath = UIBezierPath.init(rect: CGRect.init(x: fillContentOriginX, y: fillContentOriginY, width: fillContentWidth, height: fillContentWidth))
        fillContentLayer.path = fillContentPath.cgPath
        fillContentLayer.lineWidth = outerBorderContentLineWidth
        fillContentLayer.fillColor = fillContentFillColorWhenNotSelected
        fillContentLayer.strokeColor = fillContentStrokeColorWhenNotSelected
        self.layer.addSublayer(fillContentLayer)
        
        self.titleEdgeInsets = UIEdgeInsetsMake(0, contentBtnWidth + 5, 0, 0)
        
        self.toogleState()
        
        self.addTarget(self, action: #selector(pressed), for: .touchUpInside)
    }
    
    func pressed(){
        if self.isSelected {
            self.isSelected = false
        } else {
            self.isSelected = true
        }
    }
    
    override var isSelected: Bool {
        didSet {
            toogleState()
        }
    }
    func toogleState() {
        if state.contains(.selected) {
            fillContentLayer.fillColor = fillContentFillColorWhenSelected
            fillContentLayer.strokeColor = fillContentStrokeColorWhenSelected
            delegate?.button(button: self, didSelected: true)
        } else {
            fillContentLayer.fillColor = fillContentFillColorWhenNotSelected
            fillContentLayer.strokeColor = fillContentStrokeColorWhenNotSelected
            delegate?.button(button: self, didSelected: false)
        }
    }
}
