import SwiftUI

@main
struct BleuProjectApp: App {
    @StateObject var myEvents = EventStore(preview: true) //add
    var viuATelaInicial: Bool = UserDefaults.standard.bool(forKey: "viuATelaInicial")
    
    var body: some Scene {
        WindowGroup {
            
           //StartTabView() //add
           // .environmentObject(myEvents) //add
            
            if !viuATelaInicial {
                NavigationStack {
                    inicial()
                        .onAppear { UserDefaults.standard.set(true, forKey: "viuATelaInicial") }
                }
                .accentColor(Color(red: 0, green: 17/255, blue: 77/255))
                .environmentObject(myEvents) //add
            } else {
                NavigationStack {
                    FloresView()
                }
                .accentColor(Color(red: 0, green: 17/255, blue: 77/255))
                .environmentObject(myEvents) //add
            }
        }
    }
}

