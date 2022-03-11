//
//  MenuSelectionViewController.swift
//  things
//
//  Created by 노규명 on 2022/03/11.
//

import UIKit

fileprivate let foodTypeList = ["food", "dessert"]
fileprivate let hungerLevelList = ["high", "low"]

protocol MenuSelectionSettingDelegate: AnyObject {
    func menuSetting(foodType: String, hungerLevel: String)
}

class MenuSelectionViewController: UIViewController {
    weak var delegate: MenuSelectionSettingDelegate?
    var foodType: String = ""
    var hungerLevel: String = ""
    
    private let VStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 20
        return stackView
    }()
    private let foodTypeLabel: UILabel = {
        let label = UILabel()
        label.text = "FOOD TYPE"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    private var foodTypeSegmentedButton: UISegmentedControl = {
        let segmentedButton = UISegmentedControl(items: foodTypeList)
        segmentedButton.selectedSegmentIndex = 0
        return segmentedButton
    }()
    private let hungerLevelLabel: UILabel = {
        let label = UILabel()
        label.text = "HUNGER LEVEL"
        ;label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    private var hungerLevelSegmentedButton: UISegmentedControl = {
        let segmentedButton = UISegmentedControl(items: hungerLevelList)
        segmentedButton.selectedSegmentIndex = 0
        return segmentedButton
    }()
    private let doneButton: UIButton = {
        let button = UIButton()
        button.setTitle("DONE", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubView()
        addTarget()
        setUpConstraint()
        setUpMenuSetting()
        view.backgroundColor = .black
    }
    
    private func addSubView() {
        view.addSubview(VStack)
        VStack.addArrangedSubview(foodTypeLabel)
        VStack.addArrangedSubview(foodTypeSegmentedButton)
        VStack.addArrangedSubview(hungerLevelLabel)
        VStack.addArrangedSubview(hungerLevelSegmentedButton)
        view.addSubview(doneButton)
    }
    
    private func addTarget() {
        doneButton.addTarget(self, action: #selector(tapDoneButton), for: .touchUpInside)
    }
    
    private func setUpConstraint() {
        VStack.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.left.right.equalToSuperview().offset(20)
        }
        doneButton.snp.makeConstraints{ make in
            make.bottom.equalToSuperview().offset(-150)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setUpMenuSetting() {
        foodTypeSegmentedButton.selectedSegmentIndex = foodTypeList.firstIndex(of: foodType) ?? 0
        hungerLevelSegmentedButton.selectedSegmentIndex = hungerLevelList.firstIndex(of: hungerLevel) ?? 0
    }
    
    @objc private func tapDoneButton() {
        self.delegate?.menuSetting(
            foodType: foodTypeList[foodTypeSegmentedButton.selectedSegmentIndex],
            hungerLevel: hungerLevelList[hungerLevelSegmentedButton.selectedSegmentIndex]
        )
        self.dismiss(animated: true, completion: nil)
    }
}
