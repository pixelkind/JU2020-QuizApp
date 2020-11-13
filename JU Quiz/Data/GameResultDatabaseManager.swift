//
//  GameResultDatabaseManager.swift
//  JU Quiz
//
//  Created by Garrit on 13.11.20.
//

import Foundation
import CoreData

class GameResultDatabaseManager {
    
    func create(withNumbersOfQuestions numberOfQuestions: Int, andRightAnswers rightAnswers: Int) -> GameResult? {
        let managedObjectContext = DatabaseManager.shared.managedObjectContext
        
        let gameResult = NSEntityDescription.insertNewObject(forEntityName: "GameResult", into: managedObjectContext) as? GameResult
        // Setting the data
        gameResult?.numberOfQuestions = Int32(numberOfQuestions)
        gameResult?.rightAnswers = Int32(rightAnswers)
        gameResult?.date = Date()
        
        return gameResult
    }
    
    func save() {
        DatabaseManager.shared.saveContext()
    }
    
}
