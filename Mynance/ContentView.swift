import SwiftUI

struct ContentView: View {
    @EnvironmentObject var account: Account
    @State private var showingAddSheet = false

    var body: some View {
        NavigationView {
            List {
                ForEach(account.transactions) { transaction in
                    VStack(alignment: .leading) {
                        HStack {
                            Text(transaction.category)
                                .font(.headline)
                            Spacer()
                            Text(String(format: "$%.2f", transaction.amount))
                                .foregroundColor(transaction.amount < 0 ? .red : .green)
                        }
                        Text(transaction.description)
                            .font(.subheadline)
                        Text(transaction.date.formatted(date: .abbreviated, time: .omitted))
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("Mynance")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showingAddSheet = true }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddSheet) {
                AddTransactionView()
            }
        }
    }
}
