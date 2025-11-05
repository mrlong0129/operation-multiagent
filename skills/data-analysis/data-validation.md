---
skill_id: data-analysis-data-validation
skill_name: PPC 数据质量验证技能
category: data-analysis
version: 1.0.0
created: 2025-11-05
updated: 2025-11-05
status: active

# 相关的最佳实践
best_practices:
  - best-practices/data-analysis/data-quality-checklist

# 相关的学习记录
learnings:
  - learnings/2025-11/2025-11-05-ppc-data-quality

# 依赖的其他 Skills
dependencies: []

# 输入输出定义
inputs:
  - data_files: CSV/Excel  # PPC 数据文件列表
  - expected_date_range: Object  # 预期的日期范围 {start, end}
outputs:
  - validation_report: Markdown  # 数据验证报告
  - cleaned_data: DataFrame  # 清洗后的数据
  - quality_score: Number  # 数据质量评分 (0-100)

# 标签
tags:
  - data-validation
  - data-quality
  - ppc-analysis
  - preprocessing
---

# PPC 数据质量验证技能

**在进行任何 PPC 分析之前,系统化地验证数据完整性、准确性和一致性的关键技能。**

---

## 📝 技能描述

这个技能提供了一套完整的 PPC 数据验证流程,确保分析基于高质量的数据。验证范围包括:
- 日期范围一致性检查
- 必需字段完整性验证
- 数据逻辑一致性检查 (clicks ≤ impressions, orders ≤ clicks)
- 异常值识别和处理
- 零数据和空值检测
- 数据类型验证

**核心价值:** 防止基于错误或不完整数据做出错误的优化决策,这可能导致广告预算浪费。

---

## 🎯 使用场景

### 适用情况

- **定期分析前** - 每次进行 PPC 分析之前的必需步骤
- **多数据源整合** - 合并 AI 和 Manual 广告数据时
- **数据导出后** - 从亚马逊广告平台导出数据后立即验证
- **异常发现** - 发现指标异常时,首先验证数据质量
- **自动化流程** - 集成到自动化分析流程的第一步

### 不适用情况

- **实时监控** - 实时数据流不需要完整验证
- **单一指标查询** - 只查看某一个简单指标时
- **样本数据探索** - 初步数据探索阶段

---

## 🔧 实现步骤

### 步骤 1: 数据加载和初步检查

**目的:** 成功加载数据并进行基础结构检查

**操作:**
```python
import pandas as pd
import numpy as np
from datetime import datetime

def load_and_inspect_data(filepath):
    """加载数据并进行初步检查"""
    # 支持 CSV 和 Excel 格式
    if filepath.endswith('.csv'):
        df = pd.read_csv(filepath, encoding='utf-8-sig')
    else:
        df = pd.read_excel(filepath)

    # 清理列名 (去除空格和引号)
    df.columns = df.columns.str.strip().str.replace('"', '')

    print(f"✅ 数据加载成功")
    print(f"   - 总行数: {len(df):,}")
    print(f"   - 总列数: {len(df.columns)}")
    print(f"   - 内存占用: {df.memory_usage(deep=True).sum() / 1024**2:.2f} MB")

    return df

# 使用示例
ai_data = load_and_inspect_data('ai_summary.csv')
manual_data = load_and_inspect_data('manual_summary.csv')
```

**输出:**
- 加载的 DataFrame
- 基础统计信息

**注意事项:**
- ⚠️ 注意中文编码问题,使用 `encoding='utf-8-sig'`
- ⚠️ 大文件 (>100MB) 考虑使用 chunked reading
- ⚠️ 检查文件路径是否正确

---

### 步骤 2: 日期范围一致性验证

**目的:** 确保对比数据的日期范围完全一致

