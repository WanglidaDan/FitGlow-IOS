import SwiftUI

struct DashboardView: View {
    @StateObject private var viewModel = DashboardViewModel()
    @State private var showGoalSetup = false

    var body: some View {
        NavigationStack {
            ZStack {
                AppColors.background.ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: AppSpacing.section) {
                        header
                        weightHeroCard
                        metricsGrid
                        assistantInput
                    }
                    .padding(AppSpacing.page)
                }
            }
            .toolbar(.hidden, for: .navigationBar)
            .sheet(isPresented: $showGoalSetup) {
                GoalSetupView()
            }
        }
    }

    private var header: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 6) {
                Text("FitGlow")
                    .font(AppFonts.largeTitle)
                    .foregroundStyle(AppColors.primaryText)

                Text("今日状态不错，继续保持节奏。")
                    .font(AppFonts.body)
                    .foregroundStyle(AppColors.secondaryText)
            }

            Spacer()

            Button {
                showGoalSetup = true
            } label: {
                Image(systemName: "target")
                    .font(.system(size: 17, weight: .bold))
                    .foregroundStyle(.black)
                    .frame(width: 42, height: 42)
                    .background(AppColors.neonGreen)
                    .clipShape(Circle())
            }
            .accessibilityLabel("设置目标")
        }
    }

    private var weightHeroCard: some View {
        VStack(alignment: .leading, spacing: 18) {
            HStack {
                Text("当前体重")
                    .font(AppFonts.body)
                    .foregroundStyle(AppColors.secondaryText)

                Spacer()

                Text("目标进度 \(Int(viewModel.targetProgress * 100))%")
                    .font(AppFonts.caption)
                    .foregroundStyle(AppColors.neonGreen)
            }

            HStack(alignment: .firstTextBaseline, spacing: 6) {
                Text(viewModel.weightDisplay)
                    .font(AppFonts.heroNumber)
                    .foregroundStyle(AppColors.primaryText)
                    .contentTransition(.numericText())

                Text("kg")
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundStyle(AppColors.secondaryText)
            }

            HStack {
                Text(viewModel.weeklyChangeDisplay)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundStyle(viewModel.weeklyWeightChange <= 0 ? AppColors.neonGreen : AppColors.orange)

                Spacer()

                Text("目标 \(viewModel.targetWeightDisplay)kg")
                    .font(AppFonts.body)
                    .foregroundStyle(AppColors.secondaryText)
            }

            ProgressView(value: viewModel.targetProgress)
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
                metricCard(title: "步数", value: viewModel.stepsDisplay, unit: "steps")
                metricCard(title: "消耗", value: "\(viewModel.activeEnergyKcal)", unit: "kcal")
            }

            HStack(spacing: 14) {
                metricCard(title: "训练", value: "\(viewModel.workoutMinutes)", unit: "min")
                metricCard(title: "目标", value: "\(Int(viewModel.targetProgress * 100))", unit: "%")
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
                    .contentTransition(.numericText())

                Text(unit)
                    .font(AppFonts.caption)
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
            VStack(alignment: .leading, spacing: 4) {
                Text("AI 健康助手")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(AppColors.primaryText)

                Text("描述饮食、运动或体重变化，获得轻量分析。")
                    .font(AppFonts.caption)
                    .foregroundStyle(AppColors.secondaryText)
            }

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
