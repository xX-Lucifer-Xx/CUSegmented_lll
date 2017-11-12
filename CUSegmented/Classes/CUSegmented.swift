//
//  CUSegmented.swift
//  CUSegmented
//
//  Created by Alexander Ruduk on 12.11.2017.
//  Copyright © 2017 Alexander Ruduk. All rights reserved.
//

import UIKit

@IBDesignable
class CUSegmented: UIControl {
    var buttons = [UIButton]()
    var selector: UIView!
    var selectedSegmentIndex = 0
    
    @IBInspectable
    var commaSeparatedButtonTitles: String = "" {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable
    var textColor: UIColor = .lightGray {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable
    var textFont: UIFont = .systemFont(ofSize: 14) {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable
    var selectorColor: UIColor = .darkGray {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable
    var selectorTextColor: UIColor = .white {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        buttons.removeAll()
        subviews.forEach { $0.removeFromSuperview() }
        
        let buttonTitles = commaSeparatedButtonTitles.components(separatedBy: ",")
        for buttonTitle in buttonTitles {
            let button = UIButton(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            button.setTitleColor(textColor, for: .normal)
            button.titleLabel?.font = textFont
            button.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
            buttons.append(button)
        }
        
        buttons[0].setTitleColor(selectorTextColor, for: .normal)
        
        let selectorWidth = frame.width / CGFloat(buttonTitles.count)
        selector = UIView(frame: CGRect(x: 0, y: 0, width: selectorWidth, height: frame.height))
        selector.backgroundColor = selectorColor
        addSubview(selector)
        
        let sv = UIStackView(arrangedSubviews: buttons)
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .fillEqually
        addSubview(sv)
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        sv.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        sv.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        sv.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        setNeedsLayout()
    }
    
    override func draw(_ rect: CGRect) {
        updateView()
    }
    
    func setSelectedItems(value: Int, animmated: Bool) {
        if value > buttons.count {
            return
        }
        setSelectedItems(sender: buttons[value], animmated: animmated)
        
        sendActions(for: .valueChanged)
    }
    
    @objc func buttonTapped(sender: UIButton) {
        setSelectedItems(sender: sender, animmated: true)
        
        sendActions(for: .valueChanged)
    }
    
    private func setSelectedItems(sender: UIButton, animmated: Bool) {
        for (buttonIndex, btn) in buttons.enumerated() {
            btn.setTitleColor(textColor, for: .normal)
            
            if btn == sender {
                selectedSegmentIndex = buttonIndex
                let selectorStartPosition = frame.width / CGFloat(buttons.count) * CGFloat(buttonIndex)
                if animmated {
                    UIView.animate(withDuration: 0.3, animations: {
                        self.selector.frame.origin.x = selectorStartPosition
                    })
                } else {
                    self.selector.frame.origin.x = selectorStartPosition
                }
                
                btn.setTitleColor(selectorTextColor, for: .normal)
            }
        }
    }
    
}

