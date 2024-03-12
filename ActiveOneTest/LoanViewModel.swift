//
//  LoanViewModel.swift
//  ActiveOneTest
//
//  Created by Andres Orjuela on 12/03/24.
//

import Foundation
import Observation

@Observable
final class LoanViewModel {
    
    var service = LoanService()
    var loans: Loan?
    
    func loadLoan() {
        if let loan = service.loadJson(filename: "data") {
            loans = loan
        }
    }
    
    func getFormattedDate(_ date: String?) -> String {
        guard let date = date else { return "" }
        
        let originDateFormatter = DateFormatter()
        originDateFormatter.dateFormat = "yy-MM-dd"
        if let originDate = originDateFormatter.date(from: date) {
            let resultDateFormatter = DateFormatter()
            resultDateFormatter.dateFormat = "dd MMM"
            return resultDateFormatter.string(from: originDate)
        } else {
            return ""
        }
    }
}
