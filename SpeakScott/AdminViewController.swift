//
//  AdminViewController.swift
//  SpeakScott
//
//  Created by Theodore Cross on 4/27/18.
//  Copyright © 2018 Theodore Cross. All rights reserved.
//

import UIKit
import Firebase

class AdminViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    let rootref = Database.database().reference()
    
    @IBOutlet weak var tableView: UITableView!
    var user = User()
    
    var listOfQuestions  : [List] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self 
        tableView.delegate = self
        
        listOfQuestions = addTestData()
        print(listOfQuestions)
    }

    override func viewWillAppear(_ animated: Bool) { //Screen Opens
        tableView.reloadData()
    }
    
    @IBAction func ToSpeakButton(_ sender: Any) {
        let myVC = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        myVC.user = user
        navigationController?.pushViewController(myVC, animated: true)
    }
    @IBAction func AddToList(_ sender: Any) {
        //let nextVC = AdminEditViewController()
        let myVC = storyboard?.instantiateViewController(withIdentifier: "AdminEditViewController") as! AdminEditViewController
        //nextVC.previousVC = self
        myVC.user = user
        navigationController?.pushViewController(myVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfQuestions.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let list = listOfQuestions[indexPath.row]
        
        cell.textLabel?.text = list.question
        
        return cell
    }
    
    func addTestData() -> [List] {
        //test data
        
        let x = List()
        x.question = "Do you want some wine?"
        x.approval = "Yes, I want some wine."
        x.rejection = "No, I do not want some wine.";
        
        let y = List()
        y.question = "Do you want some Food?"
        y.approval = "Yes, I want some food"
        y.rejection = "No, I do not want some food."
        
        let z = List()
        z.question = "Do you want some song?"
        z.approval = "Yes, I want some song."
        z.rejection = "No, I do not want some song."
        
        return [x, y, z]
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
