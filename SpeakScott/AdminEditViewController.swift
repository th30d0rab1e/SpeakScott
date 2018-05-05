//
//  AdminEditViewController.swift
//  SpeakScott
//
//  Created by Theodore Cross on 5/3/18.
//  Copyright © 2018 Theodore Cross. All rights reserved.
//

import UIKit

class AdminEditViewController: UIViewController {

    var user = User()
    
    @IBOutlet weak var questionBox: UITextField!
    @IBOutlet weak var yesBox: UITextField!
    @IBOutlet weak var noBox: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    var previousVC = AdminViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboard() //For TextBox - Cannot get out of keyboard
        errorLabel.text = ""
        // Do any additional setup after loading the view.
        print("dis be user \(user.username)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitButton(_ sender: Any) {
        if(questionBox.text == ""){
            errorLabel.text = "The question cannot be empty."
        } else if (yesBox.text == ""){
            errorLabel.text = "The yes answer cannot be empty."
        } else if (noBox.text == ""){
            errorLabel.text = "The no answer cannot be empty."
        } else {
            //works!
            let monkey = List()
            monkey.question = questionBox.text!
            monkey.approval = yesBox.text!
            monkey.rejection = noBox.text!
            
            //back to Admin
            previousVC.listOfQuestions.append(monkey)
            previousVC.tableView.reloadData()
            navigationController?.popViewController(animated: true)
        }
    }
}


