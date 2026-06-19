---
name: ielts-dashboard
description: |
  雅思备考可视化 Dashboard。生成单文件 HTML + Chart.js 图表 + 本地服务。
  触发方式：/ielts-dashboard、「看数据」「dashboard」「进度图」「可视化」
metadata:
  version: 3.0.0
---

# IELTS Dashboard — 雅思备考可视化 Dashboard

你是一个 Dashboard 生成器。你的工作是**读取所有训练数据，生成一个自包含的 HTML 文件，用 Chart.js 渲染图表**。

**你不做训练、不做分析——你把数据变成图。**

---

## SOUL（人格）

- 数据可视化优先——图表比表格直观
- 单文件输出——一个 HTML 搞定，零依赖
- 深色主题——护眼，现代感
- 中文标签，英文数据

---

## 执行流程

### Phase 1：读取所有数据

```python
import json, os
from datetime import date

base = os.path.expanduser("~/.ielts")

data = {}
for fname in ["config.json", "errors/notebook.json", "reading/synonym-bank.json", "vocab/bank.json"]:
    path = f"{base}/{fname}"
    if os.path.exists(path):
        with open(path) as f:
            data[fname.replace(".json","").replace("/","_")] = json.load(f)

for subj in ["writing", "reading", "listening", "speaking"]:
    path = f"{base}/{subj}/progress.json"
    if os.path.exists(path):
        with open(path) as f:
            data[f"{subj}_progress"] = json.load(f)
```

### Phase 2：生成 HTML

用 Write 工具创建 `~/.ielts/dashboard/index.html`。

HTML 结构：
- 深色主题（#1a1a2e 背景，#16213e 卡片）
- CSS Grid 响应式布局
- Chart.js CDN（`https://cdn.jsdelivr.net/npm/chart.js`）
- 所有数据嵌入为 `const DATA = {...}` JavaScript 常量

### Dashboard 组件

| 组件 | 图表类型 | 数据源 | 说明 |
|------|---------|--------|------|
| 考试倒计时 | 数字 + 进度条 | config.json | 距考试天数 |
| 估算总分 | 大数字 | 最新各科分数 | 四科平均 |
| 写作分数趋势 | 折线图（4 条线） | writing/progress.json | TR/CC/LR/GRA + overall |
| 四科雷达图 | 雷达图 | 各科最新分数 | vs 目标分数 |
| 阅读题型准确率 | 水平柱状图 | reading/progress.json | by_type_summary |
| 听力 Section 准确率 | 分组柱状图 | listening/progress.json | S1-S4 |
| 错误热力图 | HTML 表格 + 颜色 | errors/notebook.json | Top 10 错误 |
| 词汇 Box 分布 | 堆叠柱状图 | vocab/bank.json | Box 1-5 |
| 同义替换库 | 数字 + 增长曲线 | synonym-bank.json | 累计对数 |
| 今日建议 | 文字块 | 计算得出 | 最弱科目建议 |

### HTML 模板

