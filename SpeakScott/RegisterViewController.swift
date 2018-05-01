//
//  RegisterViewController.swift
//  SpeakScott
//
//  Created by Theodore Cross on 4/24/18.
//  Copyright © 2018 Theodore Cross. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var RoleDefinition: UILabel!
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var password1: UITextField!
    @IBOutlet weak var password2: UITextField!
    @IBOutlet weak var roleType: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboard() //For TextBox - Cannot get out of keyboard
        RoleDefinition.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func SubmitButton(_ sender: Any) {
        if(emailAddress.text == "" || emailAddress.text == nil){
            emailAddress.text = "Cannot be empty";
        } else if (password1.text == "" || password1.text == nil){
            password1.text = "Cannot be empty";
        } else if (password2.text == "" || password2.text == nil){
            password2.text = "Cannot be empty"
        } else if (password1.text != password2.text!) {
            password1.text = "Password does not match"
            password2.text = "Password does not match"
        } else if (emailAddress.text == "Cannot be empty" || password1.text == "Cannot be empty" || password2.text == "Cannot be empty") {
            emailAddress.text! = ""
            password1.text! = ""
            password2.text! = ""
        }
        else { //Succeed
            print("Success!")
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext //step1 of CoreData

            let login = Login(context: context) //CoreData Step2
            login.username = emailAddress.text!
            login.password = password1.text!
            login.role = Int16(roleType.selectedSegmentIndex)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()//Save CoreData

            let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            self.present(vc, animated: true, completion: nil)
        }
    }
    @IBAction func SegmentedSwitch(_ sender: Any) { //Show role description
        if(roleType.selectedSegmentIndex == 0){
            RoleDefinition.text! = "Administrators add and update data for a user."
        } else if(roleType.selectedSegmentIndex == 1){
            RoleDefinition.text! = "User will have basic control, only to view data."
        } else if (roleType.selectedSegmentIndex == 2){
            RoleDefinition.text! = "Multi-Pass"
        }
    }
}

extension UIViewController
{
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}
