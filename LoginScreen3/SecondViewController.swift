//
//  SecondViewController.swift
//  LoginScreen3
//
//  Created by LeeX on 5/5/17.
//  Copyright © 2017 LeeX. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    private var noteViewModel = NoteViewModel()
    private lazy var noteTitles = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadData()
    }
    
    private func reloadData() {
        noteViewModel.getNoteTitles = { [unowned self] (notes) in
            self.noteTitles = notes.map{ $0 }
            self.tableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Add(_ sender: UIBarButtonItem) {
        let updateVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UpdateViewController") as! UpdateViewController
        self.navigationController?.pushViewController(updateVC, animated: true)
    }
    
    @IBAction func LogOut(_ sender: Any) {
        let logOutCommand = LogOutCommand()
        logOutCommand.execute { [unowned self] in
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.noteTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! TableViewCell
        cell.myLabel.text = self.noteTitles[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        noteViewModel.selectNote(at: indexPath.row) { [unowned self] in
            self.performSegue(withIdentifier: "updateTodo", sender: self)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "updateTodo" {
            let destination = segue.destination as! UpdateViewController
            if let selected = noteViewModel.getSelectedNote() {
                destination.todo = selected
            }
        }
    }

}