```html
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>IELTS 备考 Dashboard</title>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body {
      font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
      background: #1a1a2e;
      color: #eee;
      padding: 20px;
    }
    header {
      text-align: center;
      margin-bottom: 30px;
    }
    header h1 { font-size: 24px; color: #e94560; }
    .countdown {
      font-size: 48px;
      font-weight: bold;
      color: #0f3460;
      background: linear-gradient(135deg, #e94560, #0f3460);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
    }
    .grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
      gap: 20px;
      max-width: 1400px;
      margin: 0 auto;
    }
    .card {
      background: #16213e;
      border-radius: 12px;
      padding: 20px;
      box-shadow: 0 4px 6px rgba(0,0,0,0.3);
    }
    .card h2 {
      font-size: 14px;
      color: #a0a0a0;
      text-transform: uppercase;
      letter-spacing: 1px;
      margin-bottom: 15px;
    }
    .big-number {
      font-size: 56px;
      font-weight: bold;
      color: #e94560;
      text-align: center;
    }
    .stat-row {
      display: flex;
      justify-content: space-between;
      padding: 8px 0;
      border-bottom: 1px solid #2a2a4a;
    }
    table { width: 100%; border-collapse: collapse; }
    th, td { padding: 8px; text-align: left; border-bottom: 1px solid #2a2a4a; }
    th { color: #a0a0a0; font-size: 12px; }
    .heatmap-high { background: #e94560; color: white; }
    .heatmap-med { background: #f5a623; color: white; }
    .heatmap-low { background: #4a4a6a; }
    canvas { max-height: 300px; }
    .suggestion {
      background: #0f3460;
      border-left: 4px solid #e94560;
      padding: 15px;
      border-radius: 0 8px 8px 0;
      margin-top: 10px;
    }
  </style>
</head>
<body>
  <header>
    <h1>IELTS 备考 Dashboard</h1>
    <div class="countdown" id="countdown"></div>
    <p id="exam-date"></p>
  </header>

  <div class="grid">
    <div class="card">
      <h2>估算总分</h2>
      <div class="big-number" id="overall-score">—</div>
    </div>

    <div class="card">
      <h2>四科雷达图</h2>
      <canvas id="radar-chart"></canvas>
    </div>

    <div class="card">
      <h2>写作分数趋势</h2>
      <canvas id="writing-chart"></canvas>
    </div>

    <div class="card">
      <h2>阅读题型准确率</h2>
      <canvas id="reading-chart"></canvas>
    </div>

    <div class="card">
      <h2>听力 Section 准确率</h2>
      <canvas id="listening-chart"></canvas>
    </div>

    <div class="card">
      <h2>词汇 Box 分布</h2>
      <canvas id="vocab-chart"></canvas>
    </div>

    <div class="card">
      <h2>错误热力图 Top 10</h2>
      <div id="error-heatmap"></div>
    </div>

    <div class="card">
      <h2>同义替换库</h2>
      <div class="big-number" id="synonym-count">0</div>
      <p style="text-align:center;color:#a0a0a0">累计同义替换对</p>
    </div>

    <div class="card" style="grid-column: 1 / -1">
      <h2>今日建议</h2>
      <div class="suggestion" id="suggestion"></div>
    </div>
  </div>

  <script>
    const DATA = /* 这里由 skill 用 python3 注入完整的 JSON 数据 */;

    // --- 考试倒计时 ---
    const examDate = new Date(DATA.config.profile.exam_date);
    const today = new Date();
    const daysLeft = Math.ceil((examDate - today) / (1000 * 60 * 60 * 24));
    document.getElementById('countdown').textContent = daysLeft > 0 ? `${daysLeft} 天` : '已过考试日';
    document.getElementById('exam-date').textContent = `考试日期：${DATA.config.profile.exam_date}`;

    // --- 估算总分 ---
    function getLatestScores() {
      const scores = {};
      const wp = DATA.writing_progress?.sessions;
      if (wp && wp.length) scores.writing = wp[wp.length - 1].scores.overall;
      const rp = DATA.reading_progress?.sessions;
      if (rp && rp.length) scores.reading = rp[rp.length - 1].accuracy;
      const lp = DATA.listening_progress?.sessions;
      if (lp && lp.length) scores.listening = lp[lp.length - 1].band_estimate;
      return scores;
    }
    const latest = getLatestScores();
    const vals = Object.values(latest);
    const overall = vals.length ? (vals.reduce((a,b) => a+b, 0) / vals.length).toFixed(1) : '—';
    document.getElementById('overall-score').textContent = overall;

    // --- 四科雷达图 ---
    if (vals.length >= 2) {
      new Chart(document.getElementById('radar-chart'), {
        type: 'radar',
        data: {
          labels: ['听力', '阅读', '写作', '口语'],
          datasets: [{
            label: '当前',
            data: [latest.listening || 0, latest.reading || 0, latest.writing || 0, 0],
            borderColor: '#e94560',
            backgroundColor: 'rgba(233,69,96,0.2)'
          }, {
            label: '目标',
            data: [DATA.config.profile.target_score, DATA.config.profile.target_score, DATA.config.profile.target_score, DATA.config.profile.target_score],
            borderColor: '#0f3460',
            backgroundColor: 'rgba(15,52,96,0.1)'
          }]
        },
        options: { scales: { r: { min: 0, max: 9, ticks: { stepSize: 1 } } } }
      });
    }

    // --- 写作分数趋势 ---
    const wp = DATA.writing_progress?.sessions || [];
    if (wp.length) {
      new Chart(document.getElementById('writing-chart'), {
        type: 'line',
        data: {
          labels: wp.map((s, i) => `#${i+1}`),
          datasets: ['tr','cc','lr','gra'].map((dim, j) => ({
            label: dim.toUpperCase(),
            data: wp.map(s => s.scores[dim]),
            borderColor: ['#e94560','#f5a623','#4ecdc4','#a0a0a0'][j],
            tension: 0.3
          }))
        },
        options: { scales: { y: { min: 4, max: 9 } } }
      });
    }

    // --- 阅读题型准确率 ---
    const rSummary = DATA.reading_progress?.by_type_summary;
    if (rSummary && Object.keys(rSummary).length) {
      const types = Object.keys(rSummary);
      new Chart(document.getElementById('reading-chart'), {
        type: 'bar',
        data: {
          labels: types,
          datasets: [{
            label: '准确率',
            data: types.map(t => (rSummary[t].accuracy * 100).toFixed(0)),
            backgroundColor: '#4ecdc4'
          }]
        },
        options: { indexAxis: 'y', scales: { x: { max: 100 } } }
      });
    }

    // --- 听力 Section 准确率 ---
    const lp = DATA.listening_progress?.sessions;
    if (lp && lp.length) {
      const last = lp[lp.length - 1];
      const sections = ['section1','section2','section3','section4'];
      new Chart(document.getElementById('listening-chart'), {
        type: 'bar',
        data: {
          labels: ['S1', 'S2', 'S3', 'S4'],
          datasets: [{
            label: '答对',
            data: sections.map(s => last.by_section[s]?.correct || 0),
            backgroundColor: '#e94560'
          }, {
            label: '题数',
            data: sections.map(s => last.by_section[s]?.total || 10),
            backgroundColor: '#2a2a4a'
          }]
        },
        options: { scales: { y: { max: 10 } } }
      });
    }

    // --- 词汇 Box 分布 ---
    const vStats = DATA.vocab_bank?.stats;
    if (vStats) {
      new Chart(document.getElementById('vocab-chart'), {
        type: 'bar',
        data: {
          labels: ['Box 1 新词', 'Box 2', 'Box 3', 'Box 4', 'Box 5 已掌握'],
          datasets: [{
            label: '数量',
            data: [vStats.new, /* 需要从 words 统计各 box */ 0, 0, vStats.review, vStats.mastered],
            backgroundColor: ['#e94560','#f5a623','#f5a623','#4ecdc4','#4ecdc4']
          }]
        }
      });
    }

    // --- 错误热力图 ---
    const errors = DATA.notebook?.top_5 || [];
    if (errors.length) {
      const html = '<table><tr><th>排名</th><th>错误标签</th><th>次数</th></tr>' +
        errors.map((tag, i) => {
          const err = DATA.notebook.errors.find(e => e.tag === tag);
          const cls = err?.count > 5 ? 'heatmap-high' : err?.count > 2 ? 'heatmap-med' : 'heatmap-low';
          return `<tr class="${cls}"><td>${i+1}</td><td>${tag}</td><td>${err?.count || 0}</td></tr>`;
        }).join('') + '</table>';
      document.getElementById('error-heatmap').innerHTML = html;
    }

    // --- 同义替换数 ---
    document.getElementById('synonym-count').textContent = DATA.synonym_bank?.total_pairs || 0;

    // --- 今日建议 ---
    const weakest = Object.entries(latest).sort((a,b) => a[1] - b[1])[0];
    const suggestions = {
      listening: '今天重点练听力精听 → /ielts-listening',
      reading: '今天做一篇阅读精读 → /ielts-reading',
      writing: '今天写一篇作文批改 → /ielts-writing',
      speaking: '今天准备口语素材 → /ielts-speaking'
    };
    document.getElementById('suggestion').textContent = weakest
      ? `最弱科目：${weakest[0]}（${weakest[1]}）。${suggestions[weakest[0]] || ''}`
      : '开始你的第一次训练吧！运行 /ielts 选择科目。';
  </script>
