//
//  Transaction.swift
//  MoneyBook
//
//  Created by TJ Usiyan on 2016/15/10.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

import Foundation

public class Transaction {
    public var title: String
    public var amount: NSDecimalNumber

    public init(title: String, amount: NSDecimalNumber = 0) {
        self.title = title
        self.amount = amount
    }
}
