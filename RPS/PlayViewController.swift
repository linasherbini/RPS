//
//  ViewController.swift
//  RPS
//
//  Created by 🍑 on 02/10/2019.
//  Copyright © 2019 udacity. All rights reserved.
//

import UIKit




class PlayViewController: UIViewController {

    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func getUserChoice(_ sender: UIButton) -> Choice {
        if(rockButton.isTouchInside) {
            return .Rock
        } else if(paperButton.isTouchInside) {
            return .Paper
        } else {
            return .Scissors
        }
    }
    
    @IBAction func playRock(_ sender: UIButton){
        let nextView: ResultsViewController
        nextView = self.storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
        nextView.user = getUserChoice(sender)
        present(nextView, animated: true, completion: nil)
        
    }
    
    @IBAction func playPaper(_ sender: UIButton){
        performSegue(withIdentifier: "result", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "result" {
            let nextView = segue.destination as! ResultsViewController
            nextView.user = getUserChoice(sender as! UIButton)
        }
    }
    
    
    


}

