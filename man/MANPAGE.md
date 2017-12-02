% poly (1)
% Vanessa McHale<vamchale@gmail.com>

# NAME

poly - a command-line tool for counting source code

# SYNOPSIS

  poly [DIRECTORY]... [OPTION]...

# DESCRIPTION

**poly** determines the contents of projects, giving a breakdown of all
languages present.

When no directory is given, polyglot will execute in the current directory.

# OPTIONS

**-h**, **-\-help** Display help and exit

**-v**, **-\-version** Display version and exit

**-e**, **-\-exclude** Exclude a directory

**-t**, **-\-table** Show results as a table

# EXAMPLES

Show the contents of ~/programming

```
poly ~/programming
```

Count lines of source code in the current directory, skipping any directory called forks

```
poly -e forks
```

Shoe the contents of ./project/src, displaying a table in the terminal

```
poly ./project/src --table
```

# BUG REPORTS

For bug reports and updates, go to https://nest.pijul.com/vamchale/polyglot