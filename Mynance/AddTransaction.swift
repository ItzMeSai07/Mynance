import SwiftUI

struct AddTransactionView: View {
    @EnvironmentObject var account: Account
    @Environment(\.dismiss) var dismiss

    @State private var amount = ""
    @State private var category = "Other"
    @State private var description = ""
    @State private var date = Date()

    let categories = ["Food", "Rent", "Salary", "Transport", "Entertainment", "Other"]

    var body: some View {
        NavigationView {
            Form {
                TextField("Amount", text: $amount)
                    .keyboardType(.decimalPad)

                Picker("Category", selection: $category) {
                    ForEach(categories, id: \.self) { cat in
                        Text(cat)
                    }
                }

                TextField("Description", text: $description)

                DatePicker("Date", selection: $date, displayedComponents: .date)
            }
            .navigationTitle("New Transaction")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        if let amt = Double(amount) {
                            let newTx = Transaction(amount: amt, category: category, description: description, date: date)
                            account.addTransaction(newTx)
                            dismiss()
                        }
                    }
                }

                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}
