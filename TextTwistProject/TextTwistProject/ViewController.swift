//
//  ViewController.swift
//  TextTwistProject
//
//  Created by Benjamin Stone on 11/4/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var randomScrambledWord: UILabel!
    
    @IBOutlet weak var Textfield: UITextField!
    
    var theWord = Word.getRandomWord()
      
      var theWordArr: [Character] = []
      // want the word to become an arr
      
      //var textfieldInput = Text
      
      var textfieldArr: [Character] = []
      // want the letters inputed in the text field to be stored in this arr
      
      override func viewDidLoad() {
          super.viewDidLoad()
          // Do any additional setup after loading the view.
        
        randomScrambledWord.text = theWord.scrambled
          print("\(theWord)")
          mainLabel.text = "The word you need to unscramble is displayed below. As you enter in the letters they will disappear"
          // doesnt work
        Textfield.delegate = self
          
          
      }
  
    @IBAction func resetButton(_ sender: UIButton) {
        
        if randomScrambledWord.text == Textfield.text {
        
        mainLabel.text = " please try to guess the word!!!!"
        }
    }
    
    // checking if random word unscrammbled works..
    func checkingAnswer() {
        if randomScrambledWord.text == Textfield.text {
            
            print()
            mainLabel.text = "You got it right!!!"
            newWord()
        }
    }
    
        func newWord() {
            
            let newWord = Word.getRandomWord().scrambled
            randomScrambledWord.text = newWord
        }
        
}
    
    
    /*
    var theWordTwo = getNewrandomwod(ViewController)
    
    func getNewrandomwod() -> String {
        
       // let theWord =

        return Word.getRandomWord().scrambled
    }
  */

    
    

// MARK: EXTENSIONS

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldBeginEditing")
        
        return true
        
    }
    // once the tect field is pressed and if something it being entered
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // textField = UITextField
        // string = the actually things typed in which is a string...
        // cannot remove from the text field because it is only the location of string... it is not actually the string ..
        // to remove the letters in the string you need to actually access the string..
        
    
        // as soon as the person starts typing the letter should be removed
       
        //randomScrambledWord.text? == is nil by default need to unwrapp to put something in it but we need to unwrap it to protect it
        
        if randomScrambledWord.text?.contains(string) ?? false {
            // above is a bool because it says that if randomScrambledWord.text? = has to have the ? with it because it can be emtpy contains a string so if the actual word itself contains a string that I want to be characters then it is true otherwise it is false
          //  print(randomScrambledWord.text)
            
            randomScrambledWord.text?.remove(at: (randomScrambledWord.text?.firstIndex(of: Character(string)))!)
            // only checking each input to access all the characters in the string
            // this removes from the randomScrambledWord the character at the first sign of said character..
            
        } else if string == "" {
            // if it is an empty letter(deleted item)
            
            randomScrambledWord.text?.insert(textField.text?.last ?? "b", at: randomScrambledWord.text!.endIndex)
            // adds the last correct input to the index.
            
        } else {
            return false
            // this stops the incorrect input from being added to the display..
        }
        
        /*
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
        
        */
        return true

        
    }
     
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        checkingAnswer()
        
            
         // theWord
        return true
        
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

