---
name: on-remote
description: Marks a prompt as sent from the Remote Control web page on claude.ai. Use when the user starts a prompt with /on-remote.
disable-model-invocation: true
---

# On remote

The user sometimes sends prompts to Claude Code from the Remote Control web page on claude.ai. A prompt that starts with `/on-remote` was sent from that page. The scope of this skill is the prompt that carries `/on-remote`.

When the reply to that prompt produces or changes an HTML file for the user to look at, build a copy of the HTML file. The copy embeds every local resource the HTML file references (images, CSS, JavaScript). Send the copy with the SendUserFile tool using `display: "render"`, so it renders in the claude.ai side panel. The HTML file keeps referencing images as separate files by relative path. Only the copy embeds them.

A test on 2026-10-13 showed that the side panel receives only the file that was sent. An image referenced by a relative path did not display. An image embedded in the file as a base64 data URI did display.

Author: "只在我说 im on remote 的时候这样做"; and later "把im on remote 做成一个 .agents 里面的skill，叫做 /on-remote，用来表示我这个prompt是在remote网页上发的，然后html的这个规则就放进去；其它的以后遇到再加。" (English: "do this only when I say I am on remote"; "make 'im on remote' into a skill in .agents called /on-remote, to mark that this prompt was sent from the remote web page; put the HTML rule in it; other rules get added later as they come up").
