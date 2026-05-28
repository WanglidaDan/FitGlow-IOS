import Foundation

final class DashboardViewModel: ObservableObject {
    @Published var currentWeight: Double = 72.4
    @Published var targetWeight: Double = 68.0
    @Published var weeklyWeightChange: Double = -0.6
    @Published var todaySteps: Int = 8420
    @Published var activeEnergyKcal: Int = 438
    @Published var workoutMinutes: Int = 32

    var targetProgress: Double {
        0.73
    }

    var weightDisplay: String {
        String(format: "%.1f", currentWeight)
    }

    var targetWeightDisplay: String {
        String(format: "%.1f", targetWeight)
    }

    var weeklyChangeDisplay: String {
        let prefix = weeklyWeightChange <= 0 ? "" : "+"
        return "本周 \(prefix)\(String(format: "%.1f", weeklyWeightChange))kg"
    }

    var stepsDisplay: String {
        todaySteps.formatted()
    }
}
