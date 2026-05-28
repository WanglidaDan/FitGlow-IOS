import Foundation

final class HealthAssistantService {
    func generateReply(for input: String) async -> String {
        let trimmedInput = input.trimmingCharacters(in: .whitespacesAndNewlines)

        guard trimmedInput.isEmpty == false else {
            return "你可以告诉我今天的饮食、运动或体重变化，我会帮你做一个轻量分析。"
        }

        return "我先根据你描述的情况做一个轻量分析：今天的重点是保持稳定节奏，不需要因为单日波动焦虑。建议你继续记录体重、运动和饮食，观察 7 天趋势。如果今天运动完成不错，可以适当补充蛋白质和水分，晚间避免高盐高油。"
    }
}
