//
//  ViewController.swift
//  SimpsonBook
//
//  Created by Ali Atakan AKMAN on 27.05.2020.
//  Copyright © 2020 Ali Atakan AKMAN. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var tableView: UITableView!
    
    var choosenSimpson : Simpson?
    
    var mySimpsons = [Simpson]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Çok önemli
        tableView.dataSource = self
        tableView.delegate = self
    
        //Simson objects
        
        let homer = Simpson(simpsonName: "Homer Simpson", simpsonJob: "Nuclear Safety", simpsonImage: UIImage(named: "Homer Simpson")!)
        
        let marge = Simpson(simpsonName: "Marge Simpson", simpsonJob: "Housewife", simpsonImage: UIImage(named: "Marge Simpson")!)
        
        let bart = Simpson(simpsonName: "Bart Simpson", simpsonJob: "Student", simpsonImage: UIImage(named: "Bart Simpson")!)
        
        let lisa = Simpson(simpsonName: "Lisa Simpson", simpsonJob: "Student", simpsonImage: UIImage(named: "Lisa Simpson")!)
        
        let maggie = Simpson(simpsonName: "Magie Simpson", simpsonJob: "Baby", simpsonImage: UIImage(named: "Maggie Simpson")!)
        
        
        mySimpsons.append(homer)
        mySimpsons.append(marge)
        mySimpsons.append(bart)
        mySimpsons.append(lisa)
        mySimpsons.append(maggie)
    }


    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySimpsons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let cell = UITableViewCell()
        cell.textLabel?.text = mySimpsons[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        choosenSimpson = mySimpsons[indexPath.row]
        
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // Eğer tıklanan segue nin ide si .... ise gidilenvc yi segue destination a eşitle.
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as? DetailsVC  //DetailsVC yi bir değşken gibi tanımlayabiliriz.
            destinationVC?.selectedSimpson = choosenSimpson
        }
    }
    
}

