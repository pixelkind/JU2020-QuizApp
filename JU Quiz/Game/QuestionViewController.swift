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
    
    private let gameResultDatabaseManager = GameResultDatabaseManager()
    private var haveWon = false
    var questions: [Question] = [] {
        didSet {
            question = questions.removeFirst()
        }
    }
    var question: Question?
    var numberOfQuestions = 0
    var rightAnswers = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        // Configure of the question label
        questionLabel.clipsToBounds = true
        questionLabel.layer.cornerRadius = 20
        
        var buttons = [buttonAnswerA, buttonAnswerB, buttonAnswerC, buttonAnswerD]
        // Configuration of the buttons
        buttons.forEach { (button) in
            button?.layer.cornerRadius = 20
        }
        
        questionLabel.text = question?.question.htmlDecoded
        buttons.shuffle()
        let correctButton = buttons.removeFirst()
        correctButton?.setTitle(question?.correctAnswer.htmlDecoded, for: .normal)
        
        question?.incorrectAnswers.forEach({ (answer) in
            let button = buttons.removeFirst()
            button?.setTitle(answer.htmlDecoded, for: .normal)
        })
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
        if buttonAnswerA.title(for: .normal) == question?.correctAnswer {
            showRightAnswerAlert(button: buttonAnswerA)
        } else {
            showWrongAnswerAlert(button: buttonAnswerA)
        }
    }
    
    @IBAction func buttonAnswerBHandler(_ sender: Any) {
        if buttonAnswerB.title(for: .normal) == question?.correctAnswer {
            showRightAnswerAlert(button: buttonAnswerB)
        } else {
            showWrongAnswerAlert(button: buttonAnswerB)
        }    }
    
    @IBAction func buttonAnswerCHandler(_ sender: Any) {
        if buttonAnswerC.title(for: .normal) == question?.correctAnswer {
            showRightAnswerAlert(button: buttonAnswerC)
        } else {
            showWrongAnswerAlert(button: buttonAnswerC)
        }
    }
    
    @IBAction func buttonAnswerDHandler(_ sender: Any) {
        if buttonAnswerD.title(for: .normal) == question?.correctAnswer {
            showRightAnswerAlert(button: buttonAnswerD)
        } else {
            showWrongAnswerAlert(button: buttonAnswerD)
        }
    }
    
    private func showRightAnswerAlert(button: UIButton) {
        haveWon = true
        rightAnswers += 1
        button.backgroundColor = .green
        let alertController = UIAlertController(title: "You're right 🥳", message: "Go on...", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Yes!", style: UIAlertAction.Style.default, handler: { [weak self] (_) in
            self?.goToNextScreen()
        }))
        present(alertController, animated: true, completion: nil)
    }
    
    private func showWrongAnswerAlert(button: UIButton) {
        haveWon = false
        button.backgroundColor = .red
        let alertController = UIAlertController(title: "WRONG 🙈", message: "Maybe next time...", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Oh no...", style: UIAlertAction.Style.default, handler: { [weak self] (_) in
            self?.goToNextScreen()
        }))
        present(alertController, animated: true, completion: nil)
    }
    
    private func goToNextScreen() {
        guard questions.isEmpty == false,
              let questionViewController = storyboard?.instantiateViewController(withIdentifier: "QuestionViewController") as? QuestionViewController else {
            saveGameResult()
            performSegue(withIdentifier: "ResultView", sender: nil)
            return
        }
        
        questionViewController.numberOfQuestions = numberOfQuestions
        questionViewController.rightAnswers = rightAnswers
        questionViewController.questions = questions
        navigationController?.pushViewController(questionViewController, animated: true)
    }
    
    // MARK: - Saving the result
    
    private func saveGameResult() {
        if gameResultDatabaseManager.create(withNumbersOfQuestions: numberOfQuestions, andRightAnswers: rightAnswers) != nil {
            gameResultDatabaseManager.save()
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let resultViewController = segue.destination as? ResultViewController {
            resultViewController.resultView.resultLabel.text = "🥳 You answered \(rightAnswers) right from \(numberOfQuestions) questions."
        }
    }

}
