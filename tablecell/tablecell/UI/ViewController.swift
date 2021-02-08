//
//  ViewController.swift
//  tablecell
//
//  Created by Larry on 7/2/2021.
//

import UIKit


class ViewController: UIViewController {

    private var sections = [Section]()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: UIScreen.main.bounds, style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tableView.register(SelfSizingTableViewCell.self, forCellReuseIdentifier: SelfSizingTableViewCell.reuseIdentifier)
        
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.keyboardDismissMode = .onDrag
        tableView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.backgroundColor = .white
        sections = [
            Section(title: "Section 1", options: [1,2,3]),
            Section(title: "Section 2", options: [1,2,3,4,5]),
            Section(title: "Section 3", options: [1,2,3,4,5,6,7]),
            Section(title: "Section 4", options: [1,2])
        ]
        
        tableView.delegate = self
        tableView.dataSource = self
                
        NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                     tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
        
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = sections[section]
        
        if section.isOpened {
            return section.options.count + 1
        }
        else {
            return 1
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
                
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
            cell.textLabel?.text = sections[indexPath.section].title
            cell.backgroundColor = .white
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: SelfSizingTableViewCell.reuseIdentifier, for: indexPath) as! SelfSizingTableViewCell
            cell.backgroundColor = .systemYellow
            let count = 4
            let array = sections[indexPath.section].options
            
            //sections[indexPath.section].options[indexPath.row - 1]
            print("count : \(array.count)")
            cell.update(numberOfSquares: array.count )
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true )
        if indexPath.row == 0 {
            sections[indexPath.section].isOpened = !sections[indexPath.section].isOpened
            tableView.reloadSections([indexPath.section], with: .none)
        }
        else {
            print("tapped sub cell")
        }
    }
    
    
}
 
