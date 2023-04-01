//
//  NewsProvider.swift
//  BeritaLima
//
//  Created by MacBook Pro on 28/03/23.
//

import Foundation
import UIKit
class NewsProfide{
    static let shared: NewsProfide=NewsProfide()
    private init(){}
    let baseUrlString = "https://api.nytimes.com/svc/mostpopular/v2"
    let apiKey = "poqAplnIabq4G81jyrGocLrIAYgT8W61"
    
    func loadTopNews(completion:@escaping([News])->Void) {
      
        let pathUrlString = "/viewed/1.json"
        
        
        let url = URL(string: "\(baseUrlString)\(pathUrlString)?api-key=\(apiKey)")!
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let jsonData = data {
                do {
                    let newsResponse = try JSONDecoder().decode(NewsResponse.self, from: jsonData)
                    
                    DispatchQueue.main.async {
                        //--9
                        completion(newsResponse.results)
                       
                    }
                    
                } catch {
                    print(error.localizedDescription)
                }
            }else{
                DispatchQueue.main.async {
                    completion([])
                }
            }
        }
        task.resume()
    }
    func loadLatesNews(completion:@escaping([News])->Void) {
      
        let pathUrlString = "/viewed/7.json"
        
        
        let url = URL(string: "\(baseUrlString)\(pathUrlString)?api-key=\(apiKey)")!
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let jsonData = data {
                do {
                    let newsResponse = try JSONDecoder().decode(NewsResponse.self, from: jsonData)
                    
                    DispatchQueue.main.async {
                        //--9
                        completion(newsResponse.results)
                       
                    }
                    
                } catch {
                    print(error.localizedDescription)
                }
            }else{
                DispatchQueue.main.async {
                    completion([])
                }
            }
        }
        task.resume()
    }
    
    func downloadImage(urlString: String, completion: @escaping (UIImage?) -> Void) {
        if let url = URL(string: urlString) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url)
                DispatchQueue.main.async {
                    if let imageData = data {
                        let image = UIImage(data: imageData)
                        completion(image)
                    } else {
                        completion(nil)
                    }
                }
            }
        } else {
            completion(nil)
        }
    }
}
