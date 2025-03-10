//
//  Tickets.swift
//  cine
//
//  Created by Angelo on 20/02/25.
//

struct Ticket: Codable{
    let ticketNumber: Int
    let seatNumber : String
    let showTime: Int
    let screen: Int
    let movie: String
    
    init(ticketNumber: Int, seatNumber: String, showTime: Int, screen: Int, movie: String) {
        self.ticketNumber = ticketNumber
        self.seatNumber = seatNumber
        self.showTime = showTime
        self.screen = screen
        self.movie = movie
    }
}


