//
//  UILabelExtension.swift
//  NewsAppMVVM
//
//  Created by Иван Тиминский on 14.12.2021.
//

import Foundation
import UIKit

extension UILabel {
    func makeShadowForText(color: UIColor) {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = 0.7
        layer.shadowRadius = 1
        layer.shadowOffset = CGSize(width: 0, height: 0.1)
    }
    
    convenience init(text: String, fontSize: CGFloat, fontName: String, textColor: UIColor, textAlignment: NSTextAlignment, shadowColor: UIColor?, numberOfLines: Int) {
        self.init()
        self.text = text
        self.font = .init(name: fontName, size: fontSize)
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
        
        guard let shadowColor = shadowColor else {
            return
        }
        makeShadowForText(color: shadowColor)
    }
    

}
