//
//  ResultsViewController.swift
//  RPS
//
//  Created by 🍑 on 02/10/2019.
//  Copyright © 2019 udacity. All rights reserved.
//

import UIKit


enum Choice: String {
    case Rock = "rock"
    case Paper = "paper"
    case Scissors = "scissors"
    
    static func randomChoice() -> Choice {
        let rps: [Choice] = [.Rock , .Paper , .Scissors]
        let index = Int(arc4random_uniform(3))
        let choice = rps[index]
        return choice
    }
}

class ResultsViewController: UIViewController {

    @IBOutlet weak var resultImg: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    var user: Choice!
    let cpu: Choice = Choice.randomChoice()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        gameResults()
    }
    
    func gameResults() {
        var imgName: String
        var resultText = "\(user.rawValue) vs. \(cpu.rawValue): "
        
        switch (user! , cpu) {
        case let (user,cpu) where user == cpu:
            imgName = "tie"
            resultText += "It's a Tie :|"
        case (.Rock , .Scissors) , (.Paper , .Rock) , (.Scissors , .Paper):
            imgName = "\(user.rawValue)-\(cpu.rawValue)"
            resultText += "You win :D"
        default:
            imgName = "\(cpu.rawValue)-\(user.rawValue)"
            resultText += "You lose :'("
        }
        
        resultImg.image = UIImage(named: imgName)
        resultLabel.text = resultText
        
    }
    
    @IBAction private func playAgain() {
        self.dismiss(animated: true, completion: nil)
    }
    


}
