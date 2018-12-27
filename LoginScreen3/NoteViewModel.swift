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
    var selectedNote: postStruct?
    var getNoteTitles: (([String])->())?
    
    var firData = FirData()
    
    init() {
        firData.delegate = self
        firData.fetchData()
        if selectedNote != nil {
            selectedNote =  nil
        }
    }
    
    func selectNote(at index: Int, _ completion: (()->())? = nil) {
        if index >= self.notes.count {
            return
        }
        
        if let willSelect = notes.enumerated().filter({ (i, post) -> Bool in
            return i == index
        }).map({ (index, post) -> postStruct in
            return post
        }).first {
            self.selectedNote = willSelect
            completion?()
        }
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
