# GitHub 同步指南

**仓库地址:** https://github.com/mrlong0129/operation-multiagent

---

## 🎯 同步方式

### 方式 1: 交互式同步 (推荐用于重要更新)

**使用场景:**
- ✅ 新增 Skill 或 Agent
- ✅ 重要功能更新
- ✅ 需要详细记录的变更
- ✅ 阶段性成果提交

**操作步骤:**

```bash
# 1. 进入项目目录
cd "运营 multi agent"

# 2. 运行交互式同步脚本
./sync-to-github.sh

# 3. 查看变更列表,确认
# 4. 输入提交标题 (简短描述)
# 5. 输入详细说明 (可选)
# 6. 自动推送到 GitHub
```

**示例:**

```
📊 检查变更文件...
 M skills/amazon/advertising/ppc-optimization.md
A  knowledge/learnings/2025-11/2025-11-06-new-learning.md

📝 变更文件统计:
   新增文件: 1
   修改文件: 1
   删除文件: 0
   未跟踪: 0

❓ 是否继续提交并推送? (y/n) y

请输入本次更新的主要内容 (简短描述):
增强 ppc-optimization Skill 添加完整代码

请输入详细说明 (可选,直接回车跳过):
- 添加 5 个代码模块
- 更新示例使用 Coolflask 案例
- 版本号更新到 v1.1.0

✅ 同步完成!
```

---

### 方式 2: 快速同步 (用于日常更新)

**使用场景:**
- ✅ 添加 Learning Entry
- ✅ 文档小改动
- ✅ 日常备份
- ✅ 不需要详细说明的更新

**操作步骤:**

```bash
# 1. 进入项目目录
cd "运营 multi agent"

# 2. 一键快速同步
./quick-sync.sh
```

**输出示例:**

```
📊 变更统计:
   knowledge/learnings/2025-11/2025-11-06-daily-work.md | 50 +++++

✅ 快速同步完成!
🔗 https://github.com/mrlong0129/operation-multiagent
```

---

### 方式 3: 手动 Git 命令 (高级用户)

**完整控制流程:**

```bash
# 1. 查看变更
git status

# 2. 添加特定文件
git add path/to/file.md

# 或添加所有变更
git add .

# 3. 创建提交
git commit -m "你的提交信息"

# 4. 推送到 GitHub
git push origin main

# 5. 查看推送状态
git log --oneline -5
```

---

## 📋 提交信息规范

### 格式要求

```
📝 [类型] 简短标题

详细说明 (可选)

---

🤖 Generated with Claude Code
Co-Authored-By: Claude <noreply@anthropic.com>
```

### 类型标识

| Emoji | 类型 | 说明 | 示例 |
|-------|------|------|------|
| 🎉 | Init | 初始化 | 🎉 初始提交: Multi-Agent 系统 v1.0 |
| ✨ | Feature | 新功能 | ✨ Add data-validation Skill |
| 📝 | Update | 更新 | 📝 Update ppc-optimization with code |
| 🐛 | Bugfix | 修复 | 🐛 Fix date range validation error |
| 📚 | Docs | 文档 | 📚 Update README with examples |
| 🔧 | Config | 配置 | 🔧 Add sync scripts |
| ♻️ | Refactor | 重构 | ♻️ Refactor agent workflow |
| 🎨 | Style | 格式 | 🎨 Format markdown files |
| ⚡ | Performance | 性能 | ⚡ Optimize data loading |
| 🔒 | Security | 安全 | 🔒 Update .gitignore |

### 好的提交信息示例

**示例 1: 新增 Skill**
```
✨ Add executive-summary Skill

## 新增功能
- 标准化报告生成流程
- 基于 Coolflask 报告模板
- 包含可视化建议

## 文件
- skills/reporting/executive-summary.md (new)

---

🤖 Generated with Claude Code
Co-Authored-By: Claude <noreply@anthropic.com>
```

**示例 2: 更新 Learning**
```
📝 Add Learning Entry - PPC 数据质量问题

记录今天发现的 AI 和 Manual 数据日期不一致问题,
以及解决方案。

---

🤖 Generated with Claude Code
Co-Authored-By: Claude <noreply@anthropic.com>
```

