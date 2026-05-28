import SwiftUI

struct WorkoutView: View {
    private let workouts: [WorkoutRecord] = [
        WorkoutRecord(type: .running, durationMinutes: 32, activeEnergyKcal: 438),
        WorkoutRecord(type: .walking, durationMinutes: 46, activeEnergyKcal: 180, recordedAt: .now.addingTimeInterval(-24 * 3600)),
        WorkoutRecord(type: .strength, durationMinutes: 40, activeEnergyKcal: 260, recordedAt: .now.addingTimeInterval(-2 * 24 * 3600))
    ]

    var body: some View {
        NavigationStack {
            ZStack {
                AppColors.background.ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 24) {
                        header
                        summaryCard
                        workoutList
                    }
                    .padding(20)
                }
            }
            .navigationTitle("运动")
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("今日运动")
                .font(.system(size: 34, weight: .bold, design: .rounded))
                .foregroundStyle(AppColors.primaryText)

            Text("轻量记录，稳定行动。")
                .font(.system(size: 15, weight: .medium))
                .foregroundStyle(AppColors.secondaryText)
        }
    }

    private var summaryCard: some View {
        VStack(alignment: .leading, spacing: 18) {
            Text("运动消耗")
                .font(.system(size: 15, weight: .medium))
                .foregroundStyle(AppColors.secondaryText)

            HStack(alignment: .firstTextBaseline, spacing: 6) {
                Text("438")
                    .font(.system(size: 60, weight: .bold, design: .rounded))
                    .foregroundStyle(AppColors.primaryText)

                Text("kcal")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(AppColors.secondaryText)
            }

            Text("今天完成 32 分钟跑步，节奏很好。")
                .font(.system(size: 15, weight: .medium))
                .foregroundStyle(AppColors.neonGreen)
        }
        .padding(22)
        .background(RoundedRectangle(cornerRadius: 28).fill(AppColors.card))
    }

    private var workoutList: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("最近训练")
                .font(.system(size: 17, weight: .semibold))
                .foregroundStyle(AppColors.primaryText)

            ForEach(workouts) { workout in
                HStack(spacing: 14) {
                    Image(systemName: iconName(for: workout.type))
                        .foregroundStyle(AppColors.neonGreen)
                        .frame(width: 34, height: 34)
                        .background(AppColors.deepGreen.opacity(0.45))
                        .clipShape(RoundedRectangle(cornerRadius: 12))

                    VStack(alignment: .leading, spacing: 4) {
                        Text(workout.type.displayName)
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundStyle(AppColors.primaryText)

                        Text("\(workout.durationMinutes) 分钟 · \(Int(workout.activeEnergyKcal)) kcal")
                            .font(.system(size: 13, weight: .medium))
                            .foregroundStyle(AppColors.secondaryText)
                    }

                    Spacer()
                }
                .padding(16)
                .background(RoundedRectangle(cornerRadius: 22).fill(AppColors.card))
            }
        }
    }

    private func iconName(for type: WorkoutType) -> String {
        switch type {
        case .walking: return "figure.walk"
        case .running: return "figure.run"
        case .cycling: return "bicycle"
        case .strength: return "dumbbell"
        case .yoga: return "figure.mind.and.body"
        case .other: return "circle.grid.2x2"
        }
    }
}

#Preview {
    WorkoutView()
}
