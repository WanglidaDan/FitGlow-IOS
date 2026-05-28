import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            DashboardView()
                .tabItem {
                    Image(systemName: "house")
                    Text("首页")
                }

            WeightView()
                .tabItem {
                    Image(systemName: "chart.line.uptrend.xyaxis")
                    Text("体重")
                }

            WorkoutView()
                .tabItem {
                    Image(systemName: "figure.walk")
                    Text("运动")
                }

            AssistantView()
                .tabItem {
                    Image(systemName: "message")
                    Text("助手")
                }
        }
        .tint(AppColors.neonGreen)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    RootView()
}
