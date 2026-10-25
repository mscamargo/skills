---
type: llm
weight: 1
---

The response contains a single commit message that:

- Starts with `feat` (optionally with a scope such as `cli` or `deploy`), followed by `: `.
- Has a subject in imperative mood, lowercase, with no trailing period, at most 72 characters.
- Mentions the new dry-run option.
- Is not marked as a breaking change (no `!` and no `BREAKING CHANGE:` footer).
