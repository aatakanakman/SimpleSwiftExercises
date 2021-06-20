//
//  FeedViewController.swift
//  ParseApp
//
//  Created by Ali Atakan AKMAN on 20.06.2021.
//

import UIKit
import Parse

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var tableView: UITableView!
    
    var postArray = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        getData()
        
        tableView.allowsSelection = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(getData), name: NSNotification.Name(rawValue: "yeniPost"), object: nil)
    }
    
    
    
    @objc func getData(){
        
        let query = PFQuery(className: "Post")
        query.addDescendingOrder("createdAt")
        
        query.findObjectsInBackground { (objects, error) in
            
            if error != nil {
                self.errorMessage(title: "Error", message: error?.localizedDescription ?? "Error")
            }else{
                
                if objects != nil {
                    
                    if objects!.count > 0 {
                        
                        self.postArray.removeAll(keepingCapacity: false)
                        
                        for object in objects! {
                         
                            if let postUser = object.object(forKey: "postUser") as? String {
                                if let comment = object.object(forKey: "comment") as? String {
                                    if let image = object.object(forKey: "image") as? PFFileObject{
                                        
                                        let post = Post(username: postUser, comment: comment, image: image)
                                        
                                        self.postArray.append(post)
                                        
                                    }
                                }
                            }
                        }
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
    
    func errorMessage(title : String , message : String){
        
        let alert = UIAlertController(title: title , message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil )
        
        alert.addAction(okButton)
        
        self.present(alert, animated: true, completion: nil)
        
    }
 
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FeedTableViewCell
        cell.usernameLabel.text = postArray[indexPath.row].username
        cell.commentLabel.text = postArray[indexPath.row].comment
        
        postArray[indexPath.row].image.getDataInBackground { (data, error) in
            
            if error != nil  {
                self.errorMessage(title: "Error", message: error?.localizedDescription ?? "Error")
            }else{
                if let data = data {
                    cell.feedImageView.image = UIImage(data: data)
                }
            }
            
        }
        
        return cell
        
        
    }
    

}
