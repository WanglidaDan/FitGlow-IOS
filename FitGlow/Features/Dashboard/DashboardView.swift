import SwiftUI

struct DashboardView: View {
    var body: some View {
        ZStack {
            AppColors.background.ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 24) {
                    header
                    weightHeroCard
                    metricsGrid
                    assistantInput
                }
                .padding(20)
            }
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("FitGlow")
                .font(.system(size: 34, weight: .bold, design: .rounded))
                .foregroundStyle(AppColors.primaryText)

            Text("今日状态不错，继续保持节奏。")
                .font(.system(size: 15, weight: .medium))
                .foregroundStyle(AppColors.secondaryText)
        }
    }

    private var weightHeroCard: some View {
        VStack(alignment: .leading, spacing: 18) {
            Text("当前体重")
                .font(.system(size: 15, weight: .medium))
                .foregroundStyle(AppColors.secondaryText)

            HStack(alignment: .firstTextBaseline, spacing: 6) {
                Text("72.4")
                    .font(.system(size: 64, weight: .bold, design: .rounded))
                    .foregroundStyle(AppColors.primaryText)

                Text("kg")
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundStyle(AppColors.secondaryText)
            }

            HStack {
                Text("本周 -0.6kg")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundStyle(AppColors.neonGreen)

                Spacer()

                Text("目标 68.0kg")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundStyle(AppColors.secondaryText)
            }

            ProgressView(value: 0.73)
                .tint(AppColors.neonGreen)
        }
        .padding(22)
        .background(
            RoundedRectangle(cornerRadius: 28)
                .fill(AppColors.card)
        )
    }

    private var metricsGrid: some View {
        VStack(spacing: 14) {
            HStack(spacing: 14) {
                metricCard(title: "步数", value: "8,420", unit: "steps")
                metricCard(title: "消耗", value: "438", unit: "kcal")
            }

            HStack(spacing: 14) {
                metricCard(title: "训练", value: "32", unit: "min")
                metricCard(title: "目标", value: "73", unit: "%")
            }
        }
    }

    private func metricCard(title: String, value: String, unit: String) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.system(size: 14, weight: .medium))
                .foregroundStyle(AppColors.secondaryText)

            HStack(alignment: .firstTextBaseline, spacing: 4) {
                Text(value)
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundStyle(AppColors.primaryText)

                Text(unit)
                    .font(.system(size: 13, weight: .medium))
                    .foregroundStyle(AppColors.secondaryText)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(18)
        .background(
            RoundedRectangle(cornerRadius: 22)
                .fill(AppColors.card)
        )
    }

    private var assistantInput: some View {
        HStack(spacing: 12) {
            Text("问问你的健康助手...")
                .font(.system(size: 15, weight: .medium))
                .foregroundStyle(AppColors.secondaryText)

            Spacer()

            Image(systemName: "sparkles")
                .foregroundStyle(AppColors.neonGreen)
        }
        .padding(18)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .stroke(AppColors.neonGreen.opacity(0.35), lineWidth: 1)
                .background(
                    RoundedRectangle(cornerRadius: 24)
                        .fill(AppColors.deepGreen.opacity(0.25))
                )
        )
    }
}

#Preview {
    DashboardView()
}
