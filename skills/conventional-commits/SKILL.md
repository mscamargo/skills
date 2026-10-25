---
name: conventional-commits
description: Writes git commit messages that follow the Conventional Commits 1.0 spec (feat, fix, chore, refactor, BREAKING CHANGE). Use when committing changes, writing or reviewing a commit message, or when the user mentions conventional commits, semantic commits, or changelog-friendly history.
license: MIT
metadata:
  author: mscamargo
  version: "0.1.0"
---

# Conventional Commits

## Steps

1. Run `git diff --staged` (or `git diff` if nothing is staged) and read the change.
2. Pick the **type** that best describes the change (table below). If the change mixes
   unrelated concerns, suggest splitting it into separate commits instead.
3. Pick an optional **scope**: the module, package or area touched (`api`, `auth`, `ci`).
4. Write the **subject**: imperative mood, lowercase, no trailing period, ≤ 72 chars
   including the `type(scope): ` prefix.
5. Add a **body** only when the *why* isn't obvious from the subject. Wrap at 72 chars.
6. Add **footers** for breaking changes and issue references.

## Types

| Type       | Use for                                              |
|------------|------------------------------------------------------|
| `feat`     | A new user-facing capability                         |
| `fix`      | A bug fix                                            |
| `refactor` | Code change that neither fixes a bug nor adds a feature |
| `perf`     | Performance improvement                              |
| `test`     | Adding or fixing tests                               |
| `docs`     | Documentation only                                   |
| `build`    | Build system or dependencies                         |
| `ci`       | CI configuration                                     |
| `chore`    | Anything else that doesn't touch src or tests        |

## Breaking changes

Mark them with `!` after the type/scope **and** a `BREAKING CHANGE:` footer explaining
the migration:

```
feat(api)!: drop v1 endpoints

BREAKING CHANGE: /v1/* routes are removed. Clients must call /v2/*.
```

## Examples

```
fix(auth): refresh token before it expires
```

```
feat(cli): add --dry-run flag to deploy command

Lets users preview which services would be redeployed without
touching the cluster.

Refs: #142
```

For edge cases (reverts, merge commits, monorepo scopes) see
[references/edge-cases.md](references/edge-cases.md).
