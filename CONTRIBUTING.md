# Contributing

## Adding a New Skill Source

A skill source is any public repository that follows the [agentskills.io](https://agentskills.io) format or provides a Claude Code plugin. Each source is added as a git submodule so it stays in sync with upstream independently.

### 1. Use the helper script

```bash
./scripts/add-source.sh <github-url> <local-name>
```

**Example:**

```bash
./scripts/add-source.sh https://github.com/org/infra-skills.git infra-skills
```

This will:
- Add the repo as a git submodule at `sources/<local-name>/`
- Stage the `.gitmodules` update

### 2. Update the README skills table

Open `README.md` and add a row (or rows) to the Skills Catalog table:

```markdown
| **Your Skill Pack Name** | Domain or command description | skill count | agentskills.io | [org/repo](url) |
```

### 3. Commit

```bash
git add .gitmodules sources/<local-name> README.md
git commit -m "add <local-name> skill source"
```

### 4. Open a PR

Submit a pull request with a description of what the skill pack covers and why it belongs in this library.

---

## Updating Existing Sources

To pull the latest commits from all upstream sources:

```bash
git submodule update --remote --merge
git commit -am "chore: update skill sources to latest"
```

To update a single source:

```bash
git submodule update --remote --merge sources/<local-name>
```

---

## Skill Quality Bar

Before adding a source, verify it meets at least these criteria:

- [ ] Each skill has a `SKILL.md` with a `name` and `description` frontmatter field
- [ ] Skills encode real workflows, not just generic descriptions
- [ ] The repo is publicly accessible and has an open-source license
- [ ] The source is actively maintained (last commit within 12 months)

---

## Removing a Source

```bash
git submodule deinit -f sources/<local-name>
git rm -f sources/<local-name>
rm -rf .git/modules/sources/<local-name>
git commit -m "remove <local-name> skill source"
```

Then remove the corresponding rows from the README table.