**操作:**
```python
def validate_date_ranges(df1, df2, date_column='日期'):
    """验证两个数据集的日期范围是否一致"""
    # 转换日期列
    df1[date_column] = pd.to_datetime(df1[date_column])
    df2[date_column] = pd.to_datetime(df2[date_column])

    # 提取日期范围
    df1_start = df1[date_column].min()
    df1_end = df1[date_column].max()
    df1_days = len(df1[date_column].unique())

    df2_start = df2[date_column].min()
    df2_end = df2[date_column].max()
    df2_days = len(df2[date_column].unique())

    # 检查一致性
    is_consistent = (
        df1_start == df2_start and
        df1_end == df2_end and
        df1_days == df2_days
    )

    report = {
        'dataset1': {
            'start_date': df1_start,
            'end_date': df1_end,
            'unique_days': df1_days
        },
        'dataset2': {
            'start_date': df2_start,
            'end_date': df2_end,
            'unique_days': df2_days
        },
        'is_consistent': is_consistent
    }

    if is_consistent:
        print(f"✅ 日期范围一致")
        print(f"   - 起始日期: {df1_start.date()}")
        print(f"   - 结束日期: {df1_end.date()}")
        print(f"   - 天数: {df1_days} 天")
    else:
        print(f"⚠️  日期范围不一致!")
        print(f"   Dataset 1: {df1_start.date()} 到 {df1_end.date()} ({df1_days} 天)")
        print(f"   Dataset 2: {df2_start.date()} 到 {df2_end.date()} ({df2_days} 天)")

    return report

# 使用示例
date_validation = validate_date_ranges(ai_data, manual_data)
```

**输出:**
- 日期范围对比报告
- 一致性检查结果

**注意事项:**
- ⚠️ 如果日期范围不一致,必须过滤到相同范围或明确告知用户
- ⚠️ 检查是否有缺失的日期 (gaps)
- ⚠️ 注意时区问题

---

### 步骤 3: 必需字段完整性验证

**目的:** 确保所有必需的字段都存在且有数据

**操作:**
```python
def validate_required_fields(df, required_fields):
    """验证必需字段的存在性和完整性"""
    validation_results = {
        'missing_columns': [],
        'empty_columns': [],
        'partially_empty': {},
        'all_valid': True
    }

    for field in required_fields:
        # 检查列是否存在
        if field not in df.columns:
            validation_results['missing_columns'].append(field)
            validation_results['all_valid'] = False
            continue

        # 检查空值比例
        null_count = df[field].isna().sum()
        null_percentage = (null_count / len(df)) * 100

        if null_count == len(df):
            # 完全为空
            validation_results['empty_columns'].append(field)
            validation_results['all_valid'] = False
        elif null_count > 0:
            # 部分为空
            validation_results['partially_empty'][field] = {
                'null_count': null_count,
                'null_percentage': round(null_percentage, 2)
            }
            if null_percentage > 10:  # 超过10%空值视为有问题
                validation_results['all_valid'] = False

    # 打印报告
    if validation_results['all_valid']:
        print(f"✅ 所有必需字段验证通过")
    else:
        if validation_results['missing_columns']:
            print(f"❌ 缺失字段: {', '.join(validation_results['missing_columns'])}")
        if validation_results['empty_columns']:
            print(f"❌ 空字段: {', '.join(validation_results['empty_columns'])}")
        if validation_results['partially_empty']:
            print(f"⚠️  部分空值字段:")
            for field, stats in validation_results['partially_empty'].items():
                print(f"   - {field}: {stats['null_count']} 空值 ({stats['null_percentage']}%)")

    return validation_results

# PPC 数据必需字段
REQUIRED_FIELDS = [
    '日期', '曝光量', '点击', '花费', '销售额',
    '广告订单', 'CPC', 'ACoS'
]

# 使用示例
field_validation = validate_required_fields(ai_data, REQUIRED_FIELDS)
```

**输出:**
- 字段完整性报告
- 缺失/空值统计

**注意事项:**
- ⚠️ 不同报告类型的必需字段可能不同 (Summary vs Campaign vs Keyword)
- ⚠️ 某些字段允许为空 (如新广告活动可能没有转化数据)
- ✅ 对部分空值字段,记录但不阻断分析

---

### 步骤 4: 数据逻辑一致性验证

**目的:** 验证数据之间的逻辑关系是否正确

