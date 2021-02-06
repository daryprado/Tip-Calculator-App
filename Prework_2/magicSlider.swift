//
//  ImageThumbSlider.swift
//  Prework_2
//
//  Created by Darielys Prado on 2/4/21.
//

import UIKit

@IBDesignable

class magicSlider: UISlider {

    @IBInspectable var thumbImage: UIImage? {
        didSet {
            setThumbImage(thumbImage, for: .normal)
            
        }
    }
    /*@IBInspectable var thumbHighlighted: UIImage? {
        didSet {
            setThumbImage(thumbHighlighted, for: .highlighted)
            
        }
    }*/

}
