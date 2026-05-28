# FitGlow-IOS

FitGlow 是一款基于 Apple SwiftUI 的高级简约体重管理与运动健康 App。

产品目标是用极少操作完成体重、运动、目标和健康状态记录，并通过清晰的数据可视化与 AI 健康助手帮助用户长期坚持。

## 产品定位

> 高级简约的 AI 体重管理与运动健康 App。

FitGlow 不追求复杂健身社区，也不做重度医疗诊断。它聚焦三件事：

1. 看清身体变化趋势。
2. 养成稳定运动和记录习惯。
3. 用 AI 帮用户理解数据，而不是堆满复杂图表。

## 视觉方向

整体风格：黑色背景、高级白字、荧光绿数据、橘色提醒、圆角卡片、大留白、极简动效。

主色：

- Background Black: `#050607`
- Card Black: `#121417`
- Primary White: `#F7F8F5`
- Neon Green: `#B6FF3B`
- Deep Green: `#173F2A`
- Energy Orange: `#FF7A1A`

## 第一版 MVP

第一版只做最核心的闭环：

- 启动页
- 目标设置页
- 首页 Dashboard
- 体重记录页
- 运动数据页
- AI 健康助手页

后续版本再加入：

- Apple HealthKit 同步
- Apple Watch 数据
- 饮食记录
- 周报/月报
- 个性化训练计划
- 体脂率、BMI、基础代谢分析

## 建议技术栈

- SwiftUI
- SwiftData 或 CoreData
- Charts
- HealthKit
- Combine / Observation
- 本地状态管理 + 后续 AI Service

## 目录规划

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
│   │   ├── WeightView.swift
│   │   ├── WeightEntryView.swift
│   │   └── WeightChartView.swift
│   ├── Workout/
│   │   ├── WorkoutView.swift
│   │   └── WorkoutCardView.swift
│   ├── Goals/
│   │   └── GoalSetupView.swift
│   └── Assistant/
│       ├── AssistantView.swift
│       └── AssistantMessage.swift
└── Models/
    ├── WeightRecord.swift
    ├── WorkoutRecord.swift
    └── HealthGoal.swift
```

## 当前状态

当前仓库处于产品初始化阶段，已经建立产品方向、设计系统、SwiftUI 页面骨架和数据模型草案。
