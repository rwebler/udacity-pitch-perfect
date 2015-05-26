//
//  RecordedAudio.swift
//  Pitch Perfect
//
//  Created by Rodrigo Webler on 5/19/15.
//  Copyright (c) 2015 Rodrigo Webler. All rights reserved.
//

import Foundation

class RecordedAudio: NSObject{
    var filePathUrl: NSURL!
    var title: String!
    
    init(filePathUrl: NSURL, title: String) {
        self.filePathUrl = filePathUrl
        self.title = title
    }
}