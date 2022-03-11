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
        Category(name: "Color Picker", description: "버튼을 클릭하여 랜덤 RGB값의 색상 추출"),
        Category(name: "What To Eat", description: "카테고리 선택을 통해 무엇을 먹을지 추천")
    ]
    
    private init() { }
}
