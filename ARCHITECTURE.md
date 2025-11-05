# 🏗️ 亚马逊运营 Multi-Agent 系统架构

**版本:** v1.0.0
**创建日期:** 2025-11-05
**作者:** CharliephilMrlong

---

## 🎯 系统目标

构建一个**自我进化的亚马逊运营 Multi-Agent 系统**，通过持续学习和知识积累，让 Claude Code 成为最强大的亚马逊运营助手。

**核心能力:**
- 🤖 多个专用 Agents 协同工作
- 📚 可复用的 Skills 技能库
- 🧠 自动化的知识管理和持续学习
- ⚙️ 灵活的配置和工作流
- 🔄 与 GitHub 深度集成

---

## 🏛️ 四层架构

```
┌─────────────────────────────────────────────────────────────┐
│                    🎯 应用层 (You)                           │
│              通过指令调用 Agents 完成任务                      │
└─────────────────────────────────────────────────────────────┘
                            ↓
┌─────────────────────────────────────────────────────────────┐
│              🤖 Agent 层 - 专用智能体                         │
│  ┌────────────┬────────────┬────────────┬────────────┐      │
│  │ 数据分析    │ 广告目标   │ 广告分析   │ 报告生成   │      │
│  │ Agent     │ 评估Agent  │ Agent     │ Agent      │      │
│  └────────────┴────────────┴────────────┴────────────┘      │
│                 调用 Skills + 生成 Learnings                 │
└─────────────────────────────────────────────────────────────┘
                            ↓
┌─────────────────────────────────────────────────────────────┐
│              📚 Skills 层 - 可复用技能库                      │
│  ┌────────────┬────────────┬────────────┬────────────┐      │
│  │ 亚马逊广告  │ 数据验证   │ SEO优化    │ 关键词研究  │      │
│  │ Skills    │ Skills    │ Skills    │ Skills     │      │
│  └────────────┴────────────┴────────────┴────────────┘      │
│                  读取 Best Practices + Knowledge             │
└─────────────────────────────────────────────────────────────┘
                            ↓
┌─────────────────────────────────────────────────────────────┐
│           🧠 Knowledge 层 - 知识管理与学习                    │
│  ┌─────────────────────────────────────────────────────┐    │
│  │ Learnings     │ Best Practices │ Reflections        │    │
│  │ 学习记录       │ 最佳实践       │ 反思与改进          │    │
│  └─────────────────────────────────────────────────────┘    │
│                  自动化积累 + 持续优化                        │
└─────────────────────────────────────────────────────────────┘
                            ↓
┌─────────────────────────────────────────────────────────────┐
│            ⚙️ Context 层 - 配置与数据                        │
│  ┌────────────┬────────────┬────────────┬────────────┐      │
│  │ 配置数据包  │ 数据模式   │ 模板库     │ 工作流     │      │
│  │ Configs   │ Schemas   │ Templates │ Workflows  │      │
│  └────────────┴────────────┴────────────┴────────────┘      │
└─────────────────────────────────────────────────────────────┘
```

---

## 📁 目录结构

