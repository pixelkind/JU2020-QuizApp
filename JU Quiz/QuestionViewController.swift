//
//  QuestionViewController.swift
//  JU Quiz
//
//  Created by Garrit on 23.10.20.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var buttonAnswerA: UIButton!
    @IBOutlet weak var buttonAnswerB: UIButton!
    @IBOutlet weak var buttonAnswerC: UIButton!
    @IBOutlet weak var buttonAnswerD: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonAnswerA.layer.cornerRadius = 20
        buttonAnswerB.layer.cornerRadius = 20
        buttonAnswerC.layer.cornerRadius = 20
        buttonAnswerD.layer.cornerRadius = 20
    }
    
    @IBAction func buttonAnswerAHandler(_ sender: Any) {
        print("Fish")
        buttonAnswerA.backgroundColor = .red
        let alertController = UIAlertController(title: "WRONG 🙈", message: "Maybe next time...", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Oh no...", style: UIAlertAction.Style.default, handler: { (_) in
            alertController.dismiss(animated: true, completion: nil)
        }))
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func buttonAnswerBHandler(_ sender: Any) {
        print("Meat")
    }
    
    @IBAction func buttonAnswerCHandler(_ sender: Any) {
        print("Rice")
    }
    
    @IBAction func buttonAnswerDHandler(_ sender: Any) {
        print("Pizza")
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
