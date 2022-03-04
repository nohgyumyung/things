//
//  ColorPickerViewController.swift
//  things
//
//  Created by 노규명 on 2022/03/04.
//

import UIKit
import SnapKit

struct RGBColor {
    var red: Int
    var green: Int
    var blue: Int
}

class ColorPickerViewController: UIViewController {
    private var colorView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    private var colorLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.textAlignment = .center
        label.text = "R: 0 / 255\nG: 0 / 255\nB: 0 / 255"
        return label
    }()
    private var generateColorButton: UIButton = {
        let button = UIButton()
        button.setTitle("Generate Color", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubView()
        addTarget()
        setUpConstraint()
    }
    
    func addSubView() {
        view.addSubview(colorView)
        view.addSubview(colorLabel)
        view.addSubview(generateColorButton)
    }
    
    func addTarget() {
        generateColorButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
    }
    
    func setUpConstraint() {
        colorView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.height.equalTo(250)
        }
        colorLabel.snp.makeConstraints { make in
            make.top.equalTo(colorView.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
        }
        generateColorButton.snp.makeConstraints { make in
            make.top.equalTo(colorLabel.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
        }
    }
    
    func getRandomColor() -> RGBColor {
        let red = Int.random(in: 0...255)
        let green = Int.random(in: 0...255)
        let blue = Int.random(in: 0...255)
        return RGBColor(red: red, green: green, blue: blue)
    }
    
    @objc func changeColor() {
        let rgbColor = getRandomColor()
        let color = UIColor(red: CGFloat(rgbColor.red) / 255,
                            green: CGFloat(rgbColor.green) / 255,
                            blue: CGFloat(rgbColor.blue) / 255,
                            alpha: 1)
        colorLabel.text = "R: \(rgbColor.red) / 255\nG: \(rgbColor.green) / 255\nB: \(rgbColor.blue) / 255"
        colorView.backgroundColor = color
    }
}
