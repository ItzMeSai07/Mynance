import SwiftUI

@main
struct MynanceApp: App {
    @StateObject private var account = Account()

    var body: some Scene {
        WindowGroup {
            ContentView() 
                .environmentObject(account)
        }
    }
}
