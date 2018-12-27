//
//  NoteViewModel.swift
//  LoginScreen3
//
//  Created by Huy Le Hoang on 12/27/18.
//  Copyright © 2018 LeeX. All rights reserved.
//

import Foundation

class NoteViewModel {
    fileprivate var notes: [postStruct] = []
    private var selectedNote: postStruct?
    var getNoteTitles: (([String])->())?
    
    var firData = FirData()
    
    init() {
        firData.delegate = self
        firData.fetchData()
    }
    
    func resetSelected() {
        if selectedNote != nil {
            selectedNote = nil
        }
    }
    
    func selectNote(at index: Int, _ completion: (()->())? = nil) {
        if self.notes.count == 0 && index >= self.notes.count {
            return
        }
        
        self.selectedNote = self.notes[index]
        completion?()
    }
    
    func getSelectedNote() -> postStruct? {
        if let selected = self.selectedNote {
            return selected
        } else {
            return nil
        }
    }
}

extension NoteViewModel: Delegate {
    func didReceiveData(data: [postStruct]) {
        self.notes = data.sorted(by: { (f, s) -> Bool in
            var descending = false
            if let dateOfFirst = f.date, let dateOfSecond = s.date, dateOfFirst != 0, dateOfSecond != 0 {
                descending = dateOfFirst > dateOfSecond
            }
            return descending
        }).map{ $0 }

        let noteTitles = self.notes.map({ (post) -> String in
            return post.title
        })
        
        if noteTitles.count > 0 {
            self.getNoteTitles?(noteTitles)
        } else {
            self.getNoteTitles?([])
        }
    }
}
