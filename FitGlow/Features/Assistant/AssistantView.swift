import SwiftUI

struct AssistantView: View {
    @State private var inputText = ""
    @State private var messages: [AssistantMessage] = [
        AssistantMessage(role: .assistant, content: "你好，我是 FitGlow 健康助手。你可以告诉我今天吃了什么、做了什么运动，或者体重有什么变化。")
    ]

    private let assistantService = HealthAssistantService()

    var body: some View {
        NavigationStack {
            ZStack {
                AppColors.background.ignoresSafeArea()

                VStack(spacing: 0) {
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 14) {
                            ForEach(messages) { message in
                                messageBubble(message)
                            }
                        }
                        .padding(20)
                    }

                    inputBar
                }
            }
            .navigationTitle("AI 助手")
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }

    private func messageBubble(_ message: AssistantMessage) -> some View {
        HStack {
            if message.role == .user {
                Spacer(minLength: 40)
            }

            Text(message.content)
                .font(.system(size: 15, weight: .medium))
                .foregroundStyle(message.role == .user ? .black : AppColors.primaryText)
                .lineSpacing(4)
                .padding(16)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(message.role == .user ? AppColors.neonGreen : AppColors.card)
                )

            if message.role == .assistant {
                Spacer(minLength: 40)
            }
        }
    }

    private var inputBar: some View {
        HStack(spacing: 12) {
            TextField("描述今天的饮食、运动或体重变化", text: $inputText, axis: .vertical)
                .lineLimit(1...4)
                .font(.system(size: 15, weight: .medium))
                .foregroundStyle(AppColors.primaryText)
                .padding(14)
                .background(RoundedRectangle(cornerRadius: 20).fill(AppColors.card))

            Button {
                sendMessage()
            } label: {
                Image(systemName: "arrow.up")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(.black)
                    .frame(width: 44, height: 44)
                    .background(AppColors.neonGreen)
                    .clipShape(Circle())
            }
            .disabled(inputText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
        }
        .padding(16)
        .background(AppColors.background)
    }

    private func sendMessage() {
        let text = inputText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard text.isEmpty == false else { return }

        messages.append(AssistantMessage(role: .user, content: text))
        inputText = ""

        Task {
            let reply = await assistantService.generateReply(for: text)
            await MainActor.run {
                messages.append(AssistantMessage(role: .assistant, content: reply))
            }
        }
    }
}

#Preview {
    AssistantView()
}
