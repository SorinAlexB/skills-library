# Skills Library

A curated, self-updating collection of [Agent Skills](https://agentskills.io) — structured knowledge packs that give AI coding agents expert-level capabilities on demand. Works with Claude Code, Cursor, GitHub Copilot, Gemini CLI, OpenCode, and any [agentskills.io-compatible](https://agentskills.io/clients) agent. Includes local inference support via Ollama.

---

## What Are Agent Skills?

Agent Skills are an open standard (originally developed by Anthropic) for packaging specialized knowledge into portable, version-controlled folders. Each skill is a directory containing a `SKILL.md` file with metadata and step-by-step instructions.

```
my-skill/
├── SKILL.md        # Required: name, description, workflow
├── scripts/        # Optional: executable helpers
├── references/     # Optional: standards, procedures
└── assets/         # Optional: templates, checklists
```

Agents use **progressive disclosure** so skills don't bloat the context window:

1. **Discovery** — agent loads only `name` + `description` (~30 tokens per skill) at startup
2. **Activation** — when a task matches, the full `SKILL.md` is read into context
3. **Execution** — agent follows the workflow, optionally running bundled scripts

---

## Skills Catalog

| Skill Pack | Domain | Skills | Format | Source |
|---|---|---|---|---|
| **Anthropic Cybersecurity Skills** | Cloud Security | 60 | agentskills.io | [mukul975/Anthropic-Cybersecurity-Skills](https://github.com/mukul975/Anthropic-Cybersecurity-Skills) |
| | Threat Hunting | 55 | agentskills.io | ↑ |
| | Threat Intelligence | 50 | agentskills.io | ↑ |
| | Web Application Security | 42 | agentskills.io | ↑ |
| | Network Security | 40 | agentskills.io | ↑ |
| | Malware Analysis | 39 | agentskills.io | ↑ |
| | Digital Forensics | 37 | agentskills.io | ↑ |
| | Security Operations | 36 | agentskills.io | ↑ |
| | Identity & Access Management | 35 | agentskills.io | ↑ |
| | SOC Operations | 33 | agentskills.io | ↑ |
| | Container Security | 30 | agentskills.io | ↑ |
| | OT/ICS Security | 28 | agentskills.io | ↑ |
| | API Security | 28 | agentskills.io | ↑ |
| | Vulnerability Management | 25 | agentskills.io | ↑ |
| | Incident Response | 25 | agentskills.io | ↑ |
| | Red Teaming | 24 | agentskills.io | ↑ |
| | Penetration Testing | 23 | agentskills.io | ↑ |
| | Endpoint Security | 17 | agentskills.io | ↑ |
| | DevSecOps | 17 | agentskills.io | ↑ |
| | Phishing Defense | 16 | agentskills.io | ↑ |
| | Cryptography | 14 | agentskills.io | ↑ |
| | Zero Trust Architecture | 13 | agentskills.io | ↑ |
| | Mobile Security | 12 | agentskills.io | ↑ |
| | Ransomware Defense | 7 | agentskills.io | ↑ |
| | Compliance & Governance | 5 | agentskills.io | ↑ |
| | Deception Technology | 2 | agentskills.io | ↑ |
| **Understand Anything** | `/understand` — analyze codebase into knowledge graph | — | Claude Code Plugin | [Lum1104/Understand-Anything](https://github.com/Lum1104/Understand-Anything) |
| | `/understand-dashboard` — interactive graph explorer | — | Claude Code Plugin | ↑ |
| | `/understand-chat` — conversational codebase Q&A | — | Claude Code Plugin | ↑ |
| | `/understand-diff` — analyze impact of code changes | — | Claude Code Plugin | ↑ |
| | `/understand-explain` — deep-dive file/function analysis | — | Claude Code Plugin | ↑ |
| | `/understand-onboard` — generate team onboarding guide | — | Claude Code Plugin | ↑ |
| | `/understand-domain` — extract business domains & flows | — | Claude Code Plugin | ↑ |
| | `/understand-knowledge` — parse wiki knowledge bases | — | Claude Code Plugin | ↑ |

**Total: 754 cybersecurity skills + 8 codebase intelligence commands**

Mapped across: MITRE ATT&CK · NIST CSF 2.0 · MITRE ATLAS · MITRE D3FEND · NIST AI RMF

---

## Quick Start

### Clone

```bash
git clone --recurse-submodules https://github.com/sorinbirchi/skills-library.git
cd skills-library
```

If you already cloned without `--recurse-submodules`:

```bash
git submodule update --init --recursive
```

### Keep Skills Up to Date

```bash
git submodule update --remote --merge
```

---

## Usage

### Claude Code

**Cybersecurity Skills** follow the agentskills.io standard, which Claude Code natively supports.

Point Claude Code at the skills directory by adding this to your project's `CLAUDE.md` or your global `~/.claude/CLAUDE.md`:

```markdown
## Agent Skills

Skills are available in `<path-to-skills-library>/sources/cybersecurity-skills/skills/`.
Load relevant skills when working on security tasks.
```

Or use the Claude Code settings to set the skills path:

1. Open Claude Code settings (`/config`)
2. Set `skillsDirectory` to `<absolute-path>/sources/cybersecurity-skills/skills`

**Understand Anything** is a Claude Code plugin installed via the marketplace:

```
/plugin install Lum1104/Understand-Anything
```

Once installed, use `/understand` to analyze any codebase.

---

### Cursor / GitHub Copilot / VS Code / Gemini CLI

All agentskills.io-compatible agents discover skills from a configured directory. Point your agent's skills path at:

```
<path-to-skills-library>/sources/cybersecurity-skills/skills
```

| Agent | Skills Setting | Docs |
|---|---|---|
| Cursor | `Cursor Settings > Features > Agent Skills` | [docs](https://cursor.com/docs/context/skills) |
| GitHub Copilot | `.copilot/skills/` in repo root | [docs](https://docs.github.com/en/copilot/concepts/agents/about-agent-skills) |
| Gemini CLI | `gemini skills add <path>` | [docs](https://geminicli.com/docs/cli/skills/) |
| OpenCode | `opencode config skills <path>` | [docs](https://opencode.ai/docs/skills/) |
| Goose | `goose configure > skills` | [docs](https://block.github.io/goose/docs/guides/context-engineering/using-skills/) |

---

### Local Inference (Ollama)

Skills are plain markdown files — any agent that can read files can use them. Two recommended open-source agents that support both Ollama and agentskills.io:

#### Option 1: OpenCode + Ollama

[OpenCode](https://opencode.ai) is an open-source terminal agent with native agentskills.io support.

```bash
# Install OpenCode
npm install -g opencode-ai

# Configure Ollama as provider
opencode config set provider ollama
opencode config set model <your-model>  # e.g. llama3.3, qwen2.5-coder

# Register the skills directory
opencode config skills /path/to/skills-library/sources/cybersecurity-skills/skills

# Start a session
opencode
```

#### Option 2: Goose + Ollama

[Goose](https://block.github.io/goose) is an open-source agent by Block with skills and Ollama support.

```bash
# Install Goose
pipx install goose-ai

# Set Ollama as provider in ~/.config/goose/config.yaml
# provider: ollama
# model: <your-model>

# Add skills directory
goose configure
# Select: Context Engineering > Skills > Add directory
# Path: /path/to/skills-library/sources/cybersecurity-skills/skills

goose session start
```

Skills load progressively — even smaller Ollama models (7B–13B) handle them well since only relevant skills are loaded per task.

---

## Adding New Skills

See [CONTRIBUTING.md](./CONTRIBUTING.md) for the full guide. The short version:

```bash
# Add any public skills repo as a git submodule
./scripts/add-source.sh <github-url> <local-name>

# Example
./scripts/add-source.sh https://github.com/org/my-skills.git my-skills
```

Then open a PR updating the Skills Catalog table in this README.

---

## Structure

```
skills-library/
├── sources/
│   ├── cybersecurity-skills/    # git submodule — 754 cybersecurity skills
│   └── understand-anything/     # git submodule — codebase intelligence plugin
├── scripts/
│   └── add-source.sh            # helper to add new skill sources
├── CONTRIBUTING.md
└── README.md
```

---

## License

Each skill source retains its original license:

- `sources/cybersecurity-skills` — Apache 2.0
- `sources/understand-anything` — MIT

This repository's own content (README, scripts) is MIT licensed.
