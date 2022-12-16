import SwiftUI

//min do botao 24

struct EventsListView: View {
    @EnvironmentObject var myEvents: EventStore
    @State private var formType: EventFormType?
    
    var body: some View {
        ZStack{
            Color(red: 197/255, green: 214/255, blue: 255/255).ignoresSafeArea()
            
            VStack(spacing: 30){
                ForEach(myEvents.events.sorted {$0.date < $1.date }) { event in
                    ListViewRow(event: event, formType: $formType)
                        .swipeActions {
                            Button(role: .destructive) {
                                myEvents.delete(event)
                            } label: {
                                Image(systemName: "trash")
                            }
                        }
                }
            }
            .frame(width: 300, height: 200)
            .position(x: 200, y: 250)
            .font(.custom("IBMPlexMono-Regular", size: 15))
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
}
struct EventsListView_Previews: PreviewProvider {
    static var previews: some View {
        EventsListView()
            .environmentObject(EventStore(preview: true))
    }
}
