//
//  ViewController.swift
//  TransferInfo
//
//  Created by Vladimir Grishchenkov on 21.10.2022.
//

import UIKit

class ViewController: UIViewController {

    lazy var dataTextFieldOne: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        return textField
    }()
    lazy var dataTextFieldTwo: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        return textField
    }()
    lazy var tranferButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Button", for: .normal)
        button.addTarget(self, action: #selector(buttonTup), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setupViewLayat()
    }

    @objc func buttonTup() {
        let vc = ViewControllerSecond()
        //разворачиваем значения в 1 и 2 тесттвых полях и присваевыаем во второе окно
        if let text1 = dataTextFieldOne.text, let text2 = dataTextFieldTwo.text {
            vc.text1 = text1
            vc.text2 = text2
            vc.delegate = self
        }
        present(vc, animated: true, completion: nil)
    }

    func setupViewLayat() {
        [dataTextFieldOne, dataTextFieldTwo, tranferButton].forEach { view.addSubview($0) }
        NSLayoutConstraint.activate([
            dataTextFieldOne.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dataTextFieldOne.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            dataTextFieldOne.topAnchor.constraint(equalTo: view.topAnchor, constant: 52),
            dataTextFieldTwo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dataTextFieldTwo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            dataTextFieldTwo.topAnchor.constraint(equalTo: dataTextFieldOne.bottomAnchor, constant: 45),
            tranferButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            tranferButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

}

extension ViewController: FirstViewDelegate {
    func update(text1: String, text2: String) {
        dataTextFieldOne.text = text1
        dataTextFieldTwo.text = text2
    }
}
