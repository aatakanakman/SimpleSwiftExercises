//
//  ViewController.swift
//  NewsApp
//
//  Created by Ali Atakan AKMAN on 19.06.2021.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    

    @IBOutlet weak var tableView: UITableView!
    
    
    private var newsTableViewModel : NewsTableViewModel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        veriAl()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
            
        }
    
    
    func veriAl(){
        
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/BTK-iOSDataSet/master/dataset.json" )
        
            WebService().haberleriIndir(url: url!) { (haberler) in
            
                if let haberler = haberler {
                
                    self.newsTableViewModel = NewsTableViewModel(newsList: haberler)
                    
                    //Ne zaman nerde hangi threadde çalıştıracağını söylememize yarayan fonskiyon.
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        }
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsTableViewModel == nil ? 0 : self.newsTableViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SingleNewCell
        
        let newsViewModel = self.newsTableViewModel.newsAtIndexPath(indexPath.row)
        
        cell.newTitleLabel.text = newsViewModel.title
        cell.newContentLabel.text = newsViewModel.story
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }


}

