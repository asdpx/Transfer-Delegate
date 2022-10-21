//
//  ViewControllerSecond.swift
//  TransferInfo
//
//  Created by Vladimir Grishchenkov on 21.10.2022.
//

import UIKit
protocol FirstViewDelegate {
    func update (text1: String, text2: String)
}

class ViewControllerSecond: UIViewController {

    lazy var dataTextFieldOneVC: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        return textField
    }()
    lazy var dataTextFieldTwoVC: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        return textField
    }()
    lazy var tranferButtonVC: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Button", for: .normal)
        button.addTarget(self, action: #selector(buttonTup), for: .touchUpInside)
        return button
    }()
//сюда будут передаваться свойства из первого вью
    var text1 = ""
    var text2 = ""
    var delegate: FirstViewDelegate?   //свойоствао делегат который будет опционалом делегата

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setupViewLayat()
// обрабатываем с 1 вью во второй (выводим на второй экран)
        dataTextFieldOneVC.text = text1
        dataTextFieldTwoVC.text = text2

    }
    @objc func buttonTup() {
        if let text1 = dataTextFieldOneVC.text, let text2 = dataTextFieldTwoVC.text {
            delegate?.update(text1: text1, text2: text2)
        }
        dismiss(animated: true)
    }

    func setupViewLayat() {
        [dataTextFieldOneVC, dataTextFieldTwoVC, tranferButtonVC].forEach { view.addSubview($0) }
        NSLayoutConstraint.activate([
            dataTextFieldOneVC.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dataTextFieldOneVC.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            dataTextFieldOneVC.topAnchor.constraint(equalTo: view.topAnchor, constant: 52),
            dataTextFieldTwoVC.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dataTextFieldTwoVC.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            dataTextFieldTwoVC.topAnchor.constraint(equalTo: dataTextFieldOneVC.bottomAnchor, constant: 45),
            tranferButtonVC.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            tranferButtonVC.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

}
