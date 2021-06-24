//
//  DetailViewController.swift
//  FindWeather
//
//  Created by Ali Atakan AKMAN on 25.06.2021.
//

import UIKit

class DetailViewController: UIViewController {

    var city : String = ""
    
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var cityTemp: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getTodayResult(cityName: city)
        
        
        
        
        cityName.text = city
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    
    
    func getTodayResult(cityName : String) {
        
        if let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=0f6112b1d663b03202ffabe9788c51ef"){
         
            let request = URLRequest(url: url)
            
            let task = URLSession.shared.dataTask(with: request){(data, response, error) in
                
                if error == nil {
                    
                    if let incomingData = data {
                        
                        do {
                            let json =  try JSONSerialization.jsonObject(with: incomingData, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                            
                            
                            
                            
                            
                            if let main = json["main"] as? NSDictionary {
                                
                                if let temp = main["temp"] as? Double {
                                    
                                    let state = Int(temp - 273.15)
                                    
                                    DispatchQueue.main.async {
                                        
                                        self.cityTemp.text = String(state)
                                        
                                    }
                                    
                                }
                                
                            }
                            
                        } catch  {
                            print("Bir hata oluştu.")
                        }
                        
                    }
                    
                }
                
            }
            task.resume()
        }
        
    }
}