```
运营-multi-agent/
│
├── README.md                           # 系统总览和快速开始指南
├── ARCHITECTURE.md                     # 架构文档（本文件）
├── CHANGELOG.md                        # 变更日志
├── LICENSE                             # 开源协议
│
├── 📂 agents/                          # Agent 定义层
│   ├── README.md                       # Agent 开发指南
│   ├── _templates/                     # Agent 模板
│   │   ├── agent-template.md          # 标准 Agent 模板
│   │   └── workflow-template.yml      # 工作流模板
│   │
│   ├── data-analyst/                   # 📊 数据分析 Agent
│   │   ├── agent.md                   # Agent 定义文件
│   │   ├── workflows/                 # 专属工作流
│   │   └── examples/                  # 使用示例
│   │
│   ├── ad-goal-evaluator/             # 🎯 广告目标评估 Agent
│   │   ├── agent.md
│   │   ├── workflows/
│   │   └── examples/
│   │
│   ├── ad-analyzer/                   # 🔍 广告分析 Agent (基于现有 PPC analyzer)
│   │   ├── agent.md
│   │   ├── workflows/
│   │   └── examples/
│   │
│   ├── report-generator/              # 📝 报告生成 Agent
│   │   ├── agent.md
│   │   ├── workflows/
│   │   └── examples/
│   │
│   ├── keyword-researcher/            # 🔑 关键词研究 Agent
│   │   ├── agent.md
│   │   ├── workflows/
│   │   └── examples/
│   │
│   └── listing-optimizer/             # ✨ Listing 优化 Agent
│       ├── agent.md
│       ├── workflows/
│       └── examples/
│
├── 📂 skills/                          # Skills 技能库层
│   ├── README.md                       # Skills 开发指南
│   ├── _templates/                     # Skill 模板
│   │   └── skill-template.md
│   │
│   ├── amazon/                         # 亚马逊相关技能
│   │   ├── advertising/               # 广告技能
│   │   │   ├── ppc-optimization.md   # PPC 优化技能
│   │   │   ├── keyword-bidding.md    # 关键词竞价技能
│   │   │   └── campaign-structure.md  # 广告架构技能
│   │   │
│   │   ├── seo/                       # SEO 技能
│   │   │   ├── keyword-research.md   # 关键词研究
│   │   │   ├── listing-optimization.md # Listing 优化
│   │   │   └── backend-search-terms.md # 后台搜索词
│   │   │
│   │   └── operations/                # 运营技能
│   │       ├── inventory-management.md
│   │       ├── pricing-strategy.md
│   │       └── promotion-planning.md
│   │
│   ├── data-analysis/                 # 数据分析技能
│   │   ├── data-validation.md        # 数据验证
│   │   ├── statistical-analysis.md   # 统计分析
│   │   ├── trend-detection.md        # 趋势检测
│   │   └── anomaly-detection.md      # 异常检测
│   │
│   └── reporting/                     # 报告技能
│       ├── executive-summary.md      # 高管摘要
│       ├── visualization.md          # 数据可视化
│       └── actionable-insights.md    # 可执行洞察
│
├── 📂 knowledge/                       # 知识管理层
│   ├── README.md                       # 知识管理指南
│   │
│   ├── learnings/                     # 📝 学习记录
│   │   ├── 2025-11/                  # 按月组织
│   │   │   ├── 2025-11-05-ppc-data-validation-lesson.md
│   │   │   └── 2025-11-05-ai-vs-manual-insights.md
│   │   └── _index.md                 # 学习索引
│   │
│   ├── best-practices/                # ⭐ 最佳实践
│   │   ├── data-analysis/
│   │   │   ├── data-quality-checklist.md
│   │   │   └── validation-workflow.md
│   │   ├── advertising/
│   │   │   ├── campaign-structure-bp.md
│   │   │   └── keyword-optimization-bp.md
│   │   └── _index.md
│   │
│   ├── reflections/                   # 🤔 反思与改进
│   │   ├── 2025-11/
│   │   │   └── 2025-11-05-data-quality-reflection.md
│   │   └── _index.md
│   │
│   ├── case-studies/                  # 📚 案例研究
│   │   ├── successful-campaigns/
│   │   ├── optimization-wins/
│   │   └── lessons-learned/
│   │
│   └── principles/                    # 📐 运营法则
│       ├── advertising-principles.md
│       ├── data-driven-decisions.md
│       └── continuous-improvement.md
│
├── 📂 context/                         # 上下文配置层
│   ├── configs/                       # ⚙️ 配置数据包
│   │   ├── agent-configs.yml         # Agent 全局配置
│   │   ├── skill-configs.yml         # Skill 配置
│   │   └── integration-configs.yml   # 集成配置
│   │
│   ├── templates/                     # 📄 模板库
│   │   ├── reports/                  # 报告模板
│   │   │   ├── ppc-analysis-template.md
│   │   │   ├── monthly-report-template.md
│   │   │   └── executive-summary-template.md
│   │   ├── prompts/                  # Prompt 模板
│   │   └── scripts/                  # 脚本模板
│   │
│   └── data-schemas/                  # 📊 数据模式定义
│       ├── ppc-data-schema.json
│       ├── skill-schema.json
│       └── agent-schema.json
│
├── 📂 workflows/                       # 工作流定义层
│   ├── README.md                       # 工作流文档
│   ├── ppc-analysis-workflow.yml      # PPC 分析工作流
│   ├── monthly-report-workflow.yml    # 月度报告工作流
│   └── keyword-research-workflow.yml  # 关键词研究工作流
│
├── 📂 tools/                           # 工具脚本
│   ├── data-validation/               # 数据验证工具
│   ├── report-generation/             # 报告生成工具
│   └── knowledge-sync/                # 知识同步工具
│
└── 📂 docs/                            # 文档
    ├── guides/                        # 使用指南
    │   ├── getting-started.md
    │   ├── agent-development.md
    │   ├── skill-creation.md
    │   └── knowledge-management.md
    ├── api/                           # API 文档
    └── examples/                      # 示例集合
```

