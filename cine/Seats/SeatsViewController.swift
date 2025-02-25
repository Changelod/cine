//
//  SeatsViewController.swift
//  cine
//
//  Created by Angelo on 6/02/25.
//
//

import UIKit

class SeatsViewController: UIViewController {
    
    // MARK: - Propiedades
    private var movie: Movie
    private var showtime: ShowTime
    private var selectedSeat: Seat?
    
    // MARK: - Componentes UI
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private let contentStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let screenLabel: UILabel = {
        let label = UILabel()
        label.text = "PANTALLA"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        return label
    }()
    
    private let buyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Comprar (0)", for: .normal)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Inicialización
    init(movie: Movie, showtime: ShowTime) {
        self.movie = movie
        self.showtime = showtime
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Ciclo de Vida
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        createSeatRows()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Reiniciar el estado de cada asiento
        showtime.seats.forEach { $0.isSelected = false }
        updateSelectedCount()
        
        // Actualizar la UI para reflejar el reinicio
        for case let rowStack as UIStackView in contentStack.arrangedSubviews {
            for case let button as UIButton in rowStack.arrangedSubviews {
                if let seatId = button.title(for: .normal),
                   let seat = showtime.seats.first(where: { $0.id == seatId }) {
                    button.backgroundColor = seatColor(for: seat)
                }
            }
        }
    }
    
    // MARK: - Métodos Auxiliares
    private func createSeatButton(for seat: Seat) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(seat.id, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.backgroundColor = seatColor(for: seat)
        button.layer.cornerRadius = 8
        button.tintColor = .white
        button.isEnabled = seat.isAvailable
        
        button.addTarget(self, action: #selector(seatTapped(_:)), for: .touchUpInside)
        return button
    }
    
    private func seatColor(for seat: Seat) -> UIColor {
        if !seat.isAvailable {
            return .systemRed
        }
        return seat.isSelected ? .systemBlue : .systemGreen
    }
    
    @objc private func seatTapped(_ sender: UIButton) {
        guard let seatId = sender.title(for: .normal),
              let index = showtime.seats.firstIndex(where: { $0.id == seatId }),
              showtime.seats[index].isAvailable else { return }
        
        // Deseleccionar asiento previo
        if let previousSeat = showtime.seats.first(where: { $0.isSelected }) {
            previousSeat.isSelected = false
            updateButtonAppearance(for: previousSeat.id)
        }
        
        // Seleccionar/deseleccionar
        showtime.seats[index].isSelected.toggle()
        updateButtonAppearance(for: seatId)
        
        // Actualizar asiento seleccionado
        selectedSeat = showtime.seats[index].isSelected ? showtime.seats[index] : nil
        updateSelectedCount()
    }
    
    private func updateButtonAppearance(for seatId: String) {
        for case let rowStack as UIStackView in contentStack.arrangedSubviews {
            for case let button as UIButton in rowStack.arrangedSubviews {
                if button.title(for: .normal) == seatId,
                   let seat = showtime.seats.first(where: { $0.id == seatId }) {
                    button.backgroundColor = seatColor(for: seat)
                }
            }
        }
    }
    
    private func updateSelectedCount() {
        let count = showtime.seats.filter { $0.isSelected }.count
        buyButton.setTitle("Seleccionar (\(count))", for: .normal)
    }
    
    @objc private func buyButtonTapped() {
        guard let selectedSeat = selectedSeat else {
            let alert = UIAlertController(title: "Error", message: "Por favorzazo, selecciona un asiento", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        
        // Crear el TicketDraft con todos los datos
        let ticketDraft = TicketDraft(
            movie: movie.movieName,
            showTime: Int(showtime.time) ?? 0,
            screen: Int(showtime.screen) ?? 0,
            seatNumber: selectedSeat.id
        )
        
        // Pasar el draft a la siguiente vista
        let ticketSummaryVC = TicketSummaryViewController(ticketDraft: ticketDraft)
        
        navigationController?.pushViewController(ticketSummaryVC, animated: true)
        
    }
    
    func handleSeatSelection(_ seat: Seat) {
        self.selectedSeat = seat
        createTicketDraft()
    }
    
    private func createTicketDraft() {
        guard let selectedSeat = selectedSeat else { return }
        
        let ticketDraft = Ticket(ticketNumber: 0, seatNumber: selectedSeat.id, showTime: Int(showtime.time) ?? 0, screen: Int(showtime.screen) ?? 0, movie: movie.movieName)
        
        print("Ticket creado: \(ticketDraft)")
    }
    
}

// MARK: - Configuración de la UI
extension SeatsViewController {
    
    private func setupUI() {
        view.backgroundColor = .white
//        title = "Selecciona Asiento " // \(showtime.screen) 
        
        // Configurar cada componente de la UI
        setupBuyButton()
        setupScrollView()
        setupContentStack()
        setupScreenLabel()
    }
    
    private func setupBuyButton() {
        view.addSubview(buyButton)
        NSLayoutConstraint.activate([
            buyButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            buyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            buyButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        buyButton.addTarget(self, action: #selector(buyButtonTapped), for: .touchUpInside)
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            scrollView.bottomAnchor.constraint(equalTo: buyButton.topAnchor, constant: -20)
        ])
    }
    
    private func setupContentStack() {
        scrollView.addSubview(contentStack)
        NSLayoutConstraint.activate([
            contentStack.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentStack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentStack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentStack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentStack.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    private func setupScreenLabel() {
        contentStack.addArrangedSubview(screenLabel)
    }
    
    private func createSeatRows() {
        var currentRowStack: UIStackView?
        
        for (index, seat) in showtime.seats.enumerated() {
            if index % 5 == 0 { // Nueva fila cada 5 asientos
                currentRowStack = UIStackView()
                currentRowStack?.axis = .horizontal
                currentRowStack?.spacing = 10
                currentRowStack?.distribution = .fillEqually
                contentStack.addArrangedSubview(currentRowStack!)
            }
            let seatButton = createSeatButton(for: seat)
            currentRowStack?.addArrangedSubview(seatButton)
        }
    }
}

class Seat {
    let id: String
    var isAvailable: Bool
    var isSelected: Bool
    
    init(id: String, isAvailable: Bool) {
        self.id = id
        self.isAvailable = isAvailable
        self.isSelected = false
    }
}
