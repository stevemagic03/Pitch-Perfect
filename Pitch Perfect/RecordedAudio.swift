//
//  RecordedAudio.swift
//  Pitch Perfect
//
//  Created by WangHaoxin on 1/14/16.
//  Copyright © 2016 Haoxin Wang. All rights reserved.
//

import Foundation

class RecordedAudio {
   
    let filePathUrl: NSURL!
    let title: String!
    
    init (filePathUrl : NSURL!, title : String!){
        self.filePathUrl = filePathUrl
        self.title = title
        
    }
}