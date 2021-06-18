//
//  UserStruct.swift
//  AdvancedSwift
//
//  Created by Ali Atakan AKMAN on 18.06.2021.
//

import Foundation


struct UserStruct {
    
    var isim : String
    var yas : Int
    var meslek : String
    
    // structlarda property ye erişen bir fonksiyon kullacaksak, mutating fonksiyon gerekli.
    mutating func yasiBirArttir() {
        
        self.yas += 1
        
    }
    
}
