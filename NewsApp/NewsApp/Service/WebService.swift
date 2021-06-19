//
//  WebService.swift
//  NewsApp
//
//  Created by Ali Atakan AKMAN on 20.06.2021.
//

import Foundation


//Servisten veri çekmek için. Escaping Closure kullanıyoruz. Kaçabilen fonskyion denir ve asenkron bir işlem yapacaksak kullanılır.

class WebService {
    
    func haberleriIndir(url : URL , completion : @escaping ([News]?) -> () ) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }
            else if let data = data {
                
                let haberlerDizisi = try? JSONDecoder().decode([News].self, from: data)
                
                if let haberlerDizisi = haberlerDizisi {
                    completion(haberlerDizisi)
                }
            }
        }.resume()
    }
}
