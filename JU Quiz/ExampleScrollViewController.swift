//
//  ExampleScrollViewController.swift
//  JU Quiz
//
//  Created by Garrit on 13.11.20.
//

import UIKit
import SnapKit

class ExampleScrollViewController: UIViewController {

    let scrollView = UIScrollView()
    
    override func loadView() {
        view = scrollView
        scrollView.backgroundColor = .systemBackground
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
//        scrollView.bounces = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let redView = UIView()
        redView.backgroundColor = .systemRed
        scrollView.addSubview(redView)
        
        let blueView = UIView()
        blueView.backgroundColor = .systemBlue
        scrollView.addSubview(blueView)
        
        let label = UILabel()
        label.text = "Hello :)"
        blueView.addSubview(label)
        
        label.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
        redView.snp.makeConstraints { (make) in
            make.size.equalTo(view.safeAreaLayoutGuide.snp.size)
            make.top.left.bottom.equalToSuperview()
            make.right.equalTo(blueView.snp.left)
        }
        
        blueView.snp.makeConstraints { (make) in
            make.size.equalTo(view.safeAreaLayoutGuide.snp.size)
            make.top.right.bottom.equalToSuperview()
        }
    }

}