**操作:**
```python
def validate_data_logic(df):
    """验证数据的逻辑一致性"""
    errors = []
    warnings = []

    # 规则 1: Clicks ≤ Impressions
    if '点击' in df.columns and '曝光量' in df.columns:
        invalid_ctr = df[df['点击'] > df['曝光量']]
        if len(invalid_ctr) > 0:
            errors.append({
                'rule': 'Clicks ≤ Impressions',
                'violations': len(invalid_ctr),
                'rows': invalid_ctr.index.tolist()[:5]  # 只显示前5个
            })

    # 规则 2: Orders ≤ Clicks
    if '广告订单' in df.columns and '点击' in df.columns:
        invalid_cvr = df[df['广告订单'] > df['点击']]
        if len(invalid_cvr) > 0:
            errors.append({
                'rule': 'Orders ≤ Clicks',
                'violations': len(invalid_cvr),
                'rows': invalid_cvr.index.tolist()[:5]
            })

    # 规则 3: Spend ≥ 0
    if '花费' in df.columns:
        negative_spend = df[df['花费'] < 0]
        if len(negative_spend) > 0:
            errors.append({
                'rule': 'Spend ≥ 0',
                'violations': len(negative_spend),
                'rows': negative_spend.index.tolist()[:5]
            })

    # 规则 4: ACoS 计算验证 (允许小误差)
    if all(col in df.columns for col in ['花费', '销售额', 'ACoS']):
        df_with_sales = df[df['销售额'] > 0].copy()
        df_with_sales['calculated_acos'] = (df_with_sales['花费'] / df_with_sales['销售额'] * 100)

        # 清理 ACoS 值 (可能是字符串格式)
        def clean_acos(val):
            if pd.isna(val) or val == '' or val == '--':
                return 0
            if isinstance(val, str):
                val = val.replace('%', '').strip()
                if val == '有花费无销售额':
                    return 0
            return float(val)

        df_with_sales['ACoS'] = df_with_sales['ACoS'].apply(clean_acos)

        # 检查差异 (允许 5% 误差)
        df_with_sales['acos_diff'] = abs(df_with_sales['ACoS'] - df_with_sales['calculated_acos'])
        significant_diff = df_with_sales[df_with_sales['acos_diff'] > 5]

        if len(significant_diff) > 0:
            warnings.append({
                'rule': 'ACoS Calculation Accuracy',
                'violations': len(significant_diff),
                'message': f'{len(significant_diff)} rows have ACoS calculation discrepancy > 5%'
            })

    # 打印结果
    if len(errors) == 0 and len(warnings) == 0:
        print(f"✅ 数据逻辑一致性验证通过")
    else:
        if errors:
            print(f"❌ 发现 {len(errors)} 个逻辑错误:")
            for error in errors:
                print(f"   - {error['rule']}: {error['violations']} 个违规")
        if warnings:
            print(f"⚠️  发现 {len(warnings)} 个警告:")
            for warning in warnings:
                print(f"   - {warning['rule']}: {warning['message']}")

    return {'errors': errors, 'warnings': warnings}

# 使用示例
logic_validation = validate_data_logic(ai_data)
```

**输出:**
- 逻辑错误列表
- 警告列表

**注意事项:**
- ❌ 如果发现逻辑错误,应停止分析并报告
- ⚠️ 警告可以继续分析,但需要记录
- ✅ 对于计算型字段 (如 ACoS),允许小的四舍五入误差

---

### 步骤 5: 异常值检测

**目的:** 识别统计上的异常值,可能是数据错误或需要特别关注的情况

