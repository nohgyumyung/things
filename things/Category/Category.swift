//
//  Category.swift
//  things
//
//  Created by 노규명 on 2022/03/03.
//

import Foundation

struct Category {
    var name: String
    var description: String
}

class CategoryList {
    static let shared = CategoryList()
    
    let categoryList: [Category] = [
        Category(name: "Color Picker", description: "버튼을 클릭하면 랜덤 RGB값을 추출하여 색상을 보여줌")
    ]
    
    private init() { }
}
