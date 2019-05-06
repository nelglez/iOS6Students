//
//  Student.swift
//  Students
//
//  Created by Andrew R Madsen on 8/5/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import Foundation

struct Student: Codable {
    var name: String
    
    var firstName: String {
        //take any string into 2 pieces and seperate by space [0] means take the first element in the array
        return String(name.split(separator: " ")[0])
    }
    
    var lastName: String? {
        //If there isnt a last name
        let result = name.split(separator: " ")
        if result.count == 1 {
            return nil
        } else {
        return String(result[1])
        }
    }
}
