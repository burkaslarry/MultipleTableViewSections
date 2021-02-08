//
//  SectionData.swift
//  tablecell
//
//  Created by Larry on 8/2/2021.
//

import Foundation

class Section {
    let title: String
    let options: [Int]
    var isOpened = false
    
    init(title: String, options:[Int] , isOpened: Bool = false) {
        self.title = title
        self.options = options
        self.isOpened = isOpened
    }
}

