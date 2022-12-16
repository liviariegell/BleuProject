import SwiftUI

struct DaysEventsListView: View {
    @EnvironmentObject var eventStore: EventStore
    @Binding var dateSelected: DateComponents?
    @State private var formType: EventFormType?
    
    var body: some View {
        NavigationStack {
            ZStack{
                Color(red: 197/255, green: 214/255, blue: 255/255).ignoresSafeArea()
                Group {
                    if let dateSelected {
                        let foundEvents = eventStore.events
                            .filter {$0.date.startOfDay == dateSelected.date!.startOfDay}
                        List {
                            ForEach(foundEvents) { event in
                                ListViewRow(event: event, formType: $formType)
                                    .swipeActions {
                                        Button(role: .destructive) {
                                            eventStore.delete(event)
                                        } label: {
                                            Image(systemName: "trash")
                                        }
                                    }
                                    .sheet(item: $formType) { $0 }
                            }
                        }
                        .scrollContentBackground(.hidden)
                    }
                }
            }
            .toolbarBackground(
                Color(red: 197/255, green: 214/255, blue: 255/255),
                for: .navigationBar
            )
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationTitle(dateSelected?.date?.formatted(date: .long, time: .omitted) ?? "")
        }
    }
}

struct DaysEventsListView_Previews: PreviewProvider {
    static var dateComponents: DateComponents {
        var dateComponents = Calendar.current.dateComponents(
            [.month,
             .day,
             .year,
             .hour,
             .minute],
            from: Date())
        dateComponents.timeZone = TimeZone.current
        dateComponents.calendar = Calendar(identifier: .gregorian)
        return dateComponents
    }
    static var previews: some View {
        DaysEventsListView(dateSelected: .constant(dateComponents))
            .environmentObject(EventStore(preview: true)
            )
    }
}
