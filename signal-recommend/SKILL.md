---
name: signal-recommend
description: |
  Bilingual AI builder signal recommendations for cold-start protocol.
  Fetches fresh signals from follow-builders, remixes into bilingual (English + Traditional Cantonese)
  digest with interleaved paragraphs. Use when the user asks for signal recommendations,
  "signal", "recommend signal", "有咩 signal", "推薦 signal", or as part of the
  good-morning cold-start flow.
allowed-tools:
  - Bash
  - Read
  - AskUserQuestion
---

# Signal Recommend — Bilingual AI Builder Digest

You fetch and present AI builder signals in bilingual format (English + Traditional Cantonese, interleaved paragraph by paragraph) for the user's cold-start protocol.

You are NOT a summarizer. You are a remix engine. Follow the prompts bundled in the data to produce sharp, scannable output.

---

## Workflow

### Step 1 — Fetch Data

Run the prepare script from the follow-builders skill:

```bash
cd /Users/troia/.claude/skills/follow-builders/scripts && node prepare-digest.js 2>/dev/null
```

This outputs a single JSON blob with everything you need: config, x (tweets), podcasts, blogs, stats, and prompts.

If the script fails entirely (no JSON output), tell the user to check their internet connection.

### Step 2 — Check Content

Read `stats` from the JSON:

- If `stats.xBuilders` is 0 AND `stats.podcastEpisodes` is 0 AND `stats.blogPosts` is 0, tell the user: "No new updates from your builders today. Check back tomorrow!" Then stop.

### Step 3 — Remix Tweets

Process the `x` array. For each builder:

1. Use their `bio` field for their role (e.g. bio says "ceo @box" -> "Box CEO Aaron Levie")
2. Summarize their `tweets` following the rules in `prompts.summarize_tweets` from the JSON
3. Every tweet MUST include its `url` from the JSON
4. Write 2-4 sentences per builder
5. Skip mundane tweets (retweets without commentary, "great event!" posts, engagement bait)
6. If they made a bold prediction or shared a contrarian take, lead with that
7. Use full name + role/company, NEVER use @ handles (breaks Telegram)

### Step 4 — Remix Podcasts

Process the `podcasts` array (max 1 episode). If present:

1. Summarize the `transcript` following `prompts.summarize_podcast` from the JSON
2. Use `name`, `title`, and `url` from the JSON object, NOT from the transcript
3. 200-400 words
4. Start with a one-sentence "The Takeaway"
5. Include at least one direct quote from the source
6. Stand alone as a complete piece (no "in this interview" or "the host asks")

### Step 5 — Remix Blogs

Process the `blogs` array. If present:

1. Summarize each blog following `prompts.summarize_blogs` from the JSON
2. 100-300 words per post
3. Lead with the core announcement or insight
4. Include at least one direct quote
5. Call out practical implications

### Step 6 — Assemble Digest

Follow `prompts.digest_intro` from the JSON:

1. Start with header: "AI Builders Digest — [today's date]"
2. Section order: X/Twitter, Official Blogs, Podcasts
3. Only include sources that have new content
4. Every single piece of content MUST have its original source URL
5. No @ handles anywhere in the output
6. End with: "Generated through the Follow Builders skill: https://github.com/zarazhangrui/follow-builders"

### Step 7 — Apply Bilingual Format

Follow `prompts.translate` from the JSON:

1. For each builder's summary: write the English version, then the Cantonese translation directly below (separated by a blank line), then move to the next builder
2. Same for podcasts and blogs: English first, then Cantonese directly below
3. Interleave paragraph by paragraph. Do NOT output all English first then all Cantonese
4. Keep technical terms in English: AI, LLM, GPU, API, fine-tuning, RAG, token, prompt, agent, transformer, etc.
5. Keep all proper nouns in English: names of people, companies, products, tools
6. Keep all URLs unchanged
7. The Cantonese version must use Traditional Chinese characters (繁體字) and Cantonese spoken style (廣東話口語)
8. Tone: professional but conversational, 好似一個識行嘅 friend 喺度同你傾計
9. Never use em-dashes

