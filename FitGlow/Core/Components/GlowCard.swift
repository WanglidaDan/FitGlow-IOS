import SwiftUI

struct GlowCard<Content: View>: View {
    private let cornerRadius: CGFloat
    private let padding: CGFloat
    private let content: Content

    init(
        cornerRadius: CGFloat = 26,
        padding: CGFloat = 20,
        @ViewBuilder content: () -> Content
    ) {
        self.cornerRadius = cornerRadius
        self.padding = padding
        self.content = content()
    }

    var body: some View {
        content
            .padding(padding)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(AppColors.card)
            )
    }
}

#Preview {
    ZStack {
        AppColors.background.ignoresSafeArea()
        GlowCard {
            Text("FitGlow Card")
                .foregroundStyle(AppColors.primaryText)
        }
        .padding()
    }
}
