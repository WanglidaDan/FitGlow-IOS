import SwiftUI

struct MetricCard: View {
    let title: String
    let value: String
    let unit: String
    var accent: Color = AppColors.primaryText

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.system(size: 14, weight: .medium))
                .foregroundStyle(AppColors.secondaryText)

            HStack(alignment: .firstTextBaseline, spacing: 4) {
                Text(value)
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundStyle(accent)
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
}

#Preview {
    ZStack {
        AppColors.background.ignoresSafeArea()
        MetricCard(title: "步数", value: "8,420", unit: "steps", accent: AppColors.neonGreen)
            .padding()
    }
}
