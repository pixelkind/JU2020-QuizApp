//
//  StartViewController.swift
//  JU Quiz
//
//  Created by Garrit on 30.10.20.
//

import UIKit

class StartViewController: UIViewController {

    var questions: [Question] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        downloadQuestions(amount: 5)
    }
    
    private func downloadQuestions(amount: Int) {
        guard let url = URL(string: "https://opentdb.com/api.php?amount=\(amount)&type=multiple") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                print(error)
                return
            }
//            print(String(data: data, encoding: .utf8))
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let questionsResult = try? decoder.decode(QuestionsResult.self, from: data)
            self.questions = questionsResult?.results ?? []
        }
        task.resume()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let questionViewController = segue.destination as? QuestionViewController {
//            let question1 = Question(category: "Food", type: .multiple, difficulty: .easy, question: "What is my favorite food?", correctAnswer: "🍕", incorrectAnswers: ["🍚", "🥩", "🐟"])
//            let question2 = Question(category: "Animals", type: .multiple, difficulty: .hard, question: "Which is a mammal?", correctAnswer: "🐹", incorrectAnswers: ["🦎", "🐟", "🐛"])
//            let questions = [question1, question2, question1]
            questionViewController.numberOfQuestions = questions.count
            questionViewController.questions = questions
        }
    }

}
