import Foundation

class Account: ObservableObject {
    @Published var transactions: [Transaction] = []

    var balance: Double {
        transactions.reduce(0) { $0 + $1.amount }
    }

    init() {
        load()
    }

    func addTransaction(_ transaction: Transaction) {
        transactions.append(transaction)
        save()
    }

    func save() {
        if let encoded = try? JSONEncoder().encode(transactions) {
            UserDefaults.standard.set(encoded, forKey: "SavedTransactions")
        }
    }

    func load() {
        if let saved = UserDefaults.standard.data(forKey: "SavedTransactions") {
            if let decoded = try? JSONDecoder().decode([Transaction].self, from: saved) {
                transactions = decoded
            }
        }
    }
}

