//
//  UpdateViewController.swift
//  LoginScreen3
//
//  Created by LeeX on 6/9/17.
//  Copyright © 2017 LeeX. All rights reserved.
//

import UIKit

class UpdateViewController: UIViewController {

    @IBOutlet weak var titleInputUpdate: UITextField!
    @IBOutlet weak var contentInputUpdate: UITextView!
    
    var todo: postStruct!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let todo = todo  {
            titleInputUpdate.text = todo.title
            contentInputUpdate.text = todo.content
        } else {
            self.title  = "Add Note"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func DoneButtonUpdate(_ sender: Any) {
        let titleInput = titleInputUpdate.text
        let contentInput = contentInputUpdate.text
        NoteFactory.updateNote(todo, tilte: titleInput, content: contentInput)
        self.navigationController?.popViewController(animated: true)
        
    }
}
