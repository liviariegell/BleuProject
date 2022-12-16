import SwiftUI

struct EventsCalendarView: View {
    @EnvironmentObject var eventStore: EventStore
    @State private var dateSelected: DateComponents?
    @State private var displayEvents = false
    @State private var formType: EventFormType?
    
    var body: some View {

            ZStack{
                Color(red: 197/255, green: 214/255, blue: 255/255).ignoresSafeArea()
                
                ScrollView {
                    CalendarView(interval: DateInterval(start: .distantPast, end: .distantFuture),
                                 eventStore: eventStore,
                                 dateSelected: $dateSelected,
                                 displayEvents: $displayEvents)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            formType = .new
                        } label: {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 25)
                                .foregroundColor(Color(red: 0/255, green: 17/255, blue: 77/255))
                                .imageScale(.medium)
                            
                        }
                    }
                }
                .sheet(item: $formType) { $0 }
                .sheet(isPresented: $displayEvents) {
                    DaysEventsListView(dateSelected: $dateSelected)
                        .presentationDetents([.medium, .large])
                }
                
        }
    }
    
    struct EventsCalendarView_Previews: PreviewProvider {
        static var previews: some View {
            EventsCalendarView()
                .environmentObject(EventStore(preview: true))
        }
    }
}
