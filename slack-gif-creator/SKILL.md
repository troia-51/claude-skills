---
name: slack-gif-creator
description: Create custom Slackmoji-ready GIFs using Claude AI. Use when the user wants to generate animated GIFs for Slack, design custom emoji animations, or create reaction GIFs.
allowed-tools: Bash, Read, Write
---

## When to Use

- User asks to create a Slack GIF or emoji
- User wants animated GIFs for messaging
- User mentions "slackmoji", "custom emoji", "reaction GIF"
- User wants to animate an uploaded image

## How It Works

This tool is a Claude-powered bot that generates 128x128 emoji-optimized GIFs for Slack. It runs on [Modal](https://modal.com/) using the **Claude Agent SDK** with three core components:

1. **Slack Bot Server** — FastAPI ASGI app hosted on Modal, handles Slack events (mentions, thread replies)
2. **Claude Agent Sandbox** — Runs inside a Modal Sandbox with a dedicated Volume per Slack thread for GIF storage and session persistence
3. **Anthropic API Proxy** — Keeps API keys out of the sandbox to prevent prompt-injection leaks

### Workflow

1. User mentions the bot or replies in a Slack thread
2. Slack sends an event to the Modal webhook
3. Bot creates or resumes a Modal sandbox for that thread
4. Attached images are downloaded and uploaded to the sandbox
5. Claude Agent SDK runs with the user's message
6. Claude generates a GIF using the `slack-gif-creator` skill
7. The generated GIF is uploaded back to the Slack thread
8. Sandbox stays alive for 20 minutes for follow-up requests

### Key Features

- **Natural Language GIF Generation** — describe what you want in plain language
- **Persistent Threads** — each Slack thread maintains conversation context
- **Image Upload Support** — attach images for incorporation into GIFs
- **Background Removal** — uses `rembg` for transparent GIFs
- **Real-time Tool Logging** — optional debug mode shows Claude's tool usage

## Setup Requirements

- Python 3.10+
- Modal account + `pip install modal`
- Slack workspace with configured app (OAuth scopes: `app_mentions:read`, `chat:write`, `files:read`, `files:write`, `channels:history`, `groups:history`, `im:history`, `mpim:history`)
- Modal Secrets: `anthropic-secret` (API key) + `claude-code-slackbot-secret` (bot token + signing secret)

## Output

A 128x128 pixel animated GIF file optimized for Slack custom emoji upload. GIF is posted directly to the Slack thread where the request was made.

## Usage

Mention the bot in any channel:
> @GIFBot create a GIF of a pelican riding a bicycle

Attach images for incorporation:
> @GIFBot make a party GIF of this entity that flashes the letters "AGI"

Request background removal:
> @GIFBot make a GIF of this guy riding on a boat

Reply in threads for iterations:
> the text runs off the screen, fix the wrapping