**操作:**
```python
def detect_outliers(df, columns, method='iqr', threshold=3):
    """检测异常值"""
    outliers_report = {}

    for col in columns:
        if col not in df.columns:
            continue

        # 确保是数值型
        df[col] = pd.to_numeric(df[col], errors='coerce')
        values = df[col].dropna()

        if len(values) == 0:
            continue

        if method == 'iqr':
            # IQR 方法
            Q1 = values.quantile(0.25)
            Q3 = values.quantile(0.75)
            IQR = Q3 - Q1
            lower_bound = Q1 - 1.5 * IQR
            upper_bound = Q3 + 1.5 * IQR

            outliers = df[(df[col] < lower_bound) | (df[col] > upper_bound)]

        elif method == 'zscore':
            # Z-score 方法
            mean = values.mean()
            std = values.std()
            z_scores = np.abs((df[col] - mean) / std)
            outliers = df[z_scores > threshold]

        if len(outliers) > 0:
            outliers_report[col] = {
                'count': len(outliers),
                'percentage': round(len(outliers) / len(df) * 100, 2),
                'examples': outliers[col].head(5).tolist()
            }

    # 打印报告
    if len(outliers_report) == 0:
        print(f"✅ 未检测到统计异常值")
    else:
        print(f"⚠️  检测到异常值:")
        for col, stats in outliers_report.items():
            print(f"   - {col}: {stats['count']} 个异常值 ({stats['percentage']}%)")
            print(f"     示例: {stats['examples']}")

    return outliers_report

# 使用示例
NUMERIC_COLUMNS = ['曝光量', '点击', '花费', '销售额', 'CPC']
outliers = detect_outliers(ai_data, NUMERIC_COLUMNS, method='iqr')
```

**输出:**
- 异常值统计报告
- 示例异常值

**注意事项:**
- ℹ️ 异常值不一定是错误,可能是真实的特殊情况 (如大促期间)
- ⚠️ 需要人工判断是保留还是排除异常值
- ✅ 记录所有异常值处理决策

---

### 步骤 6: 生成数据质量报告

**目的:** 生成完整的数据验证报告和质量评分

**操作:**
```python
def generate_quality_report(df, dataset_name,
                          date_validation,
                          field_validation,
                          logic_validation,
                          outliers_report):
    """生成完整的数据质量报告"""

    # 计算质量评分 (0-100)
    score = 100

    # 日期一致性 (20分)
    if not date_validation.get('is_consistent', True):
        score -= 20

    # 字段完整性 (30分)
    if not field_validation.get('all_valid', True):
        missing_penalty = len(field_validation.get('missing_columns', [])) * 10
        empty_penalty = len(field_validation.get('empty_columns', [])) * 10
        partial_penalty = len(field_validation.get('partially_empty', {})) * 5
        score -= min(30, missing_penalty + empty_penalty + partial_penalty)

    # 逻辑一致性 (30分)
    errors = logic_validation.get('errors', [])
    warnings = logic_validation.get('warnings', [])
    score -= len(errors) * 15
    score -= len(warnings) * 5
    score = max(0, score)  # 确保不低于0

    # 异常值 (20分) - 较宽松
    outlier_penalty = min(20, len(outliers_report) * 5)
    score -= outlier_penalty

    score = max(0, min(100, score))  # 确保在 0-100 范围内

    # 生成报告
    report = f"""
# 数据质量验证报告

## 数据集: {dataset_name}

### 总体质量评分: {score}/100

{"✅ 优秀" if score >= 90 else "⚠️ 良好" if score >= 70 else "❌ 需要改进"}

---

## 1. 日期范围验证

- 起始日期: {date_validation.get('dataset1', {}).get('start_date', 'N/A')}
- 结束日期: {date_validation.get('dataset1', {}).get('end_date', 'N/A')}
- 天数: {date_validation.get('dataset1', {}).get('unique_days', 'N/A')}
- 状态: {"✅ 通过" if date_validation.get('is_consistent', True) else "❌ 不一致"}

---

## 2. 字段完整性验证

- 缺失字段: {len(field_validation.get('missing_columns', []))} 个
- 空字段: {len(field_validation.get('empty_columns', []))} 个
- 部分空值字段: {len(field_validation.get('partially_empty', {}))} 个
- 状态: {"✅ 通过" if field_validation.get('all_valid', True) else "❌ 有问题"}

---

## 3. 逻辑一致性验证

- 逻辑错误: {len(errors)} 个
- 警告: {len(warnings)} 个
- 状态: {"✅ 通过" if len(errors) == 0 else "❌ 有错误"}

---

## 4. 异常值检测

- 检测字段数: {len(outliers_report)}
- 状态: {"✅ 无异常" if len(outliers_report) == 0 else "⚠️ 发现异常值"}

---

## 建议行动

"""

    if score >= 90:
        report += "- ✅ 数据质量优秀,可以直接进行分析\n"
    elif score >= 70:
        report += "- ⚠️ 数据质量良好,建议解决发现的问题后进行分析\n"
    else:
        report += "- ❌ 数据质量较差,强烈建议先清理数据\n"

    if not date_validation.get('is_consistent', True):
        report += "- 🔧 过滤数据到相同的日期范围\n"

    if len(errors) > 0:
        report += "- 🔧 修复逻辑错误后再进行分析\n"

    print(report)

    return {
        'score': score,
        'report': report,
        'recommendation': 'proceed' if score >= 90 else 'fix_issues' if score >= 70 else 'clean_data'
    }

# 使用示例
quality_report = generate_quality_report(
    ai_data,
    "AI Campaign Data",
    date_validation,
    field_validation,
    logic_validation,
    outliers
)
```

