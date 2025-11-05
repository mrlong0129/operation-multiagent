---
name: agent-name
description: |
  Agent 的详细描述和核心职责。

  **触发场景示例：**

  <example>
  Context: [场景上下文]
  user: "[用户请求示例]"
  assistant: "[助手响应 - 说明会调用此 agent]"
  <commentary>
  [说明为什么触发此 agent]
  </commentary>
  </example>

model: opus  # 可选: opus, sonnet
color: blue  # Agent 标识颜色: blue, green, purple, red, yellow
version: 1.0.0
created: YYYY-MM-DD
updated: YYYY-MM-DD
status: active  # active, beta, deprecated

# 依赖的 Skills
skills:
  - category/subcategory/skill-name
  - category/subcategory/skill-name

# 需要的工具
tools:
  - python
  - pandas
  - tool-name

# 访问的 Knowledge 领域
knowledge_domains:
  - best-practices/category
  - learnings/topic
  - case-studies/category

# 输出类型
outputs:
  - markdown-report
  - json-data
  - visualization
---

# [Agent 名称]

**一句话描述这个 Agent 的核心价值**

---

## 🎯 核心职责

这个 Agent 专门负责：

1. **职责 1** - 详细说明
2. **职责 2** - 详细说明
3. **职责 3** - 详细说明

---

## 💡 核心能力

### 能力 1: [能力名称]

**描述：** 详细说明这个能力

**应用场景：**
- 场景 A
- 场景 B

**相关 Skills：**
- `skill-name` - 说明如何使用

---

### 能力 2: [能力名称]

**描述：** 详细说明这个能力

**应用场景：**
- 场景 A
- 场景 B

**相关 Skills：**
- `skill-name` - 说明如何使用

---

## 🔄 工作流程

### 阶段 0: 前置检查（如适用）

**目的：** 说明前置检查的目的

**检查项：**
- ✅ 检查项 1
- ✅ 检查项 2
- ✅ 检查项 3

**如果检查失败：**
- 行动 A
- 行动 B

---

### 阶段 1: [阶段名称]

**输入：**
- 输入 1: 描述
- 输入 2: 描述

**处理步骤：**
1. 步骤 1 - 详细说明
2. 步骤 2 - 详细说明
3. 步骤 3 - 详细说明

**使用的 Skills：**
- `skill-name-1` - 用于...
- `skill-name-2` - 用于...

**输出：**
- 输出 1: 描述
- 输出 2: 描述

**质量检查：**
- ✅ 检查点 1
- ✅ 检查点 2

---

### 阶段 2: [阶段名称]

**输入：**
- 来自阶段 1 的输出

**处理步骤：**
1. 步骤 1 - 详细说明
2. 步骤 2 - 详细说明

**使用的 Skills：**
- `skill-name` - 用于...

**输出：**
- 输出描述

**质量检查：**
- ✅ 检查点 1
- ✅ 检查点 2

---

### 阶段 N: 最终输出

**输入：**
- 来自前序阶段的所有输出

**整合步骤：**
1. 整合所有分析结果
2. 生成最终报告
3. 提供行动建议

**输出格式：**
```markdown
# 报告标题

## 1. 执行摘要
[关键发现]

## 2. 详细分析
[详细内容]

## 3. 行动建议
[具体建议]
```

---

## 📊 输出规范

### 报告结构

1. **执行摘要**
   - 关键发现（3-5 条）
   - 主要问题（1-3 个）
   - 快速行动项（Top 3）

2. **详细分析**
   - 数据分析结果
   - 趋势和模式
   - 深度洞察

3. **行动建议**
   - 即时优化（Quick Wins）
   - 中期改进（1-2 周）
   - 长期规划（1 月+）

### 输出格式

- **主要格式**: Markdown
- **数据格式**: JSON, CSV (如适用)
- **可视化**: 图表建议（如适用）

---

## 🧠 Knowledge 集成

### 读取的 Best Practices

此 Agent 在执行时会自动读取：

- `best-practices/category/practice-1.md` - 用于...
- `best-practices/category/practice-2.md` - 用于...

