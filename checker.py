import os

# check drafts folder for non-draft articles
start_directory = 'content/posts/drafts' # Start from the current directory

ret = 0

for path, sub_dirs, files in os.walk(start_directory):

    for file_name in files:

        if not file_name.endswith(".md"):
            continue

        file_path = os.path.join(path, file_name)
        try:
            # Open the file for reading using a 'with' statement for automatic closing
            with open(file_path, 'r', encoding='utf-8') as f:
                # Read the file line by line to be memory efficient for large files
                for line in f:
                    # to avoid importing pyyaml
                    if "draft:" in line and "false" in line:
                        print(f"Found non-draft file: {file_path}")
                        ret = 1
                        break # Break the inner loop once the string is found in the file


        except (IOError, OSError, UnicodeDecodeError) as e:
            # Handle potential errors like permission issues or decoding problems
            print(f"Error reading file {file_path}: {e}")


# for any linked images, ensure that they exist and that _index.md exists to pick them up
for path, sub_dirs, files in os.walk("content"):

    for file_name in files:

        if not file_name.endswith(".md"):
            continue

        file_path = os.path.join(path, file_name)
        try:

            # Open the file for reading using a 'with' statement for automatic closing
            with open(file_path, 'r', encoding='utf-8') as f:

                # Read the file line by line to be memory efficient for large files
                for line in f:

                    import re
                    # ex. ![Folded corners](/img/stuff-sacks/folded-corner.jpg)
                    pattern = r"!\[.*\]\(([A-Za-z0-9\_\/-]+.(jpg|png|JPG|PNG))\)"
                    match = re.search(pattern, line)

                    if match:
                        img_path = match.group(1)
                        expected_img = os.path.join(path, img_path)

                        expected_index_md = os.path.join(path, "_index.md")
                        if not os.path.exists(expected_index_md):
                            print("_index.md missing!", expected_index_md)
                            ret =1

                        if not os.path.exists(expected_img):
                            print(f"photo missing for post {file_path}!", expected_img)
                            ret = 1

        except (IOError, OSError, UnicodeDecodeError) as e:
            # Handle potential errors like permission issues or decoding problems
            print(f"Error reading file {file_path}: {e}")

exit(ret)