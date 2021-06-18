//
//  main.swift
//  ProtocolSwiftProject
//
//  Created by Ali Atakan AKMAN on 19.06.2021.
//

import Foundation

/*
 
 Protocol -> Başka sınıflar ve başka structlarda kullanalım amacıyla kullanılır.
 
 
 
 
 */

protocol Running {
    
    func MyRun()
    
}



class Animal {
    
    func test() {
        print("test")
    }
    
}


class Dog : Running {
    func MyRun() {
        print("running")
    }
}

let barley = Dog()
barley.MyRun()

class Cat : Animal, Running {
    
    func MyRun() {
        print("running")
    }
    
    
    
}

let cat = Cat();

cat.MyRun()
cat.test()


class Turtle : Animal {
    
    
    
}

let leonardo = Turtle()

//leonardo.Running()


struct Bird : Running {

    func MyRun() {
        print("cant running")
    }
    
}


let tweety = Bird()

tweety.MyRun()

