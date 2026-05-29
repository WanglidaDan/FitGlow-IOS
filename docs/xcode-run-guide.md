# FitGlow Xcode 本地运行指南

当前仓库已经包含 SwiftUI 源码、产品文档和设计系统，但还没有 `.xcodeproj` 工程文件。

最稳妥的本地运行方式是：使用 Xcode 新建一个空 iOS App 工程，然后把仓库里的 Swift 文件加入工程。

## 1. 创建 Xcode 工程

打开 Xcode，选择：

```text
File -> New -> Project -> iOS -> App
```

推荐配置：

| 配置项 | 值 |
|---|---|
| Product Name | FitGlow |
| Team | 选择你的 Apple Developer 账号 |
| Organization Identifier | com.wanglida |
| Interface | SwiftUI |
| Language | Swift |
| Storage | None，后续再接 SwiftData |
| Minimum Deployment | iOS 17 或更高 |

## 2. 替换默认入口

Xcode 会自动生成：

```text
FitGlowApp.swift
ContentView.swift
```

处理方式：

1. 删除默认 `ContentView.swift`。
2. 用仓库里的 `FitGlow/App/FitGlowApp.swift` 替换默认入口。
3. 确保入口显示 `RootView()`。

## 3. 拖入源码目录

将仓库里的以下目录拖入 Xcode 工程：

```text
FitGlow/App
FitGlow/Core
FitGlow/Features
FitGlow/Models
```

拖入时注意：

- 勾选 `Copy items if needed`
- 勾选目标 Target：`FitGlow`
- 选择 `Create groups`

## 4. 首次运行

推荐先用模拟器：

```text
iPhone 16 Pro Simulator
```

点击 Run。

## 5. 常见问题

### 找不到某个 View

例如：

```text
Cannot find 'WeightView' in scope
```

通常是文件没有加入 Target。

处理：

1. 在 Xcode 左侧选中文件。
2. 打开右侧 File Inspector。
3. 勾选 Target Membership 里的 `FitGlow`。

### `@main` 重复

如果出现：

```text
'main' attribute can only apply to one type in a module
```

说明 Xcode 默认生成的 App 入口还在。

处理：

- 保留仓库里的 `FitGlowApp.swift`
- 删除或改名 Xcode 默认生成的 App 入口

### iOS 版本过低

如果 `.contentTransition(.numericText())` 报错，说明部署版本太低。

处理：

- 将 Minimum Deployment 改为 iOS 17 或更高
- 或删除 `.contentTransition(.numericText())`

## 6. 下一步工程化建议

完成本地跑通后，建议继续做：

1. 接入 SwiftData 保存体重记录。
2. 接入 HealthKit 读取步数和运动消耗。
3. 将 AI 助手从本地模拟改成真实模型服务。
4. 增加启动页和品牌图标。
5. 增加 App Store 所需隐私说明。
