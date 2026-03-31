# Justfile for a Hugo website
# Run commands with: just <recipe>

DOCKER_CMD := "docker run -v ${PWD}:/src --net=host hugomods/hugo"

# Default recipe
default:
  @just --list

# Serve the site locally with drafts enabled
serve:
  {{DOCKER_CMD}} server -D

# Serve on a specific port
# serve-port PORT=1313:
# hugo server -D --port {{PORT}}

# Build the site for production
build:
  {{DOCKER_CMD}} hugo

# Build with minification
build-min:
  {{DOCKER_CMD}} hugo --minify

# Clean the generated site
clean:
  rm -rf public resources

# Create a new post
# Usage: just new-post my-post-title
new-post TITLE:
  {{DOCKER_CMD}} hugo new posts/{{TITLE}}.md

# Create a new page (not a post)
# Usage: just new-page about
new-page NAME:
  {{DOCKER_CMD}} hugo new {{NAME}}.md

# Show Hugo version
version:
  {{DOCKER_CMD}} hugo version

check:
  python3 checker.py

