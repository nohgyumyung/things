//
//  WhatToEatViewController.swift
//  things
//
//  Created by 노규명 on 2022/03/10.
//

import UIKit
import SnapKit

fileprivate let foodList = ["🍔", "🍕", "🥗", "🍣"]
fileprivate let dessertList = ["🍌", "🍰", "🍭", "🥞"]
fileprivate let heavyList = ["🍔", "🍕", "🍰", "🥞"]
fileprivate let lightList = ["🥗", "🍣", "🍌", "🍭"]

class WhatToEatViewController: UIViewController{
    var foodType: String = ""
    var hungerLevel: String = ""
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.text = "HOW ABOUT..."
        label.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        return label
    }()
    private var foodLabel: UILabel = {
        let label = UILabel()
        label.text = "❔"
        label.font = UIFont.systemFont(ofSize: 200, weight: .regular)
        return label
    }()
    private var pickMenuButton: UIButton = {
        let button = UIButton()
        button.setTitle("Click here to choose menu", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubView()
        addTarget()
        setUpConstraint()
    }
    
    private func addSubView() {
        view.addSubview(contentLabel)
        view.addSubview(foodLabel)
        view.addSubview(pickMenuButton)
    }
    
    private func addTarget() {
        pickMenuButton.addTarget(self, action: #selector(tapMenuSelectionButton), for: .touchUpInside)
    }
    
    private func setUpConstraint() {
        contentLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.centerX.equalToSuperview()
        }
        foodLabel.snp.makeConstraints { make in
            make.top.equalTo(contentLabel.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
        }
        pickMenuButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-150)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc private func tapMenuSelectionButton() {
        let vc = MenuSelectionViewController()
        vc.delegate = self
        vc.foodType = foodType
        vc.hungerLevel = hungerLevel
        self.present(vc, animated: true, completion: nil)
    }
}

extension WhatToEatViewController: MenuSelectionSettingDelegate {
    func menuSetting(foodType: String, hungerLevel: String) {
        self.foodType = foodType
        self.hungerLevel = hungerLevel
        
        var foodCandidates: [String] = []
        
        if foodType == "food" {
            foodCandidates += foodList
        } else {
            foodCandidates += dessertList
        }
        
        if hungerLevel == "high" {
            foodCandidates = foodCandidates.filter { heavyList.contains($0) }
        } else {
            foodCandidates = foodCandidates.filter { lightList.contains($0) }
        }
        
        let foodChosen = foodCandidates.randomElement()
        foodLabel.text = foodChosen
    }
}
