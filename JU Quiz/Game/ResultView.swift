//
//  ResultView.swift
//  JU Quiz
//
//  Created by Garrit on 30.10.20.
//

import UIKit

class ResultView: UIView {
    
    private let titleLabel = UILabel()
    let resultLabel = UILabel()
    let button = UIButton()
    let imageView = UIImageView(image: #imageLiteral(resourceName: "Logo"))
    var imageViewCenterXAnchor: NSLayoutConstraint?
    var imageViewLeadingAnchor: NSLayoutConstraint?
    var imageViewTrailingAnchor: NSLayoutConstraint?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .systemBackground
        
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.text = NSLocalizedString("Your Result", comment: "Result title")
        addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        resultLabel.font = UIFont.preferredFont(forTextStyle: .callout)
        resultLabel.adjustsFontForContentSizeCategory = true
        addSubview(resultLabel)
        
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        resultLabel.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor).isActive = true
        
        // Showing the logo
        addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 20).isActive = true
//        imageViewCenterXAnchor = imageView.centerXAnchor.constraint(equalTo: resultLabel.centerXAnchor)
//        imageViewCenterXAnchor?.constant = -150
//        imageViewCenterXAnchor?.isActive = true
        imageViewLeadingAnchor = imageView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor)
        imageViewLeadingAnchor?.isActive = true
        imageViewTrailingAnchor = imageView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor)
        
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle(NSLocalizedString("Back to start", comment: "Result button title"), for: .normal)
        addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        button.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    func startAnimation() {
        UIView.animate(withDuration: 2, delay: 0, options: [.curveEaseInOut, .autoreverse, .repeat]) {
            self.imageViewLeadingAnchor?.isActive = false
            self.imageViewTrailingAnchor?.isActive = true
//            self.imageViewCenterXAnchor?.constant = 150
            self.layoutIfNeeded()
        }
    }

}
