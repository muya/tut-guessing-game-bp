//
//  ViewController.swift
//  tut-guessing-game-bp
//
//  Created by Muya on 7/20/14.
//  Copyright (c) 2014 muya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var guesses : UInt = 0
    var number : UInt32 = 0
    var gameOver = false
    let MAX_GUESSES : UInt = 8
    
    @IBOutlet var inputField : UITextField
    @IBOutlet var output : UITextView
    @IBAction func guess(sender: UIButton){
        if gameOver{
            var newGame = inputField.text.substringToIndex(1)
            if newGame == "Y"{
                gameOver = false
                output.text = ""
                clearInput()
                number = generateNewNumber()
                consoleOut("I'm thinking of a number...\n")
                return
            }
                
        }
        var possibleGuess : Int? = inputField.text.toInt()
        
        if let guess = possibleGuess {
            if UInt32(guess) > number {
                consoleOut("\(guess): You guessed too high!\n")
                ++guesses
            } else if UInt32(guess) < number {
                consoleOut("\(guess): You guessed too low!\n")
                ++guesses
            } else{
                consoleOut("\n\(guess): You win! \n")
                consoleOut("Go again? (Y)")
                guesses = 0
                gameOver = true
            }
            clearInput()
        } else {
            consoleOut("Please input a valid number!\n")
            clearInput()
        }
        
        if(guesses == MAX_GUESSES){
            consoleOut("\nYou lose: :(\n")
            consoleOut("Go again? (Y)")
            guesses = 0
            gameOver = true
        }

    }
    
    
    func consoleOut(text: String){
        output.text = output.text + text
    }
    
    func generateNewNumber() -> UInt32{
        return arc4random_uniform(100) + 1
    }
    
    func clearInput(){
        inputField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        number = generateNewNumber()
        consoleOut("I'm thinking of a number...\n")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

