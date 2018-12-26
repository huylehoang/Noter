//
//  NoteFactory.swift
//  LoginScreen3
//
//  Created by Huy Le Hoang on 12/26/18.
//  Copyright © 2018 LeeX. All rights reserved.
//

import Foundation
class NoteFactory {
    static func updateNote(_ note: postStruct?, tilte: String?, content: String?) {
        if let note = note {
            let updateNoteCommand = UpdateNoteCommand()
            updateNoteCommand.execute(with: note.key, title: tilte, content: content)
        } else {
            let addNoteCommand = AddNoteCommand()
            addNoteCommand.execute(with: "", title: tilte, content: content)
        }
    }
}
