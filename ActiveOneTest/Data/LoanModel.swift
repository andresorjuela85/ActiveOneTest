//
//  loanModel.swift
//  ActiveOneTest
//
//  Created by Andres Orjuela on 12/03/24.
//

import Foundation

struct Loan: Codable {
    let email: String
    let paymentDetails: PaymentDetails
    let loanDetails: LoanDetails
}

struct PaymentDetails: Codable {
    let dueInDays: Int
    let amountDue: Double
    let nextPaymentDate: String
    let paymentProgress: PaymentProgress
}

struct PaymentProgress: Codable {
    let currentPaymentNumber: Int
    let totalPayments: Int
}

struct LoanDetails: Codable {
    let loanID: String
    let remainingBalance: Int
    let amountBorrowed: Int
    let interestPaidToDate: Double
    let interestRate: Double
    let maxCreditAmount: Int
    let repaymentDay: Int
    let lastFourPaymentCard: String
    let numberOfDocuments: Int
}

