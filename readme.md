## Directory Structure Script

This script generates a readable directory structure on systems such as macOS where the `tree`command is not available.

### Usage

    ./tree [OPTIONS]

### Options

- `-i, --input`: Directory path to analyze (default: current directory)
- `-o, --output`: Output file for the directory structure (default: tree.txt)
- `-f, --files`: Include files in the directory structure (default: only directories)
- `-d, --depth`: Maximum depth for the directory structure (default: full depth)
- `-h, --help`: Display help message

### Examples

Generate a directory structure for the current directory and output to `tree.txt`:

    ./tree

Generate a directory structure for a specified directory and output to `output.txt`:

    ./tree -i /path/to/directory -o output.txt

Generate a directory structure including files for a specified directory and output to `output.txt`:

    ./tree -i /path/to/directory -o output.txt -f

Generate a directory structure with a maximum depth of 3 for a specified directory and output to `output.txt`:

    ./tree -i /path/to/directory -o output.txt -d 3

Display help message:

    ./tree -h

### Make the script accessible from anywhere

To make the script accessible from anywhere on your macOS computer, follow these steps:

1. Ensure that your script is saved and is executable (with the `chmod +x` command as shown previously).
2. Open the Terminal app.
3. Check if you have a local `bin` directory in your home folder:

       ls ~/bin

4. If the command above gives you an error, you need to create the `bin` directory:

       mkdir ~/bin

5. Move or copy the `tree` script to the `~/bin` directory:

       mv /path/to/script/directory/tree ~/bin

   Or, to copy instead:

       cp /path/to/script/directory/tree ~/bin

6. Add the `~/bin` directory to your `PATH` variable by modifying your shell's configuration file. If you are using Bash, edit the `~/.bashrc` or `~/.bash_profile` file. If you are using Zsh, edit the `~/.zshrc` file. You can use a text editor like nano, vim, or Visual Studio Code to edit the file:

   For Bash:

       nano ~/.bash_profile

   For Zsh:

       nano ~/.zshrc

7. Add the following line to the end of the file:

       export PATH="$HOME/bin:$PATH"

8. Save the file and exit the text editor.
9. Restart the Terminal app or run the following command to apply the changes:

   For Bash:

       source ~/.bash_profile

   For Zsh:

       source ~/.zshrc

Now, you should be able to run the `tree` script from any directory by simply typing its name followed by the desired directory path and output file:

    tree -i /path/to/target/directory -o output.txt

Or, to run it in the current directory:

    tree -i . -o output.txt
