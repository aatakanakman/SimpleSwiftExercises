//
//  UserClass.swift
//  AdvancedSwift
//
//  Created by Ali Atakan AKMAN on 18.06.2021.
//

import Foundation


class UserClass {
    
    var isim : String
    var yas : Int
    var meslek : String
    
    
    init(isim : String , yas : Int , meslek : String ) {
        self.isim = isim
        self.yas = yas
        self.meslek = meslek
    }
    
    func yasiBirArttir() {
        self.yas += 1
    }
}
