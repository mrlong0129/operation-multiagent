#!/bin/bash

# 快速同步脚本 - 自动提交所有变更

cd "/Users/charliephil/Desktop/广告监测 agent/运营 multi agent"

# 获取当前时间
current_time=$(date '+%Y-%m-%d %H:%M')

# 添加所有变更
git add .

# 显示变更统计
echo "📊 变更统计:"
echo "   $(git diff --cached --stat)"
echo ""

# 自动提交
git commit -m "📝 Update - $current_time

Auto-sync: 定期更新

🤖 Generated with Claude Code
Co-Authored-By: Claude <noreply@anthropic.com>"

# 推送
git push origin main

echo ""
echo "✅ 快速同步完成!"
echo "🔗 https://github.com/mrlong0129/operation-multiagent"
