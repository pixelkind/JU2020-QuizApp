//
//  QuestionViewController.swift
//  JU Quiz
//
//  Created by Garrit on 23.10.20.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var buttonAnswerA: UIButton!
    @IBOutlet weak var buttonAnswerB: UIButton!
    @IBOutlet weak var buttonAnswerC: UIButton!
    @IBOutlet weak var buttonAnswerD: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("View did load")
        [buttonAnswerA, buttonAnswerB, buttonAnswerC, buttonAnswerD].forEach { (button) in
            button?.layer.cornerRadius = 20
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("View will appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("View did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("View will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("View did disappear")
    }
    
    @IBAction func buttonAnswerAHandler(_ sender: Any) {
        print("Fish")
        showWrongAnswerAlert(button: buttonAnswerA)
    }
    
    @IBAction func buttonAnswerBHandler(_ sender: Any) {
        print("Meat")
        showWrongAnswerAlert(button: buttonAnswerB)
    }
    
    @IBAction func buttonAnswerCHandler(_ sender: Any) {
        print("Rice")
        showWrongAnswerAlert(button: buttonAnswerC)
    }
    
    @IBAction func buttonAnswerDHandler(_ sender: Any) {
        print("Pizza")
        showRightAnswerAlert(button: buttonAnswerD)
    }
    
    private func showRightAnswerAlert(button: UIButton) {
        button.backgroundColor = .green
        let alertController = UIAlertController(title: "You're right 🥳", message: "Go on...", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Yes!", style: UIAlertAction.Style.default, handler: { (_) in
            alertController.dismiss(animated: true, completion: nil)
        }))
        present(alertController, animated: true, completion: nil)
    }
    
    private func showWrongAnswerAlert(button: UIButton) {
        button.backgroundColor = .red
        buttonAnswerD.backgroundColor = .green
        let alertController = UIAlertController(title: "WRONG 🙈", message: "Maybe next time...", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Oh no...", style: UIAlertAction.Style.default, handler: { (_) in
            self.navigationController?.popViewController(animated: true)
//            alertController.dismiss(animated: true, completion: nil)
        }))
        present(alertController, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
