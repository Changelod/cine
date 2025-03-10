//
//  MyTicketsViewController.swift
//  cine
//
//  Created by Luis Chavez pozo on 20/01/25.
//

import UIKit

class MyTicketsViewController: UIViewController {
    
    private var tickets: [Ticket] {
        return TicketManager.shared.tickets
    }
    
    private var ticketTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30)
        label.text = "My Tickets"
        label.textAlignment = .center
        label.backgroundColor = UIColor.white
        label.layer.masksToBounds = true
        return label
    }()
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        //        print("Tickets en MyTickets:", tickets)
        
    }
    
}

extension MyTicketsViewController {
    
    private func setupUI() {
        view.backgroundColor = .systemCyan
        setupTicketTitleLabel()
        setupTableView()
    }
    
    private func setupTicketTitleLabel() {
        view.addSubview(ticketTitleLabel)
        NSLayoutConstraint.activate([
            ticketTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            ticketTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ticketTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            ticketTitleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        //        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.register(MyTicketsCellView.self, forCellReuseIdentifier: "TicketCell")
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: ticketTitleLabel.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}

extension MyTicketsViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tickets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TicketCell", for: indexPath) as? MyTicketsCellView else {
            return UITableViewCell()
        }
        let ticket = tickets[indexPath.row]
        cell.configure(with: ticket)
        cell.textLabel?.text = "Ticket #\(ticket.ticketNumber) - \(ticket.movie)"
        return cell
    }
    
}

extension MyTicketsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ticket = tickets[indexPath.row]
        let vc = MyTicketsDetailViewController(ticket: ticket)
        navigationController?.pushViewController(vc, animated: true)
    }
}





