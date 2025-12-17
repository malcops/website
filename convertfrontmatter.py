import tomllib
import yaml
import sys
from pathlib import Path

DEFAULTS = {
    "author": "Paul",
    "summary": " ",
    "description": " ",
    "toc": False,
    "readTime": True,
    "autonumber": True,
    "math": False,
    "showTags": False,
    "hideBackToTop": True,
}

def convert_frontmatter(path):
    text = Path(path).read_text()

    # Extract TOML front matter
    start = text.find("+++")
    end = text.find("+++", start + 3)

    toml_data = tomllib.loads(text[start + 3:end])

    # Transform fields
    yaml_data = {
        "title": toml_data.get("title"),
        "author": DEFAULTS["author"],
        "date": toml_data.get("date"),
        "summary": DEFAULTS["summary"],
        "description": DEFAULTS["description"],
        "draft": toml_data.get("draft", False),
        "toc": DEFAULTS["toc"],
        "readTime": DEFAULTS["readTime"],
        "autonumber": DEFAULTS["autonumber"],
        "math": DEFAULTS["math"],
        "tags": sorted(set(toml_data.get("tags", []) + ["development"])),
        "showTags": DEFAULTS["showTags"],
        "hideBackToTop": DEFAULTS["hideBackToTop"],
    }

    yaml_block = yaml.dump(
        yaml_data,
        default_flow_style=False,
        sort_keys=False,
        allow_unicode=True,
    )

    return f"---\n{yaml_block}---\n\n" + text[end + 3:].lstrip()

if __name__ == "__main__":
    print(convert_frontmatter(sys.argv[1]))
