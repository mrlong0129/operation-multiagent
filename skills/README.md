# 📚 Skills 技能库

**可复用、可组合的亚马逊运营技能模块**

---

## 🎯 什么是 Skill？

Skill 是一个**可复用的知识和方法模块**，封装了完成特定任务的标准化流程、最佳实践和经验总结。

**Skill 的特点：**
- ✅ **可复用** - 可被多个 Agents 调用
- ✅ **模块化** - 专注解决一个具体问题
- ✅ **标准化** - 遵循统一的格式和规范
- ✅ **自进化** - 通过 Learnings 持续优化

---

## 📂 Skills 分类

### 🛍️ 亚马逊运营 (amazon/)

#### 广告技能 (advertising/)
- **ppc-optimization.md** - PPC 广告优化技能
- **keyword-bidding.md** - 关键词竞价策略
- **campaign-structure.md** - 广告架构设计
- **negative-keyword-mining.md** - 否定关键词挖掘

#### SEO 技能 (seo/)
- **keyword-research.md** - 关键词研究
- **listing-optimization.md** - Listing 优化
- **backend-search-terms.md** - 后台搜索词优化
- **competitor-analysis.md** - 竞品分析

#### 运营技能 (operations/)
- **inventory-management.md** - 库存管理
- **pricing-strategy.md** - 定价策略
- **promotion-planning.md** - 促销规划
- **review-management.md** - 评论管理

---

### 📊 数据分析 (data-analysis/)

- **data-validation.md** - 数据验证技能
- **statistical-analysis.md** - 统计分析
- **trend-detection.md** - 趋势检测
- **anomaly-detection.md** - 异常检测
- **forecasting.md** - 预测建模

---

### 📝 报告技能 (reporting/)

- **executive-summary.md** - 高管摘要生成
- **visualization.md** - 数据可视化
- **actionable-insights.md** - 可执行洞察提炼
- **performance-dashboard.md** - 性能仪表板

---

## 🚀 如何使用 Skill

### 在 Agent 中引用

在 Agent 定义文件中声明依赖的 Skills：

```yaml
---
name: ad-analyzer
skills:
  - amazon/advertising/ppc-optimization
  - data-analysis/data-validation
  - reporting/executive-summary
---
```

### 在代码中调用

```python
# 伪代码示例
from skills.amazon.advertising import ppc_optimization
from skills.data_analysis import data_validation

# 先验证数据
validation_result = data_validation.validate(campaign_data)

# 如果验证通过，执行优化
if validation_result.passed:
    recommendations = ppc_optimization.optimize(campaign_data)
```

### 在 Prompt 中引用

```markdown
请使用以下技能完成任务：
1. 使用 `data-analysis/data-validation` 验证数据质量
2. 使用 `amazon/advertising/ppc-optimization` 分析广告效果
3. 使用 `reporting/executive-summary` 生成摘要报告
```

---

## 📝 如何创建新的 Skill

### 步骤 1: 使用模板

复制模板文件：

```bash
cp skills/_templates/skill-template.md skills/[category]/[skill-name].md
```

### 步骤 2: 填写基本信息

编辑 frontmatter：

```yaml
---
skill_id: amazon-advertising-ppc-optimization
skill_name: PPC 广告优化技能
category: amazon/advertising
version: 1.0.0
created: 2025-11-05
updated: 2025-11-05
status: active

best_practices:
  - best-practices/advertising/campaign-structure-bp

learnings:
  - learnings/2025-11/ppc-optimization-insights

dependencies:
  - data-analysis-validation

inputs:
  - campaign_data: CSV
  - performance_metrics: JSON
outputs:
  - optimization_recommendations: Markdown
  - action_items: JSON

tags:
  - ppc
  - advertising
  - optimization
---
```

### 步骤 3: 编写技能内容

按照模板结构填写：
1. 技能描述
2. 使用场景
3. 实现步骤
4. 最佳实践
5. 示例
6. 常见问题

### 步骤 4: 测试和验证

创建示例并测试技能是否可用：

```bash
# 在 docs/examples/ 创建使用示例
```

### 步骤 5: 更新索引

在本 README.md 中添加新 Skill 的索引。

---

## ⭐ Skill 开发最佳实践

### 设计原则

