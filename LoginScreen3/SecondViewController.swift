//
//  SecondViewController.swift
//  LoginScreen3
//
//  Created by LeeX on 5/5/17.
//  Copyright © 2017 LeeX. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, Delegate{

    @IBOutlet weak var tableView: UITableView!
    var firData = FirData()
    
    var posts:[postStruct] = []
    var databaseRef: FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        firData.delegate = self
        firData.fetchData()
//        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)
    }
    
//    func loadList(notification: NSNotification){
//        //load data here
//        self.tableView.reloadData()
//    }
    
    func didReceiveData(data: [postStruct]) {
        self.posts = data
        self.tableView.reloadData()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func LogOut(_ sender: Any) {  
        let firebaseAuth = FIRAuth.auth()
        do {
            try firebaseAuth?.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! TableViewCell
        cell.myLabel.text = self.posts[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "updateTodo", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "updateTodo" {
            let destination = segue.destination as! UpdateViewController
            let indexPath = tableView.indexPathForSelectedRow!

            destination.todo = self.posts[indexPath.row]
        }
    }

}
