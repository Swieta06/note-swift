//
//  LoanStore.swift
//  Ltihan7-Prototyping
//
//  Created by MacBook Pro on 31/03/23.
//

import Foundation

class LoanStore: Decodable, ObservableObject {
    @Published var loans:[Loan]=[]
    private static var baseURL = "https://api.kivaws.org/v1/loans/newest.json"
    
    enum CodingKeys: CodingKey{
        case loans
    }
    
    init(){}
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.loans=try values.decode([Loan].self, forKey: .loans)
    }
    
    // MARK: FETCH DATA
    func fetchLatestLoans(){
        guard let loanUrl = URL(string: LoanStore.baseURL) else {return}
        let request = URLRequest (url: loanUrl)
        let task = URLSession.shared.dataTask(with: request) { data, response,
            error in
        if let error = error {
            print(error)
            
        }
            if let data = data{
                DispatchQueue.main.async {
                    self.loans=self.parseJsonData(data: data)
                }
               
                
            }
            
        }
        task.resume()
    }
    func parseJsonData(data: Data)->[Loan]{
        let decoder = JSONDecoder()
        do{
            let loanStore = try decoder.decode(LoanStore.self, from: data)
            self.loans = loanStore.loans
            
        }catch{
            print(error)
            
        }
        return loans
    }
        
    
}
