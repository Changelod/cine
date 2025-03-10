//
//  TicketaManager.swift
//  cine
//
//  Created by Angelo on 20/02/25.
//

import UIKit

class TicketManager {
    
    static let shared = TicketManager()
    private init() {}
    
    private var ticketCounter: Int = 4
    
    var tickets: [Ticket] = [
        Ticket(ticketNumber: 1, seatNumber: "A2", showTime: 1800, screen: 1, movie: "Existenz"),
        Ticket(ticketNumber: 2, seatNumber: "A5", showTime: 1830, screen: 4, movie: "Existenz"),
        Ticket(ticketNumber: 3, seatNumber: "B3", showTime: 1800, screen: 2, movie: "Crimes of the Future"),
        Ticket(ticketNumber: 4, seatNumber: "C4", showTime: 2000, screen: 4, movie: "Crimes of the Future")
    ]
    
    func generateTicketNumber() -> Int {
        ticketCounter += 1
        return ticketCounter
    }
    
    func addTicket(_ ticket: Ticket) {
        tickets.append(ticket)
        
    }
}
