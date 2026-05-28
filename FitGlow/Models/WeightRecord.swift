import Foundation

struct WeightRecord: Identifiable, Codable, Hashable {
    let id: UUID
    var weight: Double
    var recordedAt: Date
    var note: String?

    init(
        id: UUID = UUID(),
        weight: Double,
        recordedAt: Date = Date(),
        note: String? = nil
    ) {
        self.id = id
        self.weight = weight
        self.recordedAt = recordedAt
        self.note = note
    }
}
