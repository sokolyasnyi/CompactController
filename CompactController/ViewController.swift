//
//  ViewController.swift
//  CompactController
//
//  Created by Станислав Соколов on 13.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    lazy private var presentButton: UIButton = {
        let button = UIButton(configuration: .plain())
        button.setTitle("Present", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
        setupConstraints()
        
    }

    func setupViews() {
        view.addSubview(presentButton)
        presentButton.addTarget(self, action: #selector(pressPresentButton), for: .touchUpInside)
    }
    
    func setupConstraints() {
        presentButton.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 10).isActive = true
        presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

    @objc
    private func pressPresentButton(_ sender: UIButton) {
        
        let viewController = CompactViewController()
        viewController.modalPresentationStyle = .popover
        viewController.preferredContentSize = CGSize(width: 300, height: 280)
        
        if let popoverController = viewController.popoverPresentationController {
            popoverController.delegate = self
            popoverController.permittedArrowDirections = .up
            popoverController.sourceView = presentButton
            popoverController.sourceRect = CGRect(x: presentButton.bounds.midX,
                                                  y: presentButton.bounds.maxY,
                                                  width: 0,
                                                  height: 0)
        }
        present(viewController, animated: true)
        
    }
    
}

extension ViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        .none
    }
}