1. **单一职责** - 一个 Skill 只做一件事，但做好
2. **清晰接口** - 明确定义输入和输出
3. **充分文档** - 详细说明使用方法和注意事项
4. **包含示例** - 提供实际使用案例
5. **持续优化** - 基于 Learnings 不断改进

### 命名规范

- **文件名**: 小写，使用连字符分隔，如 `ppc-optimization.md`
- **Skill ID**: `category-skill-name`，如 `amazon-advertising-ppc-optimization`
- **分类路径**: `category/subcategory/skill.md`

### 版本管理

采用语义化版本 (Semantic Versioning)：

- **MAJOR**: 不兼容的 API 修改
- **MINOR**: 向下兼容的功能性新增
- **PATCH**: 向下兼容的问题修正

示例：`1.2.3`

### 文档标准

- ✅ 使用 Markdown 格式
- ✅ 包含完整的 frontmatter
- ✅ 至少提供 2 个使用示例
- ✅ 列出常见问题和解决方案
- ✅ 关联相关的 Best Practices

---

## 🔗 Skill 依赖管理

### 依赖类型

1. **必需依赖** - 必须先执行的 Skill
2. **可选依赖** - 可以增强效果的 Skill
3. **互斥依赖** - 不能同时使用的 Skill

### 依赖声明

在 frontmatter 中声明：

```yaml
dependencies:
  required:
    - data-analysis-validation
  optional:
    - data-analysis-forecasting
  conflicts:
    - deprecated-skill-name
```

---

## 📊 Skill 质量指标

### 使用频率

- **高频 (High)**: 被 5+ Agents 使用
- **中频 (Medium)**: 被 2-4 Agents 使用
- **低频 (Low)**: 被 1 个 Agent 使用

### 成熟度

- **Stable**: 生产环境稳定使用
- **Beta**: 测试阶段，可能有变动
- **Alpha**: 实验性功能
- **Deprecated**: 已废弃，将被移除

### 文档完整度

- ✅ 完整的描述和使用场景
- ✅ 详细的实现步骤
- ✅ 至少 2 个示例
- ✅ 常见问题列表
- ✅ 相关资源链接

---

## 🔄 Skill 生命周期

```
创建 → 测试 → 发布 → 使用 → 收集反馈 → 优化 → 新版本
                              ↓
                         废弃/替换
```

### 创建阶段
- 使用模板创建
- 编写文档
- 创建示例

### 测试阶段
- 在 Agent 中测试
- 验证输入输出
- 检查文档完整性

### 发布阶段
- 更新版本号
- 更新 README 索引
- 提交到 Git

### 使用阶段
- 被 Agents 调用
- 产生 Learnings
- 积累 Best Practices

### 优化阶段
- 基于 Learnings 改进
- 更新最佳实践
- 发布新版本

### 废弃阶段
- 标记为 deprecated
- 提供迁移指南
- 最终移除

---

## 📈 Skill 统计

| 类别 | Skill 数量 | 状态 |
|------|-----------|------|
| Amazon Advertising | 4 | 🚧 开发中 |
| Amazon SEO | 4 | 📝 计划中 |
| Amazon Operations | 4 | 📝 计划中 |
| Data Analysis | 5 | 🚧 开发中 |
| Reporting | 4 | 📝 计划中 |
| **总计** | **21** | - |

---

## 🤝 贡献 Skill

欢迎贡献新的 Skills！

### 贡献流程

1. Fork 仓库
2. 创建 feature 分支
3. 使用模板创建新 Skill
4. 添加示例和测试
5. 更新本 README
6. 提交 Pull Request

### 审核标准

- ✅ 遵循 Skill 模板格式
- ✅ 文档完整清晰
- ✅ 至少包含 2 个示例
- ✅ 代码/方法经过验证
- ✅ 关联相关的 Best Practices

---

## 📞 支持

- 📧 问题反馈：[GitHub Issues](https://github.com/[YOUR_USERNAME]/amazon-operations-multi-agent/issues)
- 💬 经验分享：[GitHub Discussions](https://github.com/[YOUR_USERNAME]/amazon-operations-multi-agent/discussions)

---

**Skills 是系统的核心能力库，每个 Skill 的优化都会让整个系统更强大。**

*让我们一起构建世界级的亚马逊运营技能库！* 🚀
