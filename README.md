# 🚀 亚马逊运营 Multi-Agent 系统

**一个会学习、会进化的亚马逊运营智能助手系统**

[![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)](https://github.com/mrlong0129/amazon-operations-multi-agent)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-Powered-purple.svg)](https://claude.ai/code)

---

## 🎯 系统简介

这是一个基于 **Claude Code** 构建的自我进化运营系统，专为亚马逊卖家设计。通过多个专用 Agents 协同工作，配合可复用的 Skills 技能库和持续学习的 Knowledge 管理机制，让 AI 成为你最强大的运营助手。

### 核心特性

- 🤖 **Multi-Agent 架构** - 专用 Agents 处理不同运营任务
- 📚 **Skills 技能库** - 可复用、可组合的技能模块
- 🧠 **知识管理系统** - 自动记录经验、积累最佳实践
- 🔄 **持续学习机制** - 每次使用都让系统更智能
- ⚡ **Claude Code 集成** - 深度整合 Claude Code 工作流
- 🔗 **GitHub 管理** - 版本控制、团队协作

---

## 🏗️ 系统架构

```
🎯 应用层 (You)
    ↓
🤖 Agent 层 (数据分析、广告优化、报告生成等)
    ↓
📚 Skills 层 (亚马逊运营、数据分析、报告技能等)
    ↓
🧠 Knowledge 层 (学习记录、最佳实践、反思改进)
    ↓
⚙️ Context 层 (配置、模板、数据模式)
```

详细架构文档：[ARCHITECTURE.md](ARCHITECTURE.md)

---

## 🚀 快速开始

### 前置要求

- ✅ [Claude Code CLI](https://claude.ai/code) 已安装
- ✅ Python 3.8+
- ✅ Git
- ✅ GitHub 账号（用于版本管理）

### 安装步骤

#### 1. 克隆仓库

```bash
# 克隆主仓库
git clone https://github.com/[YOUR_USERNAME]/amazon-operations-multi-agent.git
cd amazon-operations-multi-agent

# 初始化 skills 子模块（如果使用 git submodule）
git submodule init
git submodule update
```

#### 2. 配置 Claude Code

将 agents 链接到 Claude Code：

```bash
# 创建软链接（macOS/Linux）
ln -s "$(pwd)/agents" ~/.claude/agents/amazon-ops

# 或者直接复制（Windows）
cp -r agents ~/.claude/agents/amazon-ops
```

#### 3. 配置环境

```bash
# 复制配置模板
cp context/configs/agent-configs.example.yml context/configs/agent-configs.yml

# 编辑配置（添加你的 API keys 等）
# 注意：敏感配置不要提交到 Git
```

---

## 📖 使用指南

### 基础使用

#### 启动 Claude Code

```bash
claude-code
```

#### 调用 Agent

在 Claude Code 中，直接描述你的需求：

```
我想分析本月的 PPC 广告数据，对比 AI 和 Manual 广告的效果
```

系统会自动：
1. 识别需要使用 `ad-analyzer` agent
2. 调用相关 Skills（数据验证、PPC 优化等）
3. 读取 Knowledge（最佳实践、历史经验）
4. 执行分析并生成报告
5. 自动记录新的 Learnings

### 示例任务

#### 1. PPC 广告分析

```
@amazon-ops/ad-analyzer

请分析我上传的 10 月 PPC 数据：
- manual_campaign_filtered.csv
- ai_campaign_filtered.csv

重点关注：
1. ACoS 和 RoAS 对比
2. 关键词效果分析
3. 优化建议
```

#### 2. 关键词研究

```
@amazon-ops/keyword-researcher

为我的保温杯产品做关键词研究：
- 产品: Coolflask 保温杯
- 目标市场: 美国
- 竞品ASIN: B08XYZ123
```

#### 3. 月度报告生成

```
@amazon-ops/report-generator

生成 10 月运营月报：
- 包含销量、广告、转化率分析
- 对比上月数据
- 提供下月策略建议
```

---

## 🤖 可用的 Agents

| Agent | 功能 | 状态 |
|-------|------|------|
| **data-analyst** | 数据分析和可视化 | ✅ 可用 |
| **ad-goal-evaluator** | 广告目标设定和评估 | 🚧 开发中 |
| **ad-analyzer** | PPC 广告深度分析 | ✅ 可用 |
| **report-generator** | 自动化报告生成 | 🚧 开发中 |
| **keyword-researcher** | 关键词研究和优化 | 📝 计划中 |
| **listing-optimizer** | Listing 优化建议 | 📝 计划中 |

详细说明：[agents/README.md](agents/README.md)

---

## 📚 Skills 技能库

### 按类别

**亚马逊运营**
- `amazon/advertising/ppc-optimization` - PPC 广告优化
- `amazon/advertising/keyword-bidding` - 关键词竞价
- `amazon/seo/keyword-research` - 关键词研究
- `amazon/seo/listing-optimization` - Listing 优化

**数据分析**
- `data-analysis/data-validation` - 数据验证
- `data-analysis/statistical-analysis` - 统计分析
- `data-analysis/trend-detection` - 趋势检测

**报告生成**
- `reporting/executive-summary` - 高管摘要
- `reporting/visualization` - 数据可视化

详细说明：[skills/README.md](skills/README.md)

---

## 🧠 知识管理

### Learnings (学习记录)

每次使用系统，重要的决策和结果都会被记录为 Learning Entry：

```markdown
knowledge/learnings/2025-11/
├── 2025-11-05-ppc-data-validation-lesson.md
├── 2025-11-05-ai-vs-manual-insights.md
└── ...
```

### Best Practices (最佳实践)

从 Learnings 中提炼的最佳实践：

```markdown
knowledge/best-practices/advertising/
├── data-quality-checklist.md
├── campaign-structure-bp.md
└── keyword-optimization-bp.md
```

### Reflections (反思改进)

定期反思和改进记录：

```markdown
knowledge/reflections/2025-11/
└── 2025-11-05-data-quality-reflection.md
```

详细说明：[knowledge/README.md](knowledge/README.md)

---

## 🔧 配置和定制

### Agent 配置

编辑 `context/configs/agent-configs.yml`:

```yaml
agents:
  ad-analyzer:
    model: opus  # 或 sonnet
    temperature: 0.7
    max_tokens: 4000
    skills:
      - amazon/advertising/ppc-optimization
      - data-analysis/data-validation
```

### Skills 配置

编辑 `context/configs/skill-configs.yml`:

```yaml
skills:
  amazon-advertising-ppc-optimization:
    version: "1.0.0"
    dependencies:
      - data-analysis-validation
    parameters:
      default_acos_threshold: 30
      default_roas_target: 2.5
```

---

## 🔄 工作流程

### 典型任务执行流程

```
1. 用户发起任务
   ↓
2. Claude Code 识别并调用 Agent
   ↓
3. Agent 加载所需 Skills
   ↓
4. Skills 读取 Knowledge (Best Practices, Learnings)
   ↓
5. 执行任务 (应用 Context/Configs)
   ↓
6. 生成结果 + 产生新的 Learnings
   ↓
7. 自动更新 Knowledge 库
   ↓
8. 返回结果给用户
```

### 持续学习流程

```
任务执行 → 识别关键决策 → 生成 Learning Entry
    ↓
存储到 knowledge/learnings/
    ↓
定期汇总到 Best Practices
    ↓
反馈到 Skills 和 Agents
    ↓
系统能力提升 ✨
```

---

## 📂 目录结构

```
运营-multi-agent/
├── agents/              # Agent 定义
├── skills/              # Skills 技能库
├── knowledge/           # 知识管理
│   ├── learnings/      # 学习记录
│   ├── best-practices/ # 最佳实践
│   ├── reflections/    # 反思改进
│   └── principles/     # 运营法则
├── context/            # 配置和模板
│   ├── configs/       # 配置文件
│   ├── templates/     # 模板库
│   └── data-schemas/  # 数据模式
├── workflows/          # 工作流定义
├── tools/             # 工具脚本
└── docs/              # 文档
```

完整结构：[ARCHITECTURE.md](ARCHITECTURE.md)

---

## 🎓 学习资源

### 文档

- [快速开始指南](docs/guides/getting-started.md)
- [Agent 开发指南](docs/guides/agent-development.md)
- [Skill 创建指南](docs/guides/skill-creation.md)
- [知识管理指南](docs/guides/knowledge-management.md)

### 示例

- [PPC 分析示例](docs/examples/ppc-analysis-example.md)
- [关键词研究示例](docs/examples/keyword-research-example.md)
- [月度报告示例](docs/examples/monthly-report-example.md)

---

## 🤝 贡献指南

欢迎贡献！

### 如何贡献

1. Fork 本仓库
2. 创建 feature 分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 创建 Pull Request

### 贡献类型

- 🐛 Bug 修复
- ✨ 新 Agent 或 Skill
- 📝 文档改进
- 🧠 Best Practice 分享
- 💡 功能建议

---

## 📊 成功指标

### 系统健康度

- **Agent 响应准确率**: 目标 > 95%
- **Knowledge 利用率**: 每次任务平均引用 3+ best practices
- **Learning 积累速度**: 每月新增 10+ learning entries
- **Skills 复用率**: 每个 skill 被 3+ agents 使用

### 业务影响

- **决策速度提升**: 对比使用前后
- **运营效率提升**: 自动化程度提升
- **错误减少率**: 数据质量问题减少

---

## 🔐 安全和隐私

- ⚠️ **敏感数据**: 所有真实商业数据不提交到 GitHub
- 🔒 **配置分离**: 敏感配置使用 `.env` 文件（已加入 `.gitignore`）
- 👥 **访问控制**: 使用 GitHub 私有仓库
- 🎭 **数据脱敏**: Knowledge 中的案例需脱敏处理

---

## 📝 版本历史

### v1.0.0 (2025-11-05)

- ✨ 初始版本发布
- 🤖 Ad-Analyzer Agent (单品版)
- 📚 基础 Skills 库
- 🧠 Knowledge 管理框架
- 📖 完整文档

查看完整更新日志：[CHANGELOG.md](CHANGELOG.md)

---

## 📞 支持和反馈

- 📧 **Email**: [your-email@example.com]
- 💬 **GitHub Issues**: [提交问题](https://github.com/[YOUR_USERNAME]/amazon-operations-multi-agent/issues)
- 💡 **GitHub Discussions**: [经验分享](https://github.com/[YOUR_USERNAME]/amazon-operations-multi-agent/discussions)

---

## 📄 许可证

本项目采用 MIT 许可证 - 查看 [LICENSE](LICENSE) 文件了解详情

---

## 🙏 致谢

- [Claude Code](https://claude.ai/code) - AI 驱动的开发工具
- [mrlong0129/skills](https://github.com/mrlong0129/skills) - 亚马逊运营技能库

---

**系统设计哲学**:
> "构建一个会学习、会进化的系统，而不仅仅是工具的集合。每一次使用都让系统更智能，每一个决策都被记录和改进。"

---

*打造属于你的 AI 运营助手，让数据驱动决策，让经验持续积累。*

**Happy Operating! 🚀**
