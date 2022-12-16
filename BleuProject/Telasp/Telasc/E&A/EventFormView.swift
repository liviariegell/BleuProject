import SwiftUI
import PhotosUI

struct EventFormView: View {
    @EnvironmentObject var eventStore: EventStore
    @StateObject var viewModel: EventFormViewModel
    @Environment(\.dismiss) var dismiss
    @FocusState private var focus: Bool?
    @State var selectedItem: [PhotosPickerItem] = []
    @State var data: Data?
    
    var body: some View {
        ZStack {
            Image("flores1")
            RoundedRectangle(cornerRadius: 70)
                .frame(width: 330, height: 630)
                .foregroundColor(Color(red: 197/255, green: 214/255, blue: 255/255))
            VStack{
                DatePicker(selection: $viewModel.date) {
                    Text("Date and Time")
                }
                .background(Color(red: 197/255, green: 214/255, blue: 255/255))
                .cornerRadius(70)
                .position(x: 99, y:-200)
                TextField("         Title", text: $viewModel.note, axis: .vertical)
                    .focused($focus, equals: true)
                    .foregroundColor(Color(red: 0/255, green: 17/255, blue: 77/255))
                    .font(.custom("IBMPlexMono-Regular", size: 15))
                    .multilineTextAlignment(.center)
                    .position(x: 100, y: -150)
                
                Picker("Event Type", selection: $viewModel.eventType) {
                    ForEach(Event.EventType.allCases) { eventType in
                        HStack{
                            Text(eventType.iconName)
                            eventType.icon
                        }
                        .tag(eventType)
                        .foregroundColor(Color(red: 0/255, green: 17/255, blue: 77/255))
                    }
                }.position(x: 90, y: -250)
                
                TextEditor(text: $viewModel.text)
                    .scrollContentBackground(.hidden)
                    .foregroundColor(Color(red: 0/255, green: 17/255, blue: 77/255))
                    .font(.custom("IBMPlexMono-Regular", size: 15))
                    .frame(width: 300, height: 120)
                    .focused($focus, equals: true)
                    .position(x: 100, y: -44)
                Section(footer:
                            HStack {
                    Spacer()
                    Button {
                        if viewModel.updating {
                            let event = Event(id: viewModel.id!,
                                              eventType: viewModel.eventType,
                                              date: viewModel.date,
                                              note: viewModel.note,
                                              text: viewModel.text)
                            eventStore.update(event)
                            
                        } else {
                            let newEvent = Event(eventType: viewModel.eventType,
                                                 date: viewModel.date,
                                                 note: viewModel.note,
                                                 text: viewModel.text)
                            eventStore.add(newEvent)
                        }
                        dismiss()
                    } label: {
                        Text(viewModel.updating ? "Mudar Flor" : "Plantar Flor")
                    }
                    .font(.custom("IBMPlexMono-Regular", size: 15))
                    .foregroundColor(Color(red: 0/255, green: 17/255, blue: 77/255))
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.capsule)
                    .tint(Color(red: 197/255, green: 214/255, blue: 255/255))
                    .position(x: 90, y: 260)
                    .disabled(viewModel.incomplete)
                    Spacer()
                }
                ){
                    EmptyView()
                }
            }.frame(width: 200, height: 300)
            Color.clear
                .overlay(alignment: .topTrailing){
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "x.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25)
                            .padding(.horizontal, 350)
                            .foregroundColor(Color(red: 197/255, green: 214/255, blue: 255/255))
                    }
                }.padding(.vertical, 85)
           //Image("Image").resizable().frame(width: 160, height: 110).position(x: 210, y: 290)
            
            if let data = data, let uiimage = UIImage(data:data) {
                Image(uiImage: uiimage)
                    .resizable()
                    .frame(width: 240, height: 140)
                    .position(x: 210, y: 310)
                    .border(.blue, width: 5)
            } else {
                Image("LindoImage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 200)
                    .position(x: 210, y: 295)
            }
        
            Button {
                print("Upload button was tapped")
            } label: {
                PhotosPicker(
                    selection: $selectedItem,
                    maxSelectionCount: 1,
                    matching: .images
                ) {
                    Image(systemName: "photo.on.rectangle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 90, height: 30)
                        .foregroundColor(Color(red: 0/255, green: 17/255, blue: 77/255))
                }
            }
            .position(x: UIScreen.main.bounds.width * 0.8, y: 720)
                .onChange(of: selectedItem) { newValue in
                    guard let item = selectedItem.first else{
                        return
                    }
                    item.loadTransferable(type: Data.self) { result in
                        switch result {
                        case .success(let data):
                            if let data = data {
                                self.data = data
                            } else {
                                print("Data is nill")
                            }
                        case .failure(let failure):
                            fatalError("\(failure)")
                        }
                    }
                }
        }
    }
}

struct EventFormView_Previews: PreviewProvider {
    static var previews: some View {
        EventFormView(viewModel: EventFormViewModel())
            .environmentObject(EventStore())
    }
}

