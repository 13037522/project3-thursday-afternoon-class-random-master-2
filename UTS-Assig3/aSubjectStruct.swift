//
//  aSubjectStruct.swift
//  UTS-Assig3
//
//  Created by Asher on 10/5/18.
//  Copyright © 2018 Asher. All rights reserved.
//

import Foundation

struct aSubject: Codable {
    var subjectID: Int = 0
    var subjectName: String
    
    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("subjects").appendingPathExtension("plist")
    
    
    static func loadSubjects() -> [aSubject]?  {
        guard let encodedHS = try? Data(contentsOf: ArchiveURL) else {return nil}
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode(Array<aSubject>.self, from: encodedHS)
    }
    
    static func saveSubjects(_ scores: [aSubject]) {
        let propertyListEncoder = PropertyListEncoder()
        let encodedHS = try? propertyListEncoder.encode(scores)
        try? encodedHS?.write(to: ArchiveURL, options: .noFileProtection)
    }
    
    static func defaultSubjects() -> [aSubject] {
        let subject1 = aSubject(subjectID: 35406, subjectName:  "iOS Development - SWIFT")
        let subject2 = aSubject(subjectID: 111111, subjectName:  "iOS Development with COCOA")
        let subject3 = aSubject(subjectID: 222222, subjectName:  "Introduction to Database")
        let subject4 = aSubject(subjectID: 128091, subjectName:  "Fundamentals of Software Development")
        let subject5 = aSubject(subjectID: 111111, subjectName:  "Enabeling Enterprise Information Systems")
        let subject6 = aSubject(subjectID: 35354, subjectName:  "Unix Systems Programing")
        let subject7 = aSubject(subjectID: 34455, subjectName:  "Internet Programing")
        let subject8 = aSubject(subjectID: 111111, subjectName:  "Advanced Internet Programing")
        let subject9 = aSubject(subjectID: 35425, subjectName:  "Cyber Security")
        return [subject1, subject2, subject3, subject4, subject5, subject6, subject7, subject8, subject9]
    }
}