---

## Output Format

```
AI Builders Digest — [Date]

---

## X / TWITTER

---

**[Full Name + Role/Company]** ([handle] on X)

[English summary, 2-4 sentences]

[Tweet URL]

[Cantonese translation of the above summary]

[Tweet URL repeated]

---

[Repeat for each builder]

---

## PODCASTS (if any)

---

**[Podcast Name] — [Episode Title]**

[Video URL]

**The Takeaway:** [English one-liner]

[English remix, 200-400 words]

[Video URL repeated]

**核心洞察：** [Cantonese one-liner]

[Cantonese translation of the remix]

[Video URL repeated]

---

## OFFICIAL BLOGS (if any)

---

**[Blog Name] — [Article Title]**

[Article URL]

[English summary, 100-300 words]

[Article URL repeated]

[Cantonese translation]

[Article URL repeated]

---

Generated through the Follow Builders skill: https://github.com/zarazhangrui/follow-builders
```

---

## Data Source
- Signals fetched by `/follow-builders` feed this skill's digest output

## Integration with Cold-Start

When called from the good-morning skill:

1. Present the full bilingual digest
2. After the digest, ask: "邊個 signal 最 interesting？"
3. Wait for user to pick one before proceeding to Question Generation

---

## Hard Rules

1. NEVER invent or fabricate content. Only use what's in the JSON.
2. Every piece of content MUST have a URL. No URL = do not include.
3. NEVER use @ handles in the output (breaks Telegram delivery).
4. NEVER visit x.com, search the web, or call any API beyond the prepare script.
5. Do NOT guess job titles. Use the `bio` field or just the person's name.
6. If there's nothing substantive to report for a builder, skip them entirely.
7. Always interleave English and Cantonese. Never output all of one language first.

---

## Good Output Examples

### Example 1: X/Twitter + Blog digest (typical day)

```
AI Builders Digest — 2026-06-07

---

## X / TWITTER

---

**Box CEO Aaron Levie** (@levie on X)

Levie argues that the real moat in enterprise AI isn't the model -- it's the
workflow integration. He points out that companies switching from GPT-4 to Claude
mid-deployment saw zero user complaints, proving the model layer is commoditizing.
The value is moving up-stack to orchestration and domain-specific agents.

https://x.com/levie/status/1234567890

Box CEO Aaron Levie 話，企業 AI 嘅真正護城河唔係模型本身，而係 workflow 整合。
佢指出有公司喺部署中途由 GPT-4 轉用 Claude，用戶完全冇投訴，證明模型層已經
商品化。真正嘅價值係向上移，去到 orchestration 同 domain-specific agents。

https://x.com/levie/status/1234567890

---

**Anthropic Co-founder Daniela Amodei** (@DanielaAmodei on X)

Amodei shared a thread on Anthropic's new "Constitutional AI 2.0" approach,
replacing static principles with dynamic preference learning. The key insight:
instead of writing rules that say "don't do X," train the model to infer user
intent from context. This reduces refusal rates by 40% on ambiguous prompts.

https://x.com/DanielaAmodei/status/0987654321

Anthropic 聯合創辦人 Daniela Amodei 分享咗關於 "Constitutional AI 2.0" 嘅新方向，
用動態 preference learning 取代靜態規則。核心洞察：唔係寫規則話「唔好做 X」，
而係訓練模型從 context 推斷用戶意圖。呢個方法令 ambiguous prompts 嘅 refusal rate
降低咗 40%。

https://x.com/DanielaAmodei/status/0987654321

---

## OFFICIAL BLOGS

---

**Anthropic Blog — Rethinking RLHF: From Reward Models to Direct Preference**

https://www.anthropic.com/research/rethinking-rlhf

Anthropic published a detailed technical post on their shift away from traditional
RLHF reward models toward direct preference optimization. The core argument:
reward models introduce a "translation layer" between human intent and model behavior
that amplifies noise. Direct preference methods skip this layer, resulting in 15%
better alignment scores on their internal benchmarks. The post includes ablation
studies showing the improvement is most pronounced in ambiguous edge cases -- exactly
where reward models struggle most.

For practitioners, the practical takeaway is: if you're fine-tuning with RLHF and
getting inconsistent results on nuanced prompts, the bottleneck may be your reward
model, not your base model.

https://www.anthropic.com/research/rethinking-rlhf

Anthropic 發表咗一篇技術文章，講佢哋點樣由傳統 RLHF reward model 轉向
direct preference optimization。核心論點：reward model 喺人類意圖同行為之間
加咗一層「翻譯層」，反而放大 noise。Direct preference 方法 skip 呢層，
喺佢哋內部 benchmark 上面 alignment score 高咗 15%。文章有 ablation studies，
顯示最大改善出現喺 ambiguous edge cases — 正正係 reward model 最弱嘅地方。

對於 practitioners 嚟講，實際 takeaway 係：如果你用 RLHF fine-tune 但喺
nuanced prompts 上面結果唔穩定，bottleneck 可能係你嘅 reward model，唔係 base model。

https://www.anthropic.com/research/rethinking-rlhf

---

Generated through the Follow Builders skill: https://github.com/zarazhangrui/follow-builders
```

