import Foundation

final class HealthKitManager: ObservableObject {
    @Published private(set) var isAuthorized = false

    func requestAuthorization() async {
        // TODO: Import HealthKit and request real permissions.
        await MainActor.run {
            self.isAuthorized = true
        }
    }

    func fetchTodaySteps() async -> Int {
        // TODO: Replace mock data with HealthKit step count query.
        8420
    }

    func fetchActiveEnergyKcal() async -> Int {
        // TODO: Replace mock data with HealthKit active energy query.
        438
    }

    func fetchWorkoutMinutes() async -> Int {
        // TODO: Replace mock data with HealthKit workout query.
        32
    }
}