**输出:**
- 完整的 Markdown 格式质量报告
- 质量评分 (0-100)
- 行动建议

---

## ⭐ 最佳实践

### 关键原则

1. **验证先于分析** - 永远不要跳过数据验证步骤,即使时间紧迫
2. **自动化验证** - 将验证流程集成到自动化脚本中
3. **记录所有决策** - 记录为什么保留或排除某些数据
4. **分级严重性** - 区分错误 (阻断分析) 和警告 (记录但继续)

### 性能优化

- 对大数据集使用采样验证 (验证前1000行和后1000行)
- 缓存验证结果,避免重复验证
- 并行验证多个数据集

### 质量控制

- ✅ 质量评分 ≥ 90 才能直接用于重要决策
- ✅ 所有逻辑错误必须修复
- ✅ 保存验证报告到文件系统

---

## 📊 示例

### 示例 1: 完整验证流程

**输入:**
```python
ai_summary_path = 'ai_summary.csv'
manual_summary_path = 'manual_summary.csv'
```

**执行:**
```python
# 步骤 1: 加载数据
ai_data = load_and_inspect_data(ai_summary_path)
manual_data = load_and_inspect_data(manual_summary_path)

# 步骤 2: 日期验证
date_check = validate_date_ranges(ai_data, manual_data)

# 步骤 3: 字段验证
field_check_ai = validate_required_fields(ai_data, REQUIRED_FIELDS)
field_check_manual = validate_required_fields(manual_data, REQUIRED_FIELDS)

# 步骤 4: 逻辑验证
logic_check_ai = validate_data_logic(ai_data)
logic_check_manual = validate_data_logic(manual_data)

# 步骤 5: 异常值检测
outliers_ai = detect_outliers(ai_data, NUMERIC_COLUMNS)
outliers_manual = detect_outliers(manual_data, NUMERIC_COLUMNS)

# 步骤 6: 生成报告
report_ai = generate_quality_report(
    ai_data, "AI Campaigns",
    date_check, field_check_ai, logic_check_ai, outliers_ai
)
report_manual = generate_quality_report(
    manual_data, "Manual Campaigns",
    date_check, field_check_manual, logic_check_manual, outliers_manual
)

# 决策
if report_ai['score'] >= 90 and report_manual['score'] >= 90:
    print("✅ 数据验证通过,开始分析")
else:
    print("⚠️ 数据质量问题,建议先清理")
```

**输出:**
```
✅ 数据加载成功
   - 总行数: 31
   - 总列数: 15
   - 内存占用: 0.12 MB

✅ 日期范围一致
   - 起始日期: 2025-10-01
   - 结束日期: 2025-10-31
   - 天数: 31 天

✅ 所有必需字段验证通过
✅ 数据逻辑一致性验证通过
✅ 未检测到统计异常值

数据质量评分: 100/100 ✅ 优秀
建议: 可以直接进行分析
```

