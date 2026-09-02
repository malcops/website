# Justfile for a Hugo website
# Run commands with: just <recipe>

DOCKER_CMD := "docker run -v ${PWD}:/src:z --net=host hugomods/hugo"

# Default recipe
default:
  @just --list

# Serve the site locally with drafts enabled
serve:
  {{DOCKER_CMD}} server -D --baseURL http://localhost

# Serve on a specific port
# serve-port PORT=1313:
# hugo server -D --port {{PORT}}

# Build the site for production
build:
  {{DOCKER_CMD}} hugo

# Build with minification
build-min:
  {{DOCKER_CMD}} hugo --minify

# Build for paulmalcolm.ca release
# without --baseURL the LinkedIn and Github icons appear huge
# (.css gets 404)
build-release:
  {{DOCKER_CMD}} hugo --baseURL https://paulmalcolm.ca

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

# Run custom checker.py script
check:
  python3 checker.py

