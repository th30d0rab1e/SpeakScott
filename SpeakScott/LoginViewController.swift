//
//  LoginViewController.swift
//  SpeakScott
//
//  Created by Theodore Cross on 4/24/18.
//  Copyright © 2018 Theodore Cross. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var users  : [User] = []

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTestData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func loginButton(_ sender: Any) {
        if(emailText.text == ""){
            emailText.text = "Cannot be empty"
        } else if (passwordText.text == ""){
            passwordText.text = "Cannot be empty"
        } else if (emailText.text == "Cannot be empty" || passwordText.text == "Cannot be empty"){
            emailText.text = ""
            passwordText.text = ""
        } else { //Check Username and Password
            var userFound = false;
            for user in users { //search through user
                if(user.username == emailText.text){
                    userFound = true
                    if (user.password == passwordText.text){ //Password Match - Go to next screen
                        if(user.role > 0){//user login
                            let user = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                            self.present(user, animated: true, completion: nil)
                        } else if (user.role == 0){ //go to admin login
                            let admin = self.storyboard?.instantiateViewController(withIdentifier: "AdminViewController") as! AdminViewController
                            self.present(admin, animated: true, completion: nil)
                        }
                    } else {
                        emailText.text = "Incorrect password"
                    }
                }
            }
            if (userFound == false){
                emailText.text = "UserName not found"
            }
        }
    }
    
    func addTestData() {
        let x = User()
        x.username = "ted"
        x.password = "1234"
        x.role = 0 //admin
        
        let y = User()
        y.username = "theodore"
        y.password = "1234"
        y.role = 1 //User
        
        let z = User()
        z.username = "teddy"
        z.password = "1234"
        z.role = 2 //Meat Popsicle
        
        let d = User()
        d.username = "devon"
        d.password = "5676"
        d.role = 2
        
        users = [x, y, z, d]
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
