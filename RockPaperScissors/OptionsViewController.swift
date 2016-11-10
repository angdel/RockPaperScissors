//
//  OptionsViewController.swift
//  RockPaperScissors
//
//  Created by Angel Delgado on 11/9/16.
//  Copyright © 2016 Angel Delgado. All rights reserved.
//

import UIKit

class OptionsViewController: UIViewController {

    @IBAction private func Rock(sender: UIButton) {
        let rock = self.storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
        rock.option = getUserShape(sender: sender)
        present(rock, animated: true, completion: nil)
    }
    
    
    
    @IBAction private func Paper(sender: UIButton) {
        performSegue(withIdentifier: "play", sender: sender)
    }
    
    
    
     func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "play" {
            let scissors = segue.destination as! ResultsViewController
            scissors.option = getUserShape(sender: sender as! UIButton)
        }
    }
    
    
    private func getUserShape(sender: UIButton) -> Choice {
        let shape = sender.title(for: .normal)!
        return Choice(rawValue: shape)!
    }
}
