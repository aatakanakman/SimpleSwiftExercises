//
//  ViewController.swift
//  SameAsYT
//
//  Created by Ali Atakan AKMAN on 23.06.2021.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
   
    @IBOutlet weak var tableView: UITableView!
    var videos = [Video]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 310
        loadData()
    }
    
    func loadData() {
        
        guard let jsonUrl = Bundle.main.url(forResource: "videos", withExtension: "json"), let data = try? Data(contentsOf: jsonUrl) else {
            return
        }
        
        DispatchQueue.main.async {
            
            do{
                
                self.videos = try JSONDecoder().decode([Video].self, from: data)
                
                self.tableView.reloadData()
            }catch{
                print(error.localizedDescription)
            }
            
        }
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! VideoTableViewCell
        let video = videos[indexPath.row]
        cell.prepare(video: video)
        return cell
    }
}

