//
//  CategoryViewController.swift
//  things
//
//  Created by 노규명 on 2022/03/03.
//

import UIKit
import SnapKit

class CategoryViewController: UIViewController {
    private let categories = CategoryList.shared.categoryList

    private var categoryTableView: UITableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubView()
        setUpNavigator()
        setUpTableView()
        setUpConstraint()
    }
    
    private func addSubView() {
        view.addSubview(categoryTableView)
    }

    private func setUpNavigator() {
        navigationItem.title = "Things"
    }

    private func setUpTableView() {
        categoryTableView.dataSource = self
        categoryTableView.delegate = self
        
        categoryTableView.rowHeight = UITableView.automaticDimension
        categoryTableView.estimatedRowHeight = 50

        categoryTableView.register(CategoryCell.self, forCellReuseIdentifier: CategoryCell.identiifer)
    }
    
    private func setUpConstraint() {
        categoryTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension CategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CategoryCell.identiifer,
            for: indexPath) as? CategoryCell
        else {
            return UITableViewCell()
        }
        cell.configure(with: categories[indexPath.item])
        return cell
    }
}

extension CategoryViewController: UITableViewDelegate {

}

class CategoryCell: UITableViewCell {
    static let identiifer = "CategoryCell"
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }()
    private var nextButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "chevron.right")
        button.setImage(image, for: .normal)
        button.tintColor = UIColor.gray
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubView()
        setUpConstraint()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubView() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(nextButton)
    }
    
    private func setUpConstraint() {
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-50)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.left.right.equalTo(nameLabel)
            make.bottom.equalToSuperview().offset(-15)
        }
        nextButton.snp.makeConstraints { make in
            make.width.height.equalTo(30)
            make.right.equalToSuperview().offset(-10)
            make.centerY.equalToSuperview()
        }
    }

    func configure(with category: Category) {
        nameLabel.text = category.name
        descriptionLabel.text = category.description
    }
}
