//
//  ViewController.swift
//  TextTwistProject
//
//  Created by Benjamin Stone on 11/4/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var randomScrambledWord: UILabel!
    
    @IBOutlet weak var Textfield: UITextField!
    
    var theWord = Word.getRandomWord().scrambled
    
    var theWordArr: [Character] = []
    // want the word to become an arr
    
    //var textfieldInput = Text
    
    var textfieldArr: [Character] = []
    // want the letters inputed in the text field to be stored in this arr
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        makingWordArr()
        randomScrambledWord.text = String(theWordArr)
        print("\(theWordArr)")
        
        // doesnt work
        //Textfield.delegate = self
        
        
    }
    
    func makingWordArr() {
        for char in theWord {
            theWordArr.append(char)
        }
    }
    
    
    
}

// MARK: EXTENSIONS

extension ViewController: UITextViewDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldBeginEditing")
        
        return true
        
    }
    // once the tect field is pressed and if something it being entered
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        

        // as soon as the person starts typing the letter should be removed
        
        guard let text = Textfield.text else{
            return false
        }
         // makes the textfieldArr 
        for char in text {
            textfieldArr.append(char)
        }
        
        print(textfieldArr)
        print("shouldChangeCharactersIn")
        print(text)
        
        return true
        
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        return true
        print("it works")
        
    }
    // this is for the return button on the keyboard.
    // check if the word is correct.
    
    
}
















/*
 func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
 print("shouldChangeCharactersIn")
 
 guard let text =  textField.text else {
 return false
 }
 
 let currentText = text + string
 
 if enteredGuesses.contains(currentText) {
 //updates message label
 messageLabel.text = "Already guessed \(currentText)"
 messageLabel.textColor = .red
 // clears textfield
 textField.text = ""
 
 return false
 }
 
 print("textfeild: \(textField.text)")
 // this is the saved characters inputed from the textfield
 
 print("string: \(string)")
 // this is the new character most recently inputed
 print(currentText)
 return true
 }
 
 
 
 func textFieldShouldReturn(_ textField: UITextField) -> Bool {
 print("textFieldShouldReturn")
 checkUsersGuess()
 
 textField.resignFirstResponder()
 textField.text = " "
 return true
 
 }
 }
 Collapse
 
 */

