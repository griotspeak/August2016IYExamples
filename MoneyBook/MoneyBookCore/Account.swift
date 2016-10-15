//
//  Account.swift
//  MoneyBook
//
//  Created by TJ Usiyan on 2016/15/10.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

import Foundation

public class Account {
    public var name: String
    public var transactions: [Transaction]

    public init(name: String, transactions: [Transaction]) {
        self.name = name
        self.transactions = transactions
    }
}