---

## ⚠️ 常见问题

### 问题 1: AI 和 Manual 数据日期范围不一致

**症状:** AI 广告从10月9日才开始,但 Manual 从10月1日就有数据

**原因:** AI 广告是后期启动的

**解决方案:**
```python
# 方案 1: 过滤到相同日期范围
common_start = max(ai_data['日期'].min(), manual_data['日期'].min())
common_end = min(ai_data['日期'].max(), manual_data['日期'].max())

ai_filtered = ai_data[
    (ai_data['日期'] >= common_start) &
    (ai_data['日期'] <= common_end)
]
manual_filtered = manual_data[
    (manual_data['日期'] >= common_start) &
    (manual_data['日期'] <= common_end)
]

# 方案 2: 明确告知用户并使用全部数据
print(f"⚠️ 注意: AI 数据范围 ({ai_data['日期'].min()} 到 {ai_data['日期'].max()}) "
      f"与 Manual 数据范围 ({manual_data['日期'].min()} 到 {manual_data['日期'].max()}) 不一致")
```

---

### 问题 2: Clicks > Impressions 的逻辑错误

**症状:** 发现某些行的点击数大于曝光数

**原因:** 数据导出错误或平台统计bug

**解决方案:**
```python
# 识别问题行
invalid_rows = df[df['点击'] > df['曝光量']]

# 方案 1: 排除这些行
df_clean = df[df['点击'] <= df['曝光量']]
print(f"排除了 {len(invalid_rows)} 个逻辑错误行")

# 方案 2: 修正 (假设曝光量应该等于点击数)
df.loc[df['点击'] > df['曝光量'], '曝光量'] = df.loc[df['点击'] > df['曝光量'], '点击']

# 记录决策
with open('data_cleaning_log.txt', 'a') as f:
    f.write(f"{datetime.now()}: 修正了 {len(invalid_rows)} 行的 Clicks > Impressions 问题\n")
```

---

### 问题 3: 大量空值或零值

**症状:** 某些天的所有指标都是0

**原因:** 可能是广告暂停、预算用完、或周末无数据

**解决方案:**
```python
# 识别零数据日
zero_days = df[
    (df['曝光量'] == 0) &
    (df['点击'] == 0) &
    (df['花费'] == 0)
]

print(f"发现 {len(zero_days)} 天零数据:")
print(zero_days['日期'].tolist())

# 决策: 是否排除零数据日
if len(zero_days) / len(df) < 0.1:  # 少于10%
    # 保留,但在分析中标注
    df['is_zero_day'] = (
        (df['曝光量'] == 0) &
        (df['点击'] == 0) &
        (df['花费'] == 0)
    )
else:
    # 排除或进一步调查
    print("⚠️ 零数据日超过10%,建议调查原因")
```

---

## 🔗 相关资源

### 相关 Skills

- [ppc-optimization](../amazon/advertising/ppc-optimization.md) - 在分析前使用此 skill 验证数据
- [data-cleaning](./data-cleaning.md) - 数据清洗技能
- [data-transformation](./data-transformation.md) - 数据转换技能

### 相关 Agents

- [ad-analyzer](../../agents/ad-analyzer/agent.md) - 使用此 skill 验证输入数据
- [data-analyst](../../agents/data-analyst/agent.md) - 专门的数据分析 agent

### 外部文档

- [Pandas Data Validation](https://pandas.pydata.org/docs/) - Pandas 官方文档
- [Amazon Advertising API](https://advertising.amazon.com/API/docs) - 了解数据字段定义

---

## 📈 改进历史

### v1.0.0 (2025-11-05)

- 初始版本发布
- 核心功能: 6步完整验证流程
- 基于实际 PPC 数据验证经验提炼
- 包含质量评分系统 (0-100)
- 提供完整的 Python 代码实现

---

**维护者:** CharliephilMrlong
**最后更新:** 2025-11-05
**状态:** ✅ Active
**使用频率:** Critical (每次 PPC 分析的必需前置步骤)
