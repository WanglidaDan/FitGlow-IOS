import Foundation

enum HealthGoalType: String, Codable, CaseIterable, Identifiable {
    case fatLoss
    case muscleGain
    case maintain

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .fatLoss: return "减脂"
        case .muscleGain: return "增肌"
        case .maintain: return "保持"
        }
    }
}

struct HealthGoal: Identifiable, Codable, Hashable {
    let id: UUID
    var type: HealthGoalType
    var currentWeight: Double
    var targetWeight: Double
    var startDate: Date
    var targetDate: Date

    init(
        id: UUID = UUID(),
        type: HealthGoalType,
        currentWeight: Double,
        targetWeight: Double,
        startDate: Date = Date(),
        targetDate: Date
    ) {
        self.id = id
        self.type = type
        self.currentWeight = currentWeight
        self.targetWeight = targetWeight
        self.startDate = startDate
        self.targetDate = targetDate
    }
}
