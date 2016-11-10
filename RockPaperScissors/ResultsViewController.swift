//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Angel Delgado on 11/9/16.
//  Copyright © 2016 Angel Delgado. All rights reserved.
//

import UIKit

enum Choice: String {
    
 
    
    case Rock = "Rock"
    case Paper = "Paper"
    case Scissors = "Scissors"
    
    
    static func randomShape() -> Choice {
        let shapes = ["Rock", "Paper", "Scissors"]
        let randomChoice = Int(arc4random_uniform(3))
        return Choice(rawValue: shapes[randomChoice])!
    }
}



class ResultsViewController: UIViewController {
    
    
    
    @IBOutlet private weak var resultImage: UIImageView!
    @IBOutlet private weak var resultLabel: UILabel!
    
   
    var option: Choice!
    private let opponentChoice: Choice = Choice.randomShape()
    
   
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        displayResult()
    }
    
    
    private func displayResult() {
       
        var imageName: String
        var text: String
        let matchup = "\(option.rawValue) vs. \(opponentChoice.rawValue)"
        
        
        switch (option!, opponentChoice) {
        case let (user, opponent) where user == opponent:
            text = "\(matchup): TIE!"
            imageName = "tie"
        case (.Rock, .Scissors), (.Paper, .Rock), (.Scissors, .Paper):
            text = "Winner Winner \(matchup)!"
            imageName = "\(option.rawValue)-\(opponentChoice.rawValue)"
        default:
            text = "You lose \(matchup) :(."
            imageName = "\(opponentChoice.rawValue)-\(option.rawValue)"
        }
        
        imageName = imageName.lowercased()
        resultImage.image = UIImage(named: imageName)
        resultLabel.text = text
    }
    
    
    @IBAction private func playAgain() {
        dismiss(animated: true, completion: nil)
    }
}
