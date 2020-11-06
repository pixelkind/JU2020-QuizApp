//
//  StartViewController.swift
//  JU Quiz
//
//  Created by Garrit on 30.10.20.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let questionViewController = segue.destination as? QuestionViewController {
            let question1 = Question(category: "Food", type: .multiple, difficulty: .easy, question: "What is my favorite food?", correctAnswer: "🍕", incorrectAnswers: ["🍚", "🥩", "🐟"])
            let question2 = Question(category: "Animals", type: .multiple, difficulty: .hard, question: "Which is a mammal?", correctAnswer: "🐹", incorrectAnswers: ["🦎", "🐟", "🐛"])
            let questions = [question1, question2, question1]
            questionViewController.numberOfQuestions = questions.count
            questionViewController.questions = questions
        }
    }

}
