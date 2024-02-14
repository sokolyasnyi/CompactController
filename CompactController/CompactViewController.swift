//
//  CompactViewController.swift
//  CompactController
//
//  Created by Станислав Соколов on 13.02.2024.
//

import UIKit

class CompactViewController: UIViewController {
    
    lazy private var heightSegmentControl: UISegmentedControl = {
        let segmentControl = UISegmentedControl()
        segmentControl.insertSegment(withTitle: "280pt", at: 0, animated: true)
        segmentControl.insertSegment(withTitle: "150pt", at: 1, animated: true)
        segmentControl.selectedSegmentIndex = 0
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentControl
    }()
    
    lazy private var closeButton: UIButton = {
        let button = UIButton(type: .close)
        button.setImage(UIImage(named: "xmark.circle.fill"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightText
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        view.addSubview(heightSegmentControl)
        view.addSubview(closeButton)
        closeButton.addTarget(self, action: #selector(pressCloseButton), for: .touchUpInside)
        heightSegmentControl.addTarget(self, action: #selector(changeValueSegmentControl), for: .valueChanged)
    }
    
    private func setupConstraints() {
        heightSegmentControl.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 8).isActive = true
        heightSegmentControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        closeButton.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 8).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        closeButton.heightAnchor.constraint(equalTo: heightSegmentControl.heightAnchor, multiplier: 1).isActive = true
        closeButton.widthAnchor.constraint(equalTo: closeButton.heightAnchor, multiplier: 1).isActive = true
    }
    
    @objc private func pressCloseButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @objc private func changeValueSegmentControl(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            animatePopover(280)
        } else if sender.selectedSegmentIndex == 1 {
            animatePopover(150)
        }
    }
    
    private func animatePopover(_ height: Float) {
        print(#function)
        UIView.animate(withDuration: 0.5) {
            self.view.frame = CGRect(x: self.view.frame.minX,
                                     y: self.view.frame.minY,
                                     width: self.view.frame.width,
                                     height: CGFloat(height))
            self.preferredContentSize = CGSize(width: self.view.frame.width,
                                               height: Double(height))
        }
        
    }
}
