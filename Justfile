# Justfile for a Hugo website
# Run commands with: just <recipe>

# Default recipe
default:
  @just --list

# Serve the site locally with drafts enabled
serve:
  hugo server -D

# Serve on a specific port
# serve-port PORT=1313:
# hugo server -D --port {{PORT}}

# Build the site for production
build:
  hugo

# Build with minification
build-min:
  hugo --minify

# Clean the generated site
clean:
  rm -rf public resources

# Create a new post
# Usage: just new-post my-post-title
new-post TITLE:
  hugo new posts/{{TITLE}}.md

# Create a new page (not a post)
# Usage: just new-page about
new-page NAME:
  hugo new {{NAME}}.md

# Show Hugo version
version:
  hugo version
