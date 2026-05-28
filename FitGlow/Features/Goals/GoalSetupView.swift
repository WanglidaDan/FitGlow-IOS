import SwiftUI

struct GoalSetupView: View {
    @State private var goalType: HealthGoalType = .fatLoss
    @State private var currentWeight = "72.4"
    @State private var targetWeight = "68.0"
    @State private var targetDate = Calendar.current.date(byAdding: .month, value: 2, to: .now) ?? .now

    var body: some View {
        NavigationStack {
            ZStack {
                AppColors.background.ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 24) {
                        header
                        goalTypeCard
                        weightInputCard
                        planPreviewCard
                    }
                    .padding(20)
                }
            }
            .navigationTitle("目标")
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("设定目标")
                .font(.system(size: 34, weight: .bold, design: .rounded))
                .foregroundStyle(AppColors.primaryText)

            Text("目标要清晰，但节奏要健康。")
                .font(.system(size: 15, weight: .medium))
                .foregroundStyle(AppColors.secondaryText)
        }
    }

    private var goalTypeCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("目标类型")
                .font(.system(size: 17, weight: .semibold))
                .foregroundStyle(AppColors.primaryText)

            Picker("目标类型", selection: $goalType) {
                ForEach(HealthGoalType.allCases) { type in
                    Text(type.displayName).tag(type)
                }
            }
            .pickerStyle(.segmented)
        }
        .padding(20)
        .background(RoundedRectangle(cornerRadius: 26).fill(AppColors.card))
    }

    private var weightInputCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("体重计划")
                .font(.system(size: 17, weight: .semibold))
                .foregroundStyle(AppColors.primaryText)

            field(title: "当前体重", text: $currentWeight, unit: "kg")
            field(title: "目标体重", text: $targetWeight, unit: "kg")

            DatePicker("目标日期", selection: $targetDate, displayedComponents: .date)
                .foregroundStyle(AppColors.primaryText)
                .tint(AppColors.neonGreen)
        }
        .padding(20)
        .background(RoundedRectangle(cornerRadius: 26).fill(AppColors.card))
    }

    private var planPreviewCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("计划预览")
                .font(.system(size: 17, weight: .semibold))
                .foregroundStyle(AppColors.primaryText)

            Text(planText)
                .font(.system(size: 15, weight: .medium))
                .foregroundStyle(AppColors.secondaryText)
                .lineSpacing(4)

            Button("保存目标") {
                // TODO: Persist goal with SwiftData or UserDefaults.
            }
            .font(.system(size: 16, weight: .bold))
            .foregroundStyle(.black)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 15)
            .background(AppColors.neonGreen)
            .clipShape(RoundedRectangle(cornerRadius: 18))
            .padding(.top, 8)
        }
        .padding(20)
        .background(RoundedRectangle(cornerRadius: 26).fill(AppColors.deepGreen.opacity(0.45)))
    }

    private func field(title: String, text: Binding<String>, unit: String) -> some View {
        HStack {
            Text(title)
                .foregroundStyle(AppColors.secondaryText)

            Spacer()

            TextField(title, text: text)
                .keyboardType(.decimalPad)
                .multilineTextAlignment(.trailing)
                .foregroundStyle(AppColors.primaryText)
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .frame(width: 90)

            Text(unit)
                .foregroundStyle(AppColors.secondaryText)
        }
        .padding(14)
        .background(RoundedRectangle(cornerRadius: 18).fill(AppColors.background.opacity(0.75)))
    }

    private var planText: String {
        guard let current = Double(currentWeight), let target = Double(targetWeight) else {
            return "输入当前体重和目标体重后，FitGlow 会生成阶段计划。"
        }

        let diff = target - current
        let direction = diff < 0 ? "下降" : diff > 0 ? "增加" : "保持"
        return "当前体重 \(String(format: "%.1f", current))kg，目标体重 \(String(format: "%.1f", target))kg。计划方向为\(goalType.displayName)，预计需要\(direction) \(String(format: "%.1f", abs(diff)))kg。"
    }
}

#Preview {
    GoalSetupView()
}