---

## 🔄 工作流程

### 典型任务执行流程

```
用户发起任务
    ↓
调用 Agent (e.g., ad-analyzer)
    ↓
Agent 加载相关 Skills
    ↓
Skills 读取 Knowledge (Best Practices, Learnings)
    ↓
执行任务 (使用 Context/Configs)
    ↓
生成结果 + 产生新的 Learnings
    ↓
自动更新 Knowledge 库
    ↓
返回结果给用户
```

### 持续学习流程

```
任务执行过程
    ↓
识别关键决策点和结果
    ↓
自动生成 Learning Entry
    ↓
分类存储到 knowledge/learnings/
    ↓
定期汇总到 Best Practices
    ↓
反馈到 Skills 和 Agents
    ↓
系统能力提升
```

---

## 🎯 Agent 标准

### Agent 定义格式 (Markdown Frontmatter)

```markdown
---
name: agent-name
description: |
  Agent 的详细描述和使用场景

  触发条件示例：
  - 当用户需要...
  - 当检测到...

model: opus  # 或 sonnet
color: blue  # Agent 标识颜色
version: 1.0.0
created: 2025-11-05
updated: 2025-11-05

# 依赖的 Skills
skills:
  - amazon/advertising/ppc-optimization
  - data-analysis/data-validation
  - reporting/executive-summary

# 需要的工具
tools:
  - python
  - pandas
  - csv-parser

# 访问的 Knowledge
knowledge_domains:
  - best-practices/advertising
  - learnings/ppc-analysis
  - case-studies/successful-campaigns
---

# Agent 主体内容

## 核心能力

## 工作流程

## 输出格式

## 质量标准
```

---

## 📚 Skill 标准

### Skill 定义格式

```markdown
---
skill_id: amazon-advertising-ppc-optimization
skill_name: PPC 广告优化技能
category: amazon/advertising
version: 1.0.0
created: 2025-11-05
updated: 2025-11-05

# 相关的最佳实践
best_practices:
  - best-practices/advertising/campaign-structure-bp
  - best-practices/advertising/keyword-optimization-bp

# 相关的学习记录
learnings:
  - learnings/2025-11/ppc-optimization-insights

# 输入输出
inputs:
  - campaign_data: CSV
  - performance_metrics: JSON
outputs:
  - optimization_recommendations: Markdown
  - action_items: JSON
---

# Skill 详细说明

## 技能描述

## 使用场景

## 实现步骤

## 最佳实践

## 常见问题

## 示例
```

---

## 🧠 Knowledge 管理标准

### Learning Entry 格式

```markdown
---
learning_id: 2025-11-05-ppc-data-validation
date: 2025-11-05
category: data-quality
tags: [ppc, data-validation, quality-assurance]
severity: high  # high, medium, low
agent: ad-analyzer
skill: data-analysis/data-validation
---

# 学习主题

## 问题/场景

## 发现的洞察

## 采取的行动

## 结果

## 可提取的最佳实践

## 应用范围

## 相关技能更新建议
```

### Best Practice 格式

```markdown
---
practice_id: data-quality-checklist
category: data-analysis
version: 2.0.0
last_updated: 2025-11-05
derived_from:
  - learnings/2025-11-05-ppc-data-validation
  - learnings/2025-10-28-data-accuracy-issue
---

# 最佳实践名称

## 适用场景

## 原则

## 检查清单

## 实施步骤

## 成功案例

## 注意事项
```

