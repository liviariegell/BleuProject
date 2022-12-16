import Foundation
import SwiftUI

struct Event: Identifiable {
    enum EventType: String, Identifiable, CaseIterable {
        case feliz, triste, raivoso, confuso, apaixonado
        var id: String {
            self.rawValue
        }
        
        var icon: Image {
            switch self {
            case .feliz:
                return Image("s_bleu_felizz")
            case .triste:
                return Image("s_bleu_triste")
            case .raivoso:
                return Image("s_bleu_raivosoo")
            case .confuso:
                return Image("s_bleu_sreacao")
            case .apaixonado:
                return Image("s_bleu_love")
            }
        }
        
        var iconName: String {
            switch self {
//            case .indefinido:
//                return " indiferente"
            case .triste:
                return " triste"
            case .raivoso:
                return " raivoso"
            case .confuso:
                return " confuso"
            case .apaixonado:
                return " apaixonado"
            case .feliz:
                return " feliz"
            }
        }
    }

    var eventType: EventType
    var date: Date
    var note: String
    var text: String
    var id: String
    
    
    var dateComponents: DateComponents {
        var dateComponents = Calendar.current.dateComponents(
            [.month,
             .day,
             .year,
             .hour,
             .minute],
            from: date)
        dateComponents.timeZone = TimeZone.current
        dateComponents.calendar = Calendar(identifier: .gregorian)
        return dateComponents
    }
    
    init(id: String = UUID().uuidString, eventType: EventType = .feliz, date: Date, note: String, text: String) {
        self.eventType = eventType 
        self.date = date
        self.text = text
        self.note = note
        self.id = id
    }
    
    static var sampleEvents: [Event] {
        return [
            Event(eventType: .feliz, date: Date().diff(numDays: 0), note: "Feliz", text: ""),
            Event(eventType: .confuso, date: Date().diff(numDays: 6), note: "Confuso", text: ""),
            Event(eventType: .raivoso, date: Date().diff(numDays: 2), note: "Raivoso", text: ""),
            Event(eventType: .triste, date: Date().diff(numDays: -1), note: "Triste", text: ""),
        ]
    }
}
