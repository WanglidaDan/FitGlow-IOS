import SwiftUI

struct WeightView: View {
    @State private var records: [WeightRecord] = [
        WeightRecord(weight: 73.1, recordedAt: .now.addingTimeInterval(-6 * 24 * 3600)),
        WeightRecord(weight: 72.9, recordedAt: .now.addingTimeInterval(-5 * 24 * 3600)),
        WeightRecord(weight: 72.8, recordedAt: .now.addingTimeInterval(-4 * 24 * 3600)),
        WeightRecord(weight: 72.6, recordedAt: .now.addingTimeInterval(-3 * 24 * 3600)),
        WeightRecord(weight: 72.7, recordedAt: .now.addingTimeInterval(-2 * 24 * 3600)),
        WeightRecord(weight: 72.5, recordedAt: .now.addingTimeInterval(-1 * 24 * 3600)),
        WeightRecord(weight: 72.4)
    ]

    @State private var newWeightText = "72.4"

    var latestWeight: Double {
        records.sorted { $0.recordedAt > $1.recordedAt }.first?.weight ?? 0
    }

    var body: some View {
        NavigationStack {
            ZStack {
                AppColors.background.ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 24) {
                        header
                        inputCard
                        historyCard
                    }
                    .padding(20)
                }
            }
            .navigationTitle("体重")
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(String(format: "%.1f kg", latestWeight))
                .font(.system(size: 52, weight: .bold, design: .rounded))
                .foregroundStyle(AppColors.primaryText)

            Text("记录趋势，不被单日波动影响。")
                .font(.system(size: 15, weight: .medium))
                .foregroundStyle(AppColors.secondaryText)
        }
    }

    private var inputCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("添加今日体重")
                .font(.system(size: 17, weight: .semibold))
                .foregroundStyle(AppColors.primaryText)

            HStack(spacing: 12) {
                TextField("体重", text: $newWeightText)
                    .keyboardType(.decimalPad)
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundStyle(AppColors.primaryText)

                Text("kg")
                    .foregroundStyle(AppColors.secondaryText)

                Button("记录") {
                    addWeightRecord()
                }
                .font(.system(size: 15, weight: .bold))
                .foregroundStyle(.black)
                .padding(.horizontal, 18)
                .padding(.vertical, 12)
                .background(AppColors.neonGreen)
                .clipShape(RoundedRectangle(cornerRadius: 16))
            }
        }
        .padding(20)
        .background(RoundedRectangle(cornerRadius: 26).fill(AppColors.card))
    }

    private var historyCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("最近记录")
                .font(.system(size: 17, weight: .semibold))
                .foregroundStyle(AppColors.primaryText)

            ForEach(records.sorted { $0.recordedAt > $1.recordedAt }.prefix(7)) { record in
                HStack {
                    Text(record.recordedAt, style: .date)
                        .foregroundStyle(AppColors.secondaryText)

                    Spacer()

                    Text(String(format: "%.1f kg", record.weight))
                        .font(.system(size: 17, weight: .bold, design: .rounded))
                        .foregroundStyle(AppColors.primaryText)
                }
            }
        }
        .padding(20)
        .background(RoundedRectangle(cornerRadius: 26).fill(AppColors.card))
    }

    private func addWeightRecord() {
        guard let weight = Double(newWeightText) else { return }
        records.append(WeightRecord(weight: weight))
    }
}

#Preview {
    WeightView()
}
