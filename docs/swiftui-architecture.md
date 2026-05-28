# FitGlow SwiftUI 架构说明

## 1. 架构目标

FitGlow 的 SwiftUI 架构要满足：

1. 页面结构清晰，便于后续扩展。
2. 视觉主题集中管理，避免颜色和字体到处硬编码。
3. 数据模型简单稳定，先支持本地运行。
4. 后续可以平滑接入 HealthKit、AI 服务和 SwiftData。

## 2. 推荐目录结构

```text
FitGlow/
├── App/
│   └── FitGlowApp.swift
├── Core/
│   ├── Theme/
│   │   ├── AppColors.swift
│   │   ├── AppFonts.swift
│   │   └── AppSpacing.swift
│   ├── HealthKit/
│   │   └── HealthKitManager.swift
│   └── AI/
│       └── HealthAssistantService.swift
├── Features/
│   ├── Dashboard/
│   │   ├── DashboardView.swift
│   │   └── DashboardViewModel.swift
│   ├── Weight/
│   ├── Workout/
│   ├── Goals/
│   └── Assistant/
└── Models/
```

## 3. 分层说明

### App

负责 App 入口、全局路由、依赖注入。

### Core

放跨功能模块复用的基础能力：

- 主题颜色
- 字体规范
- 间距规范
- HealthKit 服务
- AI 服务
- 通用工具

### Features

每个功能独立成模块：

- Dashboard
- Weight
- Workout
- Goals
- Assistant

每个模块建议包含：

- View
- ViewModel
- 子组件

### Models

放稳定的数据结构，例如：

- WeightRecord
- WorkoutRecord
- HealthGoal
- AssistantMessage

## 4. 状态管理建议

第一阶段可以使用：

- `@State`
- `@StateObject`
- `ObservableObject`

如果项目使用 iOS 17 以上，可以逐步迁移到：

- `@Observable`
- SwiftData

## 5. 数据存储建议

第一版：

- 本地 mock 数据
- UserDefaults 存目标设置

第二版：

- SwiftData 存体重、运动、目标、AI 对话

第三版：

- HealthKit 同步步数、训练、能量消耗

## 6. HealthKit 接入边界

HealthKit 应该放在 `Core/HealthKit/HealthKitManager.swift`。

第一阶段只设计接口，不强依赖真实权限：

- requestAuthorization()
- fetchTodaySteps()
- fetchActiveEnergy()
- fetchWorkouts()

这样 UI 可以先跑起来，后续再接真实数据。

## 7. AI 接入边界

AI 服务放在 `Core/AI/HealthAssistantService.swift`。

第一阶段可以返回本地模拟建议：

- 分析体重趋势
- 分析运动完成度
- 根据用户输入生成健康建议

后续再接远程模型或本地模型。

## 8. 开发优先级

1. 建立主题系统。
2. 完成 Dashboard 静态 UI。
3. 完成数据模型。
4. 完成体重记录页。
5. 完成目标设置页。
6. 完成 AI 健康助手页。
7. 接入本地持久化。
8. 接入 HealthKit。
