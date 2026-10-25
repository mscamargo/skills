# skills

Personal [Agent Skills](https://agentskills.io) by Marcos S. Camargo. Every skill
follows the open `SKILL.md` format, so it works in Claude Code, Codex, Copilot,
Cursor and any other agent that supports the standard.

## Skills

| Skill | Description |
|-------|-------------|
| [conventional-commits](skills/conventional-commits/SKILL.md) | Writes commit messages that follow Conventional Commits 1.0 |

## Install

**Claude Code** (as a plugin, with updates):

```
/plugin marketplace add mscamargo/skills
/plugin install mscamargo-skills@mscamargo
```

**Any Agent Skills-compatible agent** (via [skills.sh](https://skills.sh)):

```
npx skills add mscamargo/skills
```

**Local development** (symlinks each skill into `~/.claude/skills`, so edits apply immediately):

```
bin/link-local
```

## Layout

```
.claude-plugin/
  plugin.json        # plugin manifest; holds the release version
  marketplace.json   # makes this repo a Claude Code marketplace
skills/<name>/
  SKILL.md           # frontmatter (name, description) + instructions
  references/        # extra docs, loaded on demand
  scripts/           # runnable code
  assets/            # templates, data
evals/<case>/        # eval cases for `claude plugin eval`
templates/SKILL.md   # starting point for new skills
bin/                 # repo tooling: new-skill, link-local
```

## Adding a skill

1. `bin/new-skill my-skill` creates `skills/my-skill/SKILL.md` from the template.
2. Write the `description` carefully. It's the only part the agent sees before deciding
   to load the skill, so say what the skill does **and** when to use it.
3. Keep `SKILL.md` under ~500 lines; move detail into `references/`.
4. Add an eval case: `claude plugin eval init --bare my-skill-basic`, then fill in
   `prompt.md` and `graders/criteria.md`.
5. Run the checks below, add a CHANGELOG entry, and open a PR.

## Checks

```
claude plugin validate --strict .                              # manifests + skills
claude plugin validate --strict .claude-plugin/marketplace.json
claude plugin eval .                                           # run evals (uses your Claude credits)
```

CI runs the Agent Skills reference validator (`skills-ref`) on every skill.

## Releasing

Versions follow [semver](https://semver.org) and cover the whole repo:

- **major**: a skill is removed or renamed, or its behavior changes incompatibly
- **minor**: a new skill, or a new capability in an existing one
- **patch**: fixes and wording tweaks

1. Bump `version` in **both** `.claude-plugin/plugin.json` and the marketplace entry in
   `.claude-plugin/marketplace.json`. Bump `metadata.version` in each `SKILL.md` you changed.
2. Move the `Unreleased` CHANGELOG entries under the new version.
3. Commit, then `claude plugin tag . --push`. This checks that both manifests agree and
   creates a `mscamargo-skills--vX.Y.Z` tag.
