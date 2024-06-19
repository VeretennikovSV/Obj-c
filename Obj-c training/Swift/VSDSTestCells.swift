//
//  VSDSTestCell.swift
//  Obj-c training
//
//  Created by Sergei Veretennikov on 19.06.2024.
//

import Foundation

final class VSDSTestCell: VSDSConfigurableCell<UITableViewCell> {
    func testConfigFunc(string: String) {
        contentView.backgroundColor = .blue
        let label = UILabel()
        label.text = string.appending("\(Int.random(in: 0...9))")
        label.setToEdgesOf(contentView)
        label.font = UIFont.systemFont(ofSize: 25)
    }
}

final class VSDSTestCellTwo: VSDSConfigurableCell<UITableViewCell> {
    func testConfigFunc(color: UIColor, string: String, stringTwo: String) {
        contentView.backgroundColor = color
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.setToEdgesOf(contentView)
        stackView.spacing = 4

        let label1 = UILabel()
        label1.text = string
        label1.font = UIFont.systemFont(ofSize: 25)

        let label2 = UILabel()
        label2.text = stringTwo
        label2.font = UIFont.systemFont(ofSize: 13)

        stackView.addArrangedSubview(label1)
        stackView.addArrangedSubview(label2)
    }
}

final class VSDSTestCellThree: VSDSConfigurableCell<UITableViewCell> {
    func testConfigFunc(color: UIColor, string: String, stringTwo: String) {
        contentView.backgroundColor = color
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.setToEdgesOf(contentView)
        stackView.spacing = 4

        let label1 = UILabel()
        label1.text = string
        label1.font = UIFont.systemFont(ofSize: 25)

        let label2 = UILabel()
        label2.text = stringTwo
        label2.font = UIFont.systemFont(ofSize: 13)

        stackView.addArrangedSubview(label1)
        stackView.addArrangedSubview(label2)
    }
}

final class VSDSTestCellFour: VSDSConfigurableCell<UITableViewCell> {
    func testConfigFunc(color: UIColor, string: String, stringTwo: String) {
        contentView.backgroundColor = color
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.setToEdgesOf(contentView)
        stackView.spacing = 4

        let label1 = UILabel()
        label1.text = string
        label1.font = UIFont.systemFont(ofSize: 25)

        let label2 = UILabel()
        label2.text = stringTwo
        label2.font = UIFont.systemFont(ofSize: 13)

        stackView.addArrangedSubview(label1)
        stackView.addArrangedSubview(label2)
    }
}
