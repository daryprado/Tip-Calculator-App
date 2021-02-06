//
//  RetroMode.swift
//  Prework_2
//
//  Created by Darielys Prado on 2/6/21.
//

//code extracted from https://www.makeschool.com/academy/track/standalone/build-a-tip-calculator-in-swift-4/theming and modifications were made to adjust to what i wanted to do

import Foundation

import UIKit

struct RetroMode {

    static let normal = RetroMode(isDefaultStatusBar: true,
                                 //  primaryFont: .systemFont(ofSize: 22.0),
                                  //primaryFont: .TextStyle(rawValue: "AppleSDGothicNeo-Thin"),
                                  primaryColor: .white,
                                  primaryTextColor: .black,
                                  secondaryColor: .systemTeal,
                                  outputColor: .systemIndigo,
                                  outputTextColor: .black,
                                  secondTextColor: .black)

    static let retro = RetroMode(isDefaultStatusBar: false,
                                 // primaryFont: .preferredFont(forTextStyle: UIFont.TextStyle(rawValue: "Menlo")),
                                 primaryColor: .white,
                                 primaryTextColor: .red,
                                 secondaryColor: .systemGray4,
                                 outputColor: .systemGray4,
                                 outputTextColor: .systemGreen,
                                 secondTextColor: .systemBlue)


    let isDefaultStatusBar: Bool
    
    //let primaryFont: UIFont

    let primaryColor: UIColor
    let primaryTextColor: UIColor

    let secondaryColor: UIColor

    let outputColor: UIColor
    let outputTextColor: UIColor
    let secondTextColor: UIColor

}
