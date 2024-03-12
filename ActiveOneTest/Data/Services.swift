//
//  Services.swift
//  ActiveOneTest
//
//  Created by Andres Orjuela on 12/03/24.
//

import Foundation


class LoanService {
    
    func loadJson(filename fileName: String) -> Loan? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Loan.self, from: data)
                return jsonData.self
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}

