//
//  MyTicketsCellView.swift
//  cine
//
//  Created by Luis Chavez pozo on 21/01/25.
//

import UIKit

class MyTicketsCellView: UITableViewCell {
    private var ticket: Ticket?
    
    private let ticketNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
     let viewDetailButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("ver detalle", for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with ticket: Ticket) {
        self.ticket = ticket
//        ticketNumberLabel.text = "Ticket: \(ticket.ticketNumber)"
    }
}

extension MyTicketsCellView {
    func setupUI() {
        setupTicketNumberLabel()
        setupviewDetailButton()
    }
    
    func setupTicketNumberLabel() {
        addSubview(ticketNumberLabel)
        NSLayoutConstraint.activate([
            ticketNumberLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            ticketNumberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            ticketNumberLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
        ])
    }
    
    func setupviewDetailButton() {
        addSubview(viewDetailButton)
        NSLayoutConstraint.activate([
            viewDetailButton.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            viewDetailButton.leadingAnchor.constraint(greaterThanOrEqualTo: ticketNumberLabel.trailingAnchor, constant: 8),
            viewDetailButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            viewDetailButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
}