---

## 🔗 集成方案

### 与 Claude Code 集成

- Agents 存放在 `.claude/agents/` 目录
- 通过 Claude Code 的 Task tool 调用 agents
- 使用 Claude Code 的文件操作工具读写 Knowledge

### 与 GitHub 集成

```bash
# 仓库结构
运营-multi-agent/           # 主仓库
├── .github/
│   ├── workflows/        # GitHub Actions (自动化)
│   │   ├── sync-skills.yml
│   │   └── knowledge-backup.yml
│   └── ISSUE_TEMPLATE/   # Issue 模板
└── ...

# 与 skills 仓库的关系
mrlong0129/skills/        # 现有 skills 仓库
    ↓ (通过 git submodule 或同步脚本)
运营-multi-agent/skills/   # 本地 skills 副本 + 扩展
```

### 同步策略

1. **Skills 双向同步**
   - `mrlong0129/skills` → `运营-multi-agent/skills/amazon/`
   - 新创建的 skills 可以选择性推送回 `mrlong0129/skills`

2. **Knowledge 自动备份**
   - 每日自动提交 learnings 到 GitHub
   - 每周汇总 best practices

3. **Version Control**
   - Agents 版本化管理
   - Skills 语义化版本 (semver)
   - Knowledge 时间戳版本

---

## 🚀 扩展性设计

### 未来可添加的 Agents

- **库存管理 Agent** - 库存预测和补货建议
- **定价策略 Agent** - 动态定价优化
- **竞品分析 Agent** - 竞争对手监控
- **Review 管理 Agent** - 评论分析和响应
- **促销规划 Agent** - 促销活动设计

### 未来可添加的 Skills

- **预测建模** - 销量预测、趋势预测
- **A/B 测试** - 实验设计和分析
- **客户画像** - 用户行为分析
- **供应链优化** - 物流和成本优化

---

## 📊 成功指标

### 系统健康度指标

- **Agent 响应准确率** > 95%
- **Knowledge 利用率** (每次任务平均引用的 best practices 数量)
- **Learning 积累速度** (每月新增 learning entries)
- **Skills 复用率** (每个 skill 被不同 agents 使用的次数)

### 业务影响指标

- **决策速度提升** (对比使用前后)
- **运营效率提升** (自动化程度)
- **错误减少率** (数据质量问题减少)

---

## 🔐 安全与隐私

- **敏感数据处理**: 所有包含真实商业数据的文件不提交到 GitHub
- **配置分离**: 敏感配置使用环境变量或 `.env` 文件
- **访问控制**: GitHub 私有仓库 + 团队权限管理
- **数据脱敏**: Knowledge 中的案例研究需脱敏处理

---

## 📝 维护和更新

### 定期维护任务

- **每周**:
  - Review 新增的 learnings
  - 更新 best practices
  - 清理过时的配置

- **每月**:
  - Agent 性能评估
  - Skills 优化和重构
  - Knowledge 索引更新

- **每季度**:
  - 架构审查和优化
  - 文档完善
  - 版本发布

---

## 🎓 学习路径

### 新用户快速上手

1. 阅读 `README.md` 了解系统概览
2. 阅读 `docs/guides/getting-started.md` 快速开始
3. 运行示例 Agent 熟悉工作流
4. 创建第一个自定义 Skill
5. 记录第一个 Learning Entry

### 进阶使用

1. 开发自定义 Agent
2. 设计复杂工作流
3. 建立自己的 Best Practices 体系
4. 贡献到 Skills 仓库

---

## 📞 支持和反馈

- **GitHub Issues**: 问题报告和功能请求
- **GitHub Discussions**: 使用讨论和经验分享
- **Knowledge Base**: 查阅已有的解决方案

---

**系统设计哲学**:
> "构建一个会学习、会进化的系统，而不仅仅是工具的集合。每一次使用都让系统更智能，每一个决策都被记录和改进。"

---

*最后更新: 2025-11-05*
*维护者: CharliephilMrlong*
