#!/bin/bash

# Multi-Agent 系统 GitHub 同步脚本
# 每次更新都会清楚显示所有变更

echo "================================"
echo "🔄 Multi-Agent 系统 GitHub 同步"
echo "================================"
echo ""

# 进入项目目录
cd "/Users/charliephil/Desktop/广告监测 agent/运营 multi agent"

# 显示当前状态
echo "📊 检查变更文件..."
git status --short

echo ""
echo "📝 变更文件统计:"
echo "   新增文件: $(git status --short | grep '^A' | wc -l | tr -d ' ')"
echo "   修改文件: $(git status --short | grep '^ M' | wc -l | tr -d ' ')"
echo "   删除文件: $(git status --short | grep '^D' | wc -l | tr -d ' ')"
echo "   未跟踪: $(git status --short | grep '^??' | wc -l | tr -d ' ')"

echo ""
echo "📋 详细变更列表:"
git status --short | while read line; do
    echo "   $line"
done

echo ""
read -p "❓ 是否继续提交并推送? (y/n) " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]
then
    # 要求输入提交信息
    echo ""
    echo "请输入本次更新的主要内容 (简短描述):"
    read commit_title

    echo ""
    echo "请输入详细说明 (可选,直接回车跳过):"
    read commit_details

    # 添加所有变更
    git add .

    # 构建提交信息
    commit_message="📝 $commit_title"

    if [ ! -z "$commit_details" ]; then
        commit_message="$commit_message

$commit_details

---

🤖 Generated with Claude Code
Co-Authored-By: Claude <noreply@anthropic.com>"
    else
        commit_message="$commit_message

---

🤖 Generated with Claude Code
Co-Authored-By: Claude <noreply@anthropic.com>"
    fi

    # 提交
    echo ""
    echo "💾 创建提交..."
    git commit -m "$commit_message"

    # 推送
    echo ""
    echo "🚀 推送到 GitHub..."
    git push origin main

    echo ""
    echo "✅ 同步完成!"
    echo ""
    echo "🔗 查看仓库: https://github.com/mrlong0129/operation-multiagent"
else
    echo ""
    echo "❌ 取消同步"
fi

echo ""
echo "================================"