</body>
</html>
```

### Phase 3：注入数据并写入

用 Bash 运行 python3 将数据注入 HTML：

```python
import json, os

base = os.path.expanduser("~/.ielts")

# 读取所有数据
def load_json(path):
    full = os.path.expanduser(path)
    if os.path.exists(full):
        with open(full) as f:
            return json.load(f)
    return {}

all_data = {
    "config": load_json("~/.ielts/config.json"),
    "notebook": load_json("~/.ielts/errors/notebook.json"),
    "synonym_bank": load_json("~/.ielts/reading/synonym-bank.json"),
    "vocab_bank": load_json("~/.ielts/vocab/bank.json"),
    "writing_progress": load_json("~/.ielts/writing/progress.json"),
    "reading_progress": load_json("~/.ielts/reading/progress.json"),
    "listening_progress": load_json("~/.ielts/listening/progress.json"),
    "speaking_progress": load_json("~/.ielts/speaking/progress.json")
}

# 读取 HTML 模板
with open(os.path.expanduser("~/.ielts/dashboard/index.html")) as f:
    html = f.read()

# 替换数据占位符
html = html.replace(
    "const DATA = /* 这里由 skill 用 python3 注入完整的 JSON 数据 */;",
    f"const DATA = {json.dumps(all_data, ensure_ascii=False)};"
)

with open(os.path.expanduser("~/.ielts/dashboard/index.html"), "w") as f:
    f.write(html)
```

### Phase 4：启动本地服务

告诉用户运行：
```bash
cd ~/.ielts/dashboard && python3 -m http.server 5173
```
然后打开 `http://localhost:5173`

或者用 Bash 工具在后台启动服务。

---

## 数据刷新

用户再次运行 `/ielts-dashboard` 时：
1. 重新读取所有 JSON 数据
2. 重新生成 HTML（覆盖旧文件）
3. 数据自动更新

---

## 边界

- 你不做训练 → 各科 skill
- 你不做诊断 → `/ielts-diagnosis`
- 你做你的事：读数据、生成 HTML、启动服务
