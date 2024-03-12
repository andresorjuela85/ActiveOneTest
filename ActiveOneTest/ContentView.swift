//
//  ContentView.swift
//  ActiveOneTest
//
//  Created by Andres Orjuela on 12/03/24.
//

import SwiftUI

struct ContentView: View {
    
    let viewModel = LoanViewModel()
    
    var body: some View {
        ScrollView {
            headerView
            
            loanDetailView
            
            moreOptionsView
        }
        .background {
            Image("coin")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 500)
                .padding(.leading, 250)
                .padding(.top, -520)
        }
        .onAppear {
            viewModel.loadLoan()
        }
    }
    
    
    private var headerView: some View {
        VStack {
            ZStack {
                VStack {
                    Spacer()
                    
                    HStack(alignment: .lastTextBaseline) {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Due in \(viewModel.loans?.paymentDetails.dueInDays ?? 0) days")
                                .foregroundColor(.gray)
                                .font(.system(size: 16))
                            
                            HStack(alignment: .lastTextBaseline, spacing: 0) {
                                Text(String(format: "$%.2f", viewModel.loans?.paymentDetails.amountDue ?? 0))
                                    .bold()
                                    .font(.system(size: 48))
                                //Text(".93")
                                  //  .foregroundColor(.gray)
                                   // .font(.system(size: 24))
                            }
                        }
                        
                        Spacer()
                        
                        Image("creditCard")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 30)
                    }
                }
                .frame(height: 220)
            }
            
            HStack(spacing: 0) {
                Text("Next payment ")
                    .foregroundColor(.gray)
                    .font(.system(size: 16))
                Text(viewModel.getFormattedDate(viewModel.loans?.paymentDetails.nextPaymentDate))
                    .bold()
                    .font(.system(size: 16))
                Spacer()
                Text(String(viewModel.loans?.paymentDetails.paymentProgress.currentPaymentNumber ?? 0))
                    .bold()
                    .font(.system(size: 16))
                Text(" of \(viewModel.loans?.paymentDetails.paymentProgress.totalPayments ?? 0) payments")
                    .foregroundColor(.gray)
                    .font(.system(size: 16))
            }
            .padding(.vertical, 18)
            
            Button(action: {
                
            }, label: {
                Text("Make a payment")
                    .bold()
                    .foregroundColor(.white)
            })
            .frame(height: 60)
            .frame(maxWidth: .infinity)
            .background(Color.pink)
            .cornerRadius(30)
        }
        .padding(.horizontal, 18)
        .padding(.bottom, 24)
    }
    
    private var loanDetailView: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Loan Details")
                .bold()
                .font(.system(size: 38))
            
            VStack(spacing: 12) {
                HStack(spacing: 0) {
                    Text("Left ")
                        .foregroundColor(.gray)
                        .font(.system(size: 16))
                    Text("$\(viewModel.loans?.loanDetails.remainingBalance ?? 0)")
                        .bold()
                        .font(.system(size: 16))
                    Spacer()
                    Text("Amount Borrowed ")
                        .foregroundColor(.gray)
                        .font(.system(size: 16))
                    Text("$\(viewModel.loans?.loanDetails.amountBorrowed ?? 0)")
                        .bold()
                        .font(.system(size: 16))
                }
                
                HStack(spacing: 3) {
                    RoundedRectangle(cornerRadius: 3)
                        .fill(.green)
                        .frame(width: 250, height: 20)
                    RoundedRectangle(cornerRadius: 3)
                        .fill(.gray)
                        .frame(height: 20)
                    RoundedRectangle(cornerRadius: 3)
                        .fill(.gray)
                        .frame(height: 20)
                }
            }
            
            VStack {
                HStack {
                    LoanDetailView(title: "Interest", detail: "$\(viewModel.loans?.loanDetails.interestPaidToDate ?? 0.0)")
                    LoanDetailView(title: "Interest Rate", detail: "\(viewModel.loans?.loanDetails.interestRate ?? 0)%")
                }
                
                HStack {
                    
                    LoanDetailView(title: "Loan ID", detail: viewModel.loans?.loanDetails.loanID ?? "")
                    
                    VStack() {
                        Image(systemName: "arrow.right.circle.fill")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(.white)
                            .frame(width: 40, height: 40)
                            .padding(.top, 20)
                        Spacer()
                        Text("Upcoming payments")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 16))
                            .bold()
                            .padding()
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.pink)
                    .cornerRadius(15)
                }
            }
        }
        .padding(.horizontal, 18)
        .padding(.vertical, 24)
        .background {
            Color(red: 222/250, green: 222/250, blue: 222/250)
                .cornerRadius(30)
        }
    }
    
    private var moreOptionsView: some View {
        VStack(alignment: .leading) {
            Text("More options")
                .bold()
                .font(.system(size: 38))
            
            OptionView(title: "Increase Paydown Credit",
                       subtitle: "Up to $\(viewModel.loans?.loanDetails.maxCreditAmount ?? 0)",
                       icon: Image(systemName: "arrow.right.circle.fill"))
            
            OptionView(title: "Change repayment date",
                       subtitle: "Currently on the \(viewModel.loans?.loanDetails.repaymentDay ?? 0)th",
                       icon: Image(systemName: "calendar.circle.fill"))
            
            OptionView(title: "Update Payment Details",
                       subtitle: "Account ending \(viewModel.loans?.loanDetails.lastFourPaymentCard ?? "")",
                       icon: Image(systemName: "creditcard.circle.fill"))
            
            OptionView(title: "Update personal information",
                       subtitle: viewModel.loans?.loanDetails.lastFourPaymentCard ?? "",
                       icon: Image(systemName: "person.circle.fill"))
            
            OptionView(title: "View saved documents",
                       subtitle: "\(viewModel.loans?.loanDetails.numberOfDocuments ?? 0) documents",
                       icon: Image(systemName: "checkmark.square.fill"))
        }
        .padding(.horizontal, 18)
        .padding(.vertical, 24)
        .background {
            Color(red: 222/250, green: 222/250, blue: 222/250)
                .cornerRadius(30)
        }
    }
}

struct OptionView: View {
    
    var title: String
    var subtitle: String
    var icon: Image
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .bold()
                    .font(.system(size: 16))
                Text(subtitle)
                    .foregroundColor(.gray)
                    .font(.system(size: 16))
            }
            
            Spacer()
            
            icon
                .resizable()
                .renderingMode(.template)
                .foregroundColor(.pink)
                .frame(width: 40, height: 40)
        }
        .padding(24)
        .frame(height: 90)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
    }
}

struct LoanDetailView: View {
    
    var title: String
    var detail: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 14))
                .foregroundStyle(Color.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
                .bold()
                .padding()
            Spacer()
            Text(detail)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 20))
                .bold()
                .padding()
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(15)
    }
}

#Preview {
    ContentView()
}
