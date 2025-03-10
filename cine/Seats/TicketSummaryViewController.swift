//
//  TicketSummaryViewController.swift
//  cine
//
//  Created by Angelo on 17/02/25.
//

import UIKit

class TicketSummaryViewController: UIViewController {
    
    private var ticketDraft: TicketDraft
    
    private var ticketTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30)
        label.text = "Confirmar entrada"
        label.textAlignment = .center
        label.backgroundColor = UIColor.white
        label.layer.masksToBounds = true
        return label
    }()
    
    private let ticketDetailStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.distribution = .equalSpacing
        stackview.alignment = .fill
        stackview.spacing = 8
        return stackview
    }()
    
    private var screenNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 25)
        label.text = "Sala: "
        label.textAlignment = .center
        label.backgroundColor = UIColor.white
        label.layer.cornerRadius = 10.0
        label.layer.masksToBounds = true
        return label
    }()
    
    private var movieNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 25)
        label.text = "Pelicula: "
        label.textAlignment = .center
        label.backgroundColor = UIColor.white
        label.layer.cornerRadius = 10.0
        label.layer.masksToBounds = true
        return label
    }()
    
    private var seatNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 25)
        label.text = "Asientos: "
        label.textAlignment = .center
        label.backgroundColor = UIColor.white
        label.layer.cornerRadius = 10.0
        label.layer.masksToBounds = true
        return label
    }()
    
    private var movieShowTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 25)
        label.text = "Hora: "
        label.textAlignment = .center
        label.backgroundColor = UIColor.white
        label.layer.cornerRadius = 10.0
        label.layer.masksToBounds = true
        return label
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Editar", for: .normal)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(handleBackButton), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var confirmButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Confirmar", for: .normal)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(confirmButtonTapped),for: .touchUpInside)
        
        return button
    }()
    
    init(ticketDraft: TicketDraft) {
        self.ticketDraft = ticketDraft
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureView(with: ticketDraft)
        
    }
    
    func configureView(with ticketDraft: TicketDraft) {
        //        ticketTitleLabel.text = "Confirmar entrada"
        screenNumberLabel.text = "Sala: \(ticketDraft.screen)"
        movieNameLabel.text = "Película: \(ticketDraft.movie)"
        seatNumberLabel.text = "Asiento: \(ticketDraft.seatNumber)"
        movieShowTimeLabel.text = "Hora: \(ticketDraft.showTime)"
    }
    
    @objc private func handleBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func confirmButtonTapped() {
        
        let newTicketNumner = TicketManager.shared.generateTicketNumber()
        let newTicket = Ticket(ticketNumber: newTicketNumner, seatNumber: ticketDraft.seatNumber, showTime: ticketDraft.showTime, screen: ticketDraft.screen, movie: ticketDraft.movie)
        TicketManager.shared.addTicket(newTicket)
        //        print("Ticket agregado:", newTicket)
        //        print("Total tickets:", TicketManager.shared.tickets.count)
        let ticketPurchaseVC = TicketPurchaseViewController(ticket: newTicket)
        navigationController?.pushViewController(ticketPurchaseVC, animated: true)
    }
    
}

extension TicketSummaryViewController {
    
    func setupUI() {
        view.backgroundColor = .systemCyan
        setupTicketTitleLabel()
        setupTicketDetailStackView()
        setupBackButton()
        setupConfirmButtom()
    }
    
    func setupTicketTitleLabel(){
        view.addSubview(ticketTitleLabel)
        NSLayoutConstraint.activate([
            ticketTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            ticketTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ticketTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            ticketTitleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0)
        ])
    }
    
    func setupTicketDetailStackView() {
        view.addSubview(ticketDetailStackView)
        ticketDetailStackView.addArrangedSubview(screenNumberLabel)
        ticketDetailStackView.addArrangedSubview(movieNameLabel)
        ticketDetailStackView.addArrangedSubview(seatNumberLabel)
        ticketDetailStackView.addArrangedSubview(movieShowTimeLabel)
        
        NSLayoutConstraint.activate([
            ticketDetailStackView.topAnchor.constraint(equalTo: ticketTitleLabel.bottomAnchor, constant: 10),
            ticketDetailStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ticketDetailStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            //            ticketDetailStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
    }
    
    func setupBackButton() {
        view.addSubview(backButton)
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: ticketDetailStackView.bottomAnchor, constant: 10),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 75),
            //            backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -200),
            
            backButton.widthAnchor.constraint(equalToConstant: 100),
            backButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func setupConfirmButtom() {
        view.addSubview(confirmButton)
        NSLayoutConstraint.activate([
            confirmButton.topAnchor.constraint(equalTo: ticketDetailStackView.bottomAnchor, constant: 10 ),
            confirmButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -75),
            
            confirmButton.widthAnchor.constraint(equalToConstant: 100),
            confirmButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}

struct TicketDraft {
    var movie: String
    var showTime: Int
    var screen: Int
    var seatNumber: String
}
