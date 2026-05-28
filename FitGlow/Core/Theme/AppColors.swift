import SwiftUI

enum AppColors {
    static let background = Color(hex: "#050607")
    static let card = Color(hex: "#121417")
    static let primaryText = Color(hex: "#F7F8F5")
    static let secondaryText = Color.white.opacity(0.58)
    static let neonGreen = Color(hex: "#B6FF3B")
    static let deepGreen = Color(hex: "#173F2A")
    static let orange = Color(hex: "#FF7A1A")
}

extension Color {
    init(hex: String) {
        let cleanedHex = hex.replacingOccurrences(of: "#", with: "")
        let scanner = Scanner(string: cleanedHex)
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let red = Double((rgb >> 16) & 0xFF) / 255.0
        let green = Double((rgb >> 8) & 0xFF) / 255.0
        let blue = Double(rgb & 0xFF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }
}
