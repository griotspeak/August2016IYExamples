//
//  AccountViewController.swift
//  MoneyBook
//
//  Created by TJ Usiyan on 2016/15/10.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

import UIKit
import MoneyBookCore

class AccountViewController: UITableViewController {

    var account: Account! = nil

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let theTransactions = [
            Transaction(title: "Toys", amount: 1000.00),
            Transaction(title: "Boots", amount: 200.00),
            Transaction(title: "Candy", amount: 10.00),
        ]
        account = Account(name: "TJ's Moneys", transactions: theTransactions)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension AccountViewController /* UITableViewDataSource */ {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return account.transactions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell") as! TransactionCell
        let transaction = account.transactions[indexPath.row]
        cell.titleLabel?.text = transaction.title
        cell.amountLabel?.text = transaction.amount.description
        cell.backgroundView?.backgroundColor = (indexPath.row % 2 == 0) ? .lightGray : .white
        return cell
    }
}
