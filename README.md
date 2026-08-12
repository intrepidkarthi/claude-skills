# intrepidkarthi-skills

Personal [Claude Code](https://code.claude.com/docs/en/skills) skills, distributed as a plugin marketplace.

First skill: **write-like-me** — strip AI writing patterns ("AI-isms") and write/rewrite/generate in Karthik's voice. Modes: `detect`, `rewrite`, `edit` (in place), `generate`, plus a marks-only pass.

It also ships a scanner for the AI marks you can't see by reading: invisible Unicode (zero-width characters, bidi controls, tag characters, space homoglyphs), chat-UI citation fingerprints, AI-tool `utm_source` parameters, and provenance keys in YAML frontmatter.

```bash
python3 plugins/write-like-me/skills/write-like-me/scripts/scan_marks.py draft.md
python3 plugins/write-like-me/skills/write-like-me/scripts/scan_marks.py draft.md --fix --in-place
```

Stdlib only, no dependencies. It preserves joiners that are load-bearing in emoji sequences and in Tamil, Devanagari, and Arabic rather than stripping every invisible character blind. Codepoint tables adapted from [`guillaumemeyer/watermarks-remover`](https://github.com/guillaumemeyer/watermarks-remover) (MIT); that project's file-provenance half (C2PA, EXIF, PDF/DOCX/image metadata) is out of scope here.

A clean scan means no invisible carriers were found in the characters. It does not mean the text is human-written — statistical token-sampling watermarks live in word choice and survive any Unicode scrub.

## Layout

```
claude-skills/
├── .claude-plugin/
│   └── marketplace.json                # marketplace catalog (lists plugins)
├── plugins/
│   └── write-like-me/
│       ├── .claude-plugin/
│       │   └── plugin.json             # plugin manifest
│       └── skills/
│           └── write-like-me/
│               ├── SKILL.md            # the skill itself
│               ├── eval.md             # self-check run before returning a draft
│               └── scripts/
│                   └── scan_marks.py   # invisible-mark scanner / stripper
├── install-local.sh                    # local installer (user + per-project scope)
└── README.md
```

## Option A — Local only (fastest, no GitHub)

Make it available in every project on this machine, including everything under `CascadeProjects`:

```bash
cd claude-skills
chmod +x install-local.sh
./install-local.sh                 # user scope: ~/.claude/skills/  (all projects)
./install-local.sh --per-project   # ALSO commit a copy into each repo under CascadeProjects
```

User scope alone already covers all your projects. Use `--per-project` only if you want the skill committed to individual repos (e.g. to share with collaborators via git).

Confirm inside Claude Code:

```
/skills
```

## Option B — Marketplace (use on any machine, versioned)

1. Create a GitHub repo named `claude-skills` under your account and push:

   ```bash
   cd claude-skills
   git init && git add . && git commit -m "write-like-me v4.0.0"
   git branch -M main
   git remote add origin https://github.com/intrepidkarthi/claude-skills.git
   git push -u origin main
   ```

2. On any machine, inside Claude Code:

   ```
   /plugin marketplace add intrepidkarthi/claude-skills
   /plugin install write-like-me@intrepidkarthi-skills
   ```

   Choose **User** scope when prompted to make it available across all projects on that machine.

> Marketplace state is stored once per user in `~/.claude/plugins/known_marketplaces.json`, and installed plugins are cached to `~/.claude/plugins/cache/`, so they work across all your projects.

### Updating

There are no automatic updates yet. To ship a change: bump `version` in `plugins/write-like-me/.claude-plugin/plugin.json` (and the matching entry in `.claude-plugin/marketplace.json`), commit, push, then on each machine:

```
/plugin update write-like-me
```

(or reinstall — reinstalling pulls the latest version).

## Invoking it

- **Automatic:** Claude loads the skill when your request matches its description ("write a tweet like me", "clean up the AI-isms in this draft"). The description is written to trigger broadly.
- **Explicit:** `/write-like-me` (plugin commands are namespaced, so it may appear as `/write-like-me:write-like-me`).

## Make it apply *every time* (not just when available)

Auto-trigger is relevance-based, not guaranteed. To make the skill reliably govern your writing across all environments, add one line to your global `~/.claude/CLAUDE.md` (which travels with your dotfiles):

```md
When writing or rewriting any post, tweet, thread, email, or long-form text, use the write-like-me skill (karthik voice) and run a final AI-ism pass before returning it.
```

## CI / container environments

For headless or container-based Claude Code, pre-populate a seed directory at build time and point `CLAUDE_CODE_PLUGIN_SEED_DIR` at it, so the marketplace and plugin are available without cloning at runtime. Separate multiple paths with `:` (Unix).

---

Sources: Claude Code skills and plugin-marketplace docs at code.claude.com/docs (`en/skills`, `en/plugin-marketplaces`, `en/discover-plugins`).
