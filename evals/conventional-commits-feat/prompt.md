---
max_turns: 10
allowed_tools: [Read, Glob, Grep, Skill]
---

I'm about to commit this change. Write the commit message for it, using conventional commits.

```diff
--- a/src/cli/deploy.ts
+++ b/src/cli/deploy.ts
@@ -12,6 +12,7 @@ export const deploy = new Command("deploy")
   .argument("<service>", "service to deploy")
+  .option("--dry-run", "print the plan without applying it")
   .action(async (service, opts) => {
-    await apply(service);
+    const plan = await buildPlan(service);
+    if (opts.dryRun) return printPlan(plan);
+    await apply(plan);
   });
```
