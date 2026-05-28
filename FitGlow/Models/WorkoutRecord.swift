import Foundation

enum WorkoutType: String, Codable, CaseIterable, Identifiable {
    case walking
    case running
    case cycling
    case strength
    case yoga
    case other

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .walking: return "散步"
        case .running: return "跑步"
        case .cycling: return "骑行"
        case .strength: return "力量"
        case .yoga: return "瑜伽"
        case .other: return "其他"
        }
    }
}

struct WorkoutRecord: Identifiable, Codable, Hashable {
    let id: UUID
    var type: WorkoutType
    var durationMinutes: Int
    var activeEnergyKcal: Double
    var recordedAt: Date
    var note: String?

    init(
        id: UUID = UUID(),
        type: WorkoutType,
        durationMinutes: Int,
        activeEnergyKcal: Double,
        recordedAt: Date = Date(),
        note: String? = nil
    ) {
        self.id = id
        self.type = type
        self.durationMinutes = durationMinutes
        self.activeEnergyKcal = activeEnergyKcal
        self.recordedAt = recordedAt
        self.note = note
    }
}
