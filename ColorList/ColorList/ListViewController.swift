//
//  ListViewController.swift
//  ColorList
//
//  Created by TJ Usiyan on 2016/09/09.
//  Copyright © 2016 Buttons and Lights LLC. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    var tableView: UITableView {
        return view as! UITableView
    }


    let colors: [Color] = [
        Color(name: "Red", rawRepresentation: UIColor.red),
        Color(name: "Orange", rawRepresentation: UIColor.orange),
        Color(name: "Yellow", rawRepresentation: UIColor.yellow),
        Color(name: "Green", rawRepresentation: UIColor.green),
        Color(name: "Blue", rawRepresentation: UIColor.blue),
        Color(name: "Purple", rawRepresentation: UIColor.purple),
        Color(name: "Gray", rawRepresentation: UIColor.gray),
    ]
    override func loadView() {
        view = UITableView()
        let tableView = view as! UITableView
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
}

extension ListViewController : UITableViewDataSource {
    @objc(numberOfSectionsInTableView:) func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }

    @objc(tableView:cellForRowAtIndexPath:) func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)

        let color = colors[indexPath.row]
        cell.textLabel?.text = color.name
        cell.contentView.backgroundColor = color.rawRepresentation
        return cell
    }
}

extension ListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let colorVC = ColorViewController()
        colorVC.color = colors[indexPath.row]
        show(colorVC, sender: nil)
    }
}

