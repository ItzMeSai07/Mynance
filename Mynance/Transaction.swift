import Foundation

struct Transaction: Identifiable, Codable {
    var id: UUID = UUID()
    var amount: Double
    var category: String
    var description: String
    var date: Date
}
