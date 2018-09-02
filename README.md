# polyglot

[![Build Status](https://travis-ci.org/vmchale/polyglot.svg?branch=master)](https://travis-ci.org/vmchale/polyglot)

`poly` is a command-line tool that determines project contents.
The goal is to able to point it to any directory and get an accurate,
complete, and informative summary of its contents.

<img alt="Screenshot of sample output" src=https://github.com/vmchale/polyglot/raw/master/screenshot.png>

It also has the secondary goal of advancing the state-of-the art for ATS, by
writing practical, distributable software and supporting tooling.

## Pitch

Reasons to use polyglot:

  * Accurate: won't confuse Coq and Verilog
  * Fast: polyglot is faster than all other tools
  * Pretty: magenta output

Reasons not to use polyglot:

  * It's written in ATS
  * Best on Linux
  * No regex-based exclusions
  * Doesn't count block comments

### Benchmarks

On the Rust repo:

<table>
  <tr>
    <th>Tool</th>
    <th>Language</th>
    <th>Time</th>
  </tr>
  <tr>
    <td><code>polyglot</code></td>
    <td>ATS</td>
    <td>143.2 ms</td>
  </tr>
  <tr>
    <td><code>loc</code></td>
    <td>Rust</td>
    <td>171.8 ms</td>
  </tr>
  <tr>
    <td><code>tokei</code></td>
    <td>Rust</td>
    <td>304.6 ms</td>
  </tr>
  <tr>
    <td><code>scc</code></td>
    <td>Go</td>
    <td>471.1 ms</td>
  </tr>
  <tr>
    <td><code>gocloc</code></td>
    <td>Go</td>
    <td>839.8 ms</td>
  </tr>
  <tr>
    <td><code>cloc</code></td>
    <td>Perl</td>
    <td>5.052 s</td>
  </tr>
  <tr>
    <td><code>enry</code></td>
    <td>Go</td>
    <td>5.440 s</td>
  </tr>
  <tr>
    <td><code>linguist</code></td>
    <td>Ruby</td>
    <td>17.46 s</td>
  </tr>
</table>

For more extensive benchmarks, see my [blog post](http://blog.vmchale.com/article/polyglot-comparisons)
with some additional data.

### Heuristics

Polyglot distinguishes itself from `tokei`, `gocloc`, `scc`, and `loc` by being able to disambiguate file names.
Thus, `poly` will not confuse Happy for Yacc (for instance).

## Installation

### From a Script

The easiest way to install is to use the installation script, like so:

```bash
curl -sSl https://raw.githubusercontent.com/vmchale/polyglot/master/bash/install.sh | sh -s
```

You may need to add `$HOME/.local/bin` to your `PATH` and
`$HOME/.local/share/man/man1` to your `MANPATH`.

You can optionally install [compleat](https://github.com/mbrubeck/compleat) for
shell completions as well.

### Vim Plugin

There is a [vim plugin](https://github.com/vmchale/polyglot-vim) available which
can count lines of code in a project.

### Documentation

You can view manpages for `poly` with

```
man poly
```

## Building for Hacking

You can install [ats-pkg](http://hackage.haskell.org/package/ats-pkg)
with

```bash
curl -sSl https://raw.githubusercontent.com/vmchale/atspkg/master/bash/install.sh | sh -s
```

And then build `poly` with

```bash
git clone git@github.com:vmchale/polyglot.git
cd polyglot
atspkg build --pkg-args './gc.dhall'
```

This will put a binary at `target/poly`.

If you are on Mac, you may have to replace the last line with

```bash
atspkg build --pkg-args './mac.dhall'
```

### Testing

To run the test suite

```bash
atspkg test --pkg-args './gc.dhall'
```

## Languages

For languages already supported, see
[LANGUAGES.md](https://github.com/vmchale/polyglot/blob/master/LANGUAGES.md)

## Contents

```
-------------------------------------------------------------------------------
 Language             Files       Lines         Code     Comments       Blanks
-------------------------------------------------------------------------------
 ATS                     16        3569         3417           37          115
 C                        1          24           22            0            2
 C Header                 1          43           35            0            8
 Dash                     4         139          106            1           32
 Dhall                    5          95           85            0           10
 HTML                     1          20           17            0            3
 Justfile                 1          20           18            0            2
 Markdown                 7         772          666            0          106
 TOML                     1           3            3            0            0
 YAML                     1          51           45            0            6
-------------------------------------------------------------------------------
 Total                   38        4736         4414           38          284
-------------------------------------------------------------------------------
```