**示例 3: 日常更新**
```
📝 Update - 2025-11-06 21:30

Auto-sync: 定期更新

🤖 Generated with Claude Code
Co-Authored-By: Claude <noreply@anthropic.com>
```

---

## 🔄 同步频率建议

### 每天

**下班前同步:**
```bash
# 快速备份当天工作
./quick-sync.sh
```

### 每周

**周五总结:**
```bash
# 交互式提交,详细记录本周成果
./sync-to-github.sh

# 提交信息示例:
# 📊 Weekly Summary - 2025-11-01 to 2025-11-07
#
# ## 本周成果
# - 新增 2 个 Skills
# - 创建 5 个 Learning Entries
# - 完善 ad-analyzer Agent
```

### 重要里程碑

**使用交互式同步:**
- 完成新 Skill
- 完成新 Agent
- 提炼新 Best Practice
- 重大架构调整

---

## 📊 查看同步历史

### 在 GitHub 上查看

**访问:** https://github.com/mrlong0129/operation-multiagent/commits/main

**功能:**
- 查看所有提交历史
- 对比文件变更
- 查看提交详情

### 在本地查看

```bash
# 查看最近 10 次提交
git log --oneline -10

# 查看某个文件的变更历史
git log --oneline -- path/to/file.md

# 查看某次提交的详细变更
git show <commit-hash>

# 查看今天的所有提交
git log --since="today" --oneline

# 查看本周的所有提交
git log --since="1 week ago" --oneline
```

---

## ⚠️ 常见问题

### 问题 1: 推送失败 (rejected)

**症状:**
```
! [rejected]        main -> main (fetch first)
```

**原因:** 远程仓库有其他人的提交

**解决:**
```bash
# 1. 先拉取远程更新
git pull origin main

# 2. 解决冲突 (如果有)
# 3. 重新推送
git push origin main
```

---

### 问题 2: 忘记添加文件

**症状:** 提交后发现少了文件

**解决:**
```bash
# 1. 添加遗漏的文件
git add forgotten-file.md

# 2. 追加到上次提交 (仅限本地未推送)
git commit --amend --no-edit

# 3. 推送 (需要 force)
git push origin main --force

# 或者创建新提交 (推荐)
git commit -m "📝 Add forgotten file"
git push origin main
```

---

### 问题 3: 不小心提交了敏感信息

**解决:**
```bash
# 1. 从暂存区移除文件
git rm --cached sensitive-file.csv

# 2. 添加到 .gitignore
echo "sensitive-file.csv" >> .gitignore

# 3. 提交移除记录
git commit -m "🔒 Remove sensitive file"
git push origin main
```

---

### 问题 4: 想撤销最后一次提交

**场景 1: 只是想修改提交信息 (未推送)**
```bash
git commit --amend -m "新的提交信息"
```

**场景 2: 完全撤销提交 (未推送)**
```bash
# 撤销提交,保留文件变更
git reset --soft HEAD~1

# 撤销提交,丢弃文件变更
git reset --hard HEAD~1
```

**场景 3: 已经推送了**
```bash
# 创建一个反向提交
git revert HEAD
git push origin main
```

---

## 🎯 快速参考

### 日常操作

```bash
# 📊 查看状态
git status

# ➕ 添加所有变更
git add .

# 💾 创建提交
git commit -m "提交信息"

# 🚀 推送
git push origin main

# 🔄 拉取更新
git pull origin main

# 📜 查看历史
git log --oneline -10
```

### 使用同步脚本

```bash
# 交互式 (详细)
./sync-to-github.sh

# 快速 (自动)
./quick-sync.sh
```

---

## 📞 获取帮助

**如果遇到问题:**

1. 查看 Git 状态: `git status`
2. 查看最近提交: `git log --oneline -5`
3. 查看远程状态: `git remote -v`
4. 参考本文档的常见问题部分

**需要回滚到之前的版本:**

```bash
# 查看所有提交
git log --oneline

# 回滚到特定提交 (保留工作区)
git reset --soft <commit-hash>

# 回滚到特定提交 (丢弃所有变更)
git reset --hard <commit-hash>

# 推送 (需要 force)
git push origin main --force
```

---

**最后更新:** 2025-11-05
**维护者:** CharliephilMrlong

🔗 **仓库地址:** https://github.com/mrlong0129/operation-multiagent
