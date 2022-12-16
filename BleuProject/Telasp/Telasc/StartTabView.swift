import SwiftUI

struct StartTabView: View {
    @EnvironmentObject var myEvents: EventStore
    @State private var formType: EventFormType?
    
    var body: some View {
        TabView{
            EventsListView()
                .tabItem {
                    Label("Lista", systemImage: "list.triangle")
                }
            EventsCalendarView()
                .tabItem {
                    Label("Calendário", systemImage: "calendar")
                    
                }
        }
        .sheet(item: $formType) { $0 }
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
                }
            }
        }
    }
}

struct StartTabView_Previews: PreviewProvider {
    static var previews: some View {
        StartTabView()
            .environmentObject(EventStore(preview: true))
    }
}