### 读取的 Learnings

从历史经验中学习：

- `learnings/YYYY-MM/relevant-topic-*.md` - 应用于...

### 生成的 Learnings

执行完成后，Agent 会自动生成：

- **Learning Entry** - 记录关键决策和结果
- **Best Practice 更新建议** - 提炼可复用的经验

**Learning 记录格式：**
```markdown
---
learning_id: YYYY-MM-DD-agent-name-topic
date: YYYY-MM-DD
category: [category]
agent: [agent-name]
---

# 学习主题

## 问题/场景
[描述]

## 采取的行动
[描述]

## 结果
[描述]

## 可提取的最佳实践
[描述]
```

---

## ⚠️ 错误处理

### 常见错误场景

#### 错误 1: [错误类型]

**症状：**
- 表现 A
- 表现 B

**处理流程：**
1. 立即停止当前操作
2. 记录错误详情
3. 通知用户并说明问题
4. 提供解决建议

**恢复策略：**
- 策略 A
- 策略 B

---

#### 错误 2: [错误类型]

**症状：**
- 表现 A
- 表现 B

**处理流程：**
1. 处理步骤

**恢复策略：**
- 策略 A

---

## 🎯 质量标准

在交付结果前，必须确保：

- ✅ **数据准确性** - 所有计算和引用的数据经过验证
- ✅ **逻辑一致性** - 分析逻辑清晰，结论有据可依
- ✅ **可执行性** - 建议具体、可操作、有优先级
- ✅ **完整性** - 覆盖所有关键方面，无遗漏
- ✅ **清晰性** - 表达清晰，专业术语有解释

### 自检清单

执行前：
- [ ] 输入数据完整且有效
- [ ] 所需 Skills 可用
- [ ] 相关 Knowledge 已读取

执行中：
- [ ] 每个阶段输出符合预期
- [ ] 质量检查点已通过
- [ ] 异常情况已处理

执行后：
- [ ] 输出格式符合规范
- [ ] 数据准确性已验证
- [ ] Learning 已记录

---

## 📚 使用示例

### 示例 1: [典型场景]

**用户请求：**
```
[具体请求内容]
```

**Agent 执行：**
1. 理解需求并确认输入
2. 执行阶段 1-N
3. 生成最终报告

**输出示例：**
```markdown
[展示实际输出的片段]
```

---

### 示例 2: [复杂场景]

**用户请求：**
```
[具体请求内容]
```

**Agent 执行：**
1. 处理步骤

**输出示例：**
```markdown
[展示实际输出的片段]
```

---

## 🔧 配置选项

### 可配置参数

在 `context/configs/agent-configs.yml` 中可配置：

```yaml
agents:
  agent-name:
    model: opus  # 或 sonnet
    temperature: 0.7
    max_tokens: 4000

    # 自定义参数
    custom_param_1: value
    custom_param_2: value

    # Skill 配置覆盖
    skill_overrides:
      skill-name:
        param: value
```

---

## 🔗 相关资源

### 相关 Agents

- [agent-1](../agent-1/agent.md) - 关系说明
- [agent-2](../agent-2/agent.md) - 关系说明

### 使用的 Skills

- [skill-1](../../skills/category/skill-1.md)
- [skill-2](../../skills/category/skill-2.md)

### 外部文档

- [资源名称](URL) - 说明

---

## 📈 版本历史

### v1.0.0 (YYYY-MM-DD)
- 初始版本
- 核心功能实现

### v1.1.0 (YYYY-MM-DD)
- 新增功能 A
- 优化 B
- 修复问题 C

---

## 🤝 反馈和改进

遇到问题或有改进建议？

- 📝 在 `knowledge/reflections/` 记录反思
- 💡 在 `knowledge/learnings/` 记录经验教训
- 🐛 在 GitHub Issues 报告 bug

---

**维护者：** [Your Name]
**最后更新：** YYYY-MM-DD
**状态：** ✅ Active / 🚧 Beta / ⚠️ Deprecated