---

### Example 2: Podcast-only day (no tweets, no blogs)

```
AI Builders Digest — 2026-06-05

---

## PODCASTS

---

**Latent Space — Why Every Company Will Need an Agent Infrastructure Team**

https://www.youtube.com/watch?v=abc123

**The Takeaway:** Agent infrastructure will become as essential as DevOps -- companies
that don't build it now will be playing catch-up in 18 months.

The conversation centers on a provocative thesis: we're at the "pre-Kubernetes" stage
of agent deployment. Just as containerization forced every company to build DevOps teams,
the proliferation of AI agents will force a new discipline -- agent infrastructure.

The guest, a VP of Engineering at a Fortune 500 company, describes their current pain:
"We have 12 different teams building agents with 12 different frameworks. Nobody knows
which agents are running in production, which ones have access to sensitive data, or
how to roll back when something goes wrong."

The proposed solution is an "Agent Control Plane" -- a unified layer that handles
authentication, observability, versioning, and rollback for all agents. The hosts
compare this to what Terraform did for infrastructure-as-code: abstract away the
complexity so individual teams can move fast without breaking things.

The most actionable insight: start with observability. You can't manage what you
can't see. Even a simple dashboard showing "which agents are running, what data
they access, and what they did today" puts you ahead of 90% of companies.

https://www.youtube.com/watch?v=abc123

**核心洞察：** Agent infrastructure 會變得同 DevOps 一樣必須 — 而家唔 build，
18 個月後就要追。

呢集講一個好 provocative 嘅 thesis：我哋依家處於 agent deployment 嘅
"pre-Kubernetes" 階段。好似 containerization 迫每間公司都要 build DevOps team 咁，
AI agents 嘅 proliferation 都會催生一個新 discipline — agent infrastructure。

個 guest，Fortune 500 公司嘅 VP of Engineering，講佢哋依家嘅痛點：
「我哋有 12 個 team 用 12 個唔同 framework build agents。冇人知邊啲 agents
喺 production 跑緊，邊啲有權 access sensitive data，或者出事點 rollback。」

佢哋提出嘅 solution 係 "Agent Control Plane" — 一個統一層處理 authentication、
observability、versioning 同 rollback。Hosts 將呢個類比做 Terraform 對
infrastructure-as-code 做嘅嘢：abstract away complexity，令個別 team 可以 fast move
而唔會 break 嘢。

最 actionable 嘅 insight：由 observibility 開始。你 manage 唔到你睇唔到嘅嘢。
就算只係一個簡單 dashboard 顯示「邊啲 agents 跑緊、access 咗咩 data、今日做咗咩」，
你已經行先 90% 嘅公司。

https://www.youtube.com/watch?v=abc123

---

Generated through the Follow Builders skill: https://github.com/zarazhangrui/follow-builders
```

---

### Example 3: No content available (edge case)

```
No new updates from your builders today. Check back tomorrow!
```
