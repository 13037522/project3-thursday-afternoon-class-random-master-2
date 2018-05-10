//
//  Question.swift
//  UTS-Assig3
//
//  Created by Asher on 10/5/18.
//  Copyright © 2018 Asher. All rights reserved.
//

import Foundation

struct aQuestion: Codable {
    var subjectID: Int
    var question: String
    var answers: [String]
    var correctAnswer: Int

    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("questions").appendingPathExtension("plist")

    static func loadQuestions() -> [aQuestion]?  {
        guard let encodedHS = try? Data(contentsOf: ArchiveURL) else {return nil}
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode(Array<aQuestion>.self, from: encodedHS)
    }
    static func saveQuestions(_ scores: [aQuestion]) {
        let propertyListEncoder = PropertyListEncoder()
        let encodedHS = try? propertyListEncoder.encode(scores)
        try? encodedHS?.write(to: ArchiveURL, options: .noFileProtection)
    }

    static func defaultQuestions() -> [aQuestion] {
        let question1 = aQuestion(subjectID: 35406, question:  "Which connection type should be used when connecting a button to the ViewController.swift file?", answers: ["Direct","Outlet","Outlet Collection","Action"], correctAnswer: 4)
        let question2 = aQuestion(subjectID: 35406, question:  "To run code when the application first starts, place it within the _____ method", answers: ["onLoad()","onStart()","viewDidLoad()","viewOnLoad()"], correctAnswer: 3)
        let question3 = aQuestion(subjectID: 35406, question:  "A label can be created and modified using which of the following?", answers: ["story bar","all of the answers","using code","inspector bar"], correctAnswer: 2)
        let question4 = aQuestion(subjectID: 35406, question:  "Which label attributes can be modified using the Attributes Inspector?", answers: ["all answers","text view","font","color"], correctAnswer: 1)
        let question5 = aQuestion(subjectID: 35406, question:  "In iOS, the controller is a ______ file", answers: [".swift",".md",".plist",".h"], correctAnswer: 1)
        let question6 = aQuestion(subjectID: 35406, question:  "The user interface objects are stored in the Object _____", answers: ["Bin","repository","Library","Container"], correctAnswer: 3)
        let question7 = aQuestion(subjectID: 35406, question:  "A storyboard file allows you to design a user interface", answers: ["true","false","sometimes","never"], correctAnswer: 1)
        let question8 = aQuestion(subjectID: 35406, question:  "In the Model-View-Controller design pattern, the _____ represents the data", answers: ["view","controller","model","none above"], correctAnswer: 3)
        let question9 = aQuestion(subjectID: 35406, question:  "The _____ button in Xcode's toolbar runs the application.", answers: ["None above","build","play","stop"], correctAnswer: 3)
        let question10 = aQuestion(subjectID: 35406, question:  "What event type refers to a user tapping a button?", answers: ["Touch Down","Touch Up Inside","Touch Cancel","Did End On Exit"], correctAnswer: 2)
        let question11 = aQuestion(subjectID: 35406, question:  "When adding a label to a storyboard, why is it a good idea to stretch out the label?", answers: ["It keeps the text from getting truncated","The program will run faster","It is easier to drag a bigger label","it makes it easier for the user to see the lable"], correctAnswer: 1)
        let question12 = aQuestion(subjectID: 35406, question:  "The _____ object is used for one line, usually for entering text", answers: ["Text Field","Text View","Text Purse","Text Container"], correctAnswer: 1)
        let question13 = aQuestion(subjectID: 35406, question:  "When making connections, a(n) _____ creates a variable while a(an) _____ creates a method?", answers: ["Outlet Collection: Action","Action: outlet connection","Action: Outlet","Outlet: Action"], correctAnswer: 4)
        let question14 = aQuestion(subjectID: 35406, question:  "When creating a variable, use _____ if the value is not going to change", answers: ["unchangeable","var","fixed","let"], correctAnswer: 4)

        return [ question1, question2, question3, question4, question5, question6,question7,question8,question9,question10, question11, question12, question13, question14]
    }
}
