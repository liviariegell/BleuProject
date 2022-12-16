import Foundation

class EventFormViewModel: ObservableObject {
    @Published var date = Date()
    @Published var note = ""
    @Published var text = ""
    @Published var eventType: Event.EventType = .feliz
    
    var id: String?
    var updating: Bool { id != nil }
    
    init() {}
    
    init(_ event: Event) {
        date = event.date
        note = event.note
        text = event.text
//        eventType = event.eventType
        id = event.id
    }
    
    var incomplete: Bool {
        note.isEmpty
    }
}
