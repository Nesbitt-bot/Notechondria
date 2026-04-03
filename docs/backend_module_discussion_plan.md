# Module discussion board plan

Minimal backend change target for cloud-only module discussions:

## Proposed link table

Add a small model later rather than rewiring the whole note schema at once.

Suggested table: `ModuleDiscussionLink`

- `course_id` -> `Course`
- `module_key` -> stable string key for the module/section
- `root_note_id` -> `Note` used as the discussion board root
- `creator_id` -> creator that created the link
- `date_created` / `last_edit`

## Why this shape

- minimal backend surface
- one canonical discussion board per module
- leaves note storage mostly untouched
- works for cloud-only first pass

## Deferred

- nested replies model
- moderation workflows
- local/offline discussion sync
