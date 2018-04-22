//
//  ViewController.swift
//  SpeakScott
//
//  Created by Theodore Cross on 4/17/18.
//  Copyright © 2018 Theodore Cross. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var theLabel: UILabel!
    @IBOutlet weak var swipeLabel: UILabel!
    
    var listOfQuestions  : [List] = []
    var index = 1;
    var word:String = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
       // let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext //step1 of CoreData
        
        
        //(UIApplication.shared.delegate as! AppDelegate).saveContext()//Save CoreData
   
        addTestData()
        
        theLabel.text = listOfQuestions[index].question
        
        let string:String! = listOfQuestions[index].question
        let utterance = AVSpeechUtterance(string: string)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        let synth = AVSpeechSynthesizer()
        synth.speak(utterance)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Swiped Right
    @IBAction func SwipeRight(_ sender: UISwipeGestureRecognizer) {
        swipeLabel.text = "Swiped Right"
        index = index + 1;
        
        print("Index is currently ", index)
        print("Count of array is ", listOfQuestions.count)
        
        if (index == listOfQuestions.count){
            print("k im gonna fix it?")
            index = 0
        }
        speakNext(entity: index)
    }
    
    //Swiped Left
    @IBAction func swipeLeft(_ sender: UISwipeGestureRecognizer) {
        swipeLabel.text = "Swiped Left"
        index = index - 1;
        
        print("Index is currently ", index)
        print("Count of array is ", listOfQuestions.count)
        
        if (index == -1){
            print("k im gonna fix it?")
            index = listOfQuestions.count - 1
        }

       speakNext(entity: index)
    }
    //Swiped Up
    @IBAction func swipeUp(_ sender: UISwipeGestureRecognizer) {
        swipeLabel.text = "Swiped Up"
        let string:String! = listOfQuestions[index].approval
        let utterance = AVSpeechUtterance(string: string!)
        
        print(index)
        print(string)
        
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        let synth = AVSpeechSynthesizer()
        synth.speak(utterance)
        
        //Letter Added to Word
        if (listOfQuestions[index].type == 1)
        {
            word += listOfQuestions[index].question
            print("Word is", word)
        }
        
    }
    //Swiped Down
    @IBAction func SwipeDown(_ sender: UISwipeGestureRecognizer) {
        swipeLabel.text = "Swiped Down"
        let string:String! = listOfQuestions[index].rejection
        let utterance = AVSpeechUtterance(string: string)
        
        print(index)
        print(string)
        
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        let synth = AVSpeechSynthesizer()
        synth.speak(utterance)
        
        //Letter Added to Word
        if (listOfQuestions[index].type == 1)
        {
            word = String(word.characters.dropLast())
            print("Word is", word)
        }
    }
    
    func speakNext(entity: Int){
        let string:String! = listOfQuestions[index].question
        let utterance = AVSpeechUtterance(string: string)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        let synth = AVSpeechSynthesizer()
        synth.speak(utterance)
        
        theLabel.text = string
    }
    
    func addTestData() {
        //test data
        let x = List()
        x.question = "Do you want some wine?"
        x.approval = "Yes, I want some wine."
        x.rejection = "No, I do not want some wine.";
        
        let y = List()
        y.question = "Do you want some women?"
        y.approval = "Yes, I want a penis in my mouth."
        y.rejection = "No, I do not want some women."
        
        let z = List()
        z.question = "Do you want some song?"
        z.approval = "Yes, I want some song."
        z.rejection = "No, I do not want some song."
        
        let letterA = List()
        letterA.question = "A"
        letterA.approval = "The letter A added to word"
        letterA.rejection = "Removed"
        letterA.type = 1
        
        let letterB = List()
        letterB.question = "B"
        letterB.approval = "B added to word"
        letterB.rejection = "Removed"
        letterB.type = 1
        
        let letterC = List()
        letterC.question = "C"
        letterC.approval = "C added to word"
        letterC.rejection = "Removed"
        letterC.type = 1
        
        let letterD = List()
        letterD.question = "D"
        letterD.approval = "D added to word"
        letterD.rejection = "Removed"
        letterA.type = 1
        
        let letterE = List()
        letterE.question = "E"
        letterE.approval = "E added to word"
        letterE.rejection = "Removed"
        letterE.type = 1
        
        let letterF = List()
        letterF.question = "F"
        letterF.approval = "F added to word"
        letterF.rejection = "Removed"
        letterF.type = 1
        
        let letterG = List()
        letterG.question = "G"
        letterG.approval = "G added to word"
        letterG.rejection = "Removed"
        letterG.type = 1
        
        let letterH = List()
        letterH.question = "H"
        letterH.approval = "H added to word"
        letterH.rejection = "Removed"
        letterH.type = 1
        
        let letterI = List()
        letterI.question = "I"
        letterI.approval = "I added to word"
        letterI.rejection = "Removed"
        letterI.type = 1
        
        let letterJ = List()
        letterJ.question = "J"
        letterJ.approval = "J added to word"
        letterJ.rejection = "Removed"
        letterJ.type = 1
        
        let letterK = List()
        letterK.question = "K"
        letterK.approval = "K added to word"
        letterK.rejection = "Removed"
        letterK.type = 1
        
        let letterL = List()
        letterL.question = "L"
        letterL.approval = "L added to word"
        letterL.rejection = "Removed"
        letterL.type = 1
        
        let letterM = List()
        letterM.question = "M"
        letterM.approval = "M added to word"
        letterM.rejection = "Removed"
        letterM.type = 1
        
        let letterN = List()
        letterN.question = "N"
        letterN.approval = "N added to word"
        letterN.rejection = "Removed"
        letterN.type = 1
        
        let letterO = List()
        letterO.question = "O"
        letterO.approval = "O added to word"
        letterO.rejection = "Removed"
        letterO.type = 1
        
        let letterP = List()
        letterP.question = "P"
        letterP.approval = "P added to word"
        letterP.rejection = "Removed"
        letterP.type = 1
        
        let letterQ = List()
        letterQ.question = "Q"
        letterQ.approval = "Q added to word"
        letterQ.rejection = "Removed"
        letterQ.type = 1
        
        let letterR = List()
        letterR.question = "R"
        letterR.approval = "R added to word"
        letterR.rejection = "Removed"
        letterR.type = 1
        
        let letterS = List()
        letterS.question = "S"
        letterS.approval = "S added to word"
        letterS.rejection = "Removed"
        letterS.type = 1
        
        let letterT = List()
        letterT.question = "T"
        letterT.approval = "T added to word"
        letterT.rejection = "Removed"
        letterT.type = 1
        
        let letterU = List()
        letterU.question = "U"
        letterU.approval = "U added to word"
        letterU.rejection = "Removed"
        letterU.type = 1
        
        let letterV = List()
        letterV.question = "V"
        letterV.approval = "V added to word"
        letterV.rejection = "Removed"
        letterV.type = 1
        
        let letterW = List()
        letterW.question = "W"
        letterW.approval = "W added to word"
        letterW.rejection = "Removed"
        letterW.type = 1
        
        let letterX = List()
        letterX.question = "X"
        letterX.approval = "X added to word"
        letterX.rejection = "Removed"
        letterX.type = 1
        
        let letterY = List()
        letterY.question = "Y"
        letterY.approval = "Y added to word"
        letterY.rejection = "Removed"
        letterY.type = 1
        
        let letterZ = List()
        letterZ.question = "Z"
        letterZ.approval = "Z added to word"
        letterZ.rejection = "Removed"
        letterZ.type = 1
        
        listOfQuestions = [x, y, z, letterA, letterB, letterC,letterD,letterE,letterF, letterG, letterH, letterI,letterJ, letterK, letterL, letterM, letterN, letterO, letterP, letterQ, letterR, letterS, letterT, letterU, letterV, letterW, letterX, letterY, letterZ]
    }
    //get Questions
//    func getQuestions() {
//        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//
//        do {
//            listOfQuestions = try context.fetch(List.fetchRequest()) as! [List]
//            print (listOfQuestions)
//        } catch {
//            print("Cant getQuestions()")
//        }
//
//    }
    
    
}

