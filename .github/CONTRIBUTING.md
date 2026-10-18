# Contributing to this project

###### How to Contribute to _MorseTrainer_

## 👋 Greetings!

Thanks for considering contributing to this open-source project! Both beginners 
and experts are very welcome here. Please read these guidelines thoroughly 
before making any contributions.

---

## Table of Contents

- [Contributions You Can Make](#contributions-you-can-make)
- [Requirements](#requirements)
- [Opening Issues](#opening-issues)
  - [Reporting Bugs](#reporting-bugs)
  - [Suggesting Features](#suggesting-features)
- [Pull Request Guidelines](#pull-request-guidelines)
- [Code Guidelines](#code-guidelines)
- [Making Your First Contribution](#making-your-first-contribution)

---

## Contributions You Can Make

There are many ways you can contribute: 
- [Suggesting or adding a feature](#suggesting-features)
- [Finding and reporting bugs](#reporting-bugs)
- Reformatting, refactoring, or enhancing code
- Improving documentation
- Helping to review or give feedback to pull requests or issues
- Suggesting task issues (by opening a discussion)
- ...etc

Any addition to the project will be very much appreciated, even small or minor 
ones.

[^ TOC](#table-of-contents)

## Requirements

- **Latest version of Python** (or at least 3.12 recommended)
- A recognized IDE or code editor, for example:
  - Visual Studio / VSCode (with a proper linter or code analyzer installed)
  - JetBrains IDEs (PyCharm, IntelliJ, WebStorm, etc.)
  - Eclipse
  - Xcode
  - **NOT** the GitHub web editor or a basic text editor

[^ TOC](#table-of-contents)

---

## Opening Issues

**We highly recommend [opening an issue][issues]** before creating a 
pull request. This is to ensure all changes are discussed properly (and you 
don't waste your time creating a PR that ends up getting closed). 

This is also to prevent automatically-generated pull requests created by 
automated bot accounts with minimal human insight.

### Reporting Bugs

To report a bug:
1. On the repository on GitHub, go to the [Issues] tab.
2. Select "New issue".
3. Use the bug report template section.
4. Describe the issue in detail, using the template as a guide
5. Submit the issue.

### Suggesting Features

To suggest a feature:
1. On the repository on GitHub, go to the [Issues] tab.
2. Select "New issue".
3. Use the bug report template section.
4. Describe the feature thoroughly, using the template as a guide.
5. Submit the issue.

[^ TOC](#table-of-contents)

---

## Pull Request Guidelines

1. Create a fork of [the repository][repo].
2. Clone the forked repository to your local machine.
3. Create a new branch with a meaningful name (include the type of change 
   followed by a slash; use hierarchical branch naming).

   | Prefix           | Description                                    |
   |------------------|------------------------------------------------|
   | `bugfix`/`fix`   | Bug fix (minor, not urgent)                    |
   | `hotfix`         | Urgent, critical fix                           |
   | `feature`        | New feature/functionality                      |
   | `ui`             | Affects user interface only                    |
   | `docs`           | Documentation only                             |
   | `format`/`style` | Formatting fixes                               |
   | `refactor`       | Code improvements that do not affect behaviour |
   | `test`           | Changes to test files                          |
   | `experiment`     | Temporary, experimental code; playground       |
   | `mix`            | A combination of different fixes/changes       |
   | `misc`           | Other; miscellaneous                           |

   - e.g.) `feature/feature-name`, `fix/issue-12`
   
4. Make and commit your changes.
   - Commit messages should be in the imperative tone without a period.
     - e.g.: `Add test files`, `Fix this function`, `Update README`
5. Push commits to GitHub (if you have made changes locally on your machine).
6. Create and submit a pull request.
7. Optional: Request a review from a maintainer.

[^ TOC](#table-of-contents)

## Code Guidelines

Before making code changes, run `bundle install` to install dependencies.

This project uses RuboCop as its linter and formatter. `bundle install` 
should have installed Rubocop for you, but you can install the gem 
individually (`gem install rubocop`).

After writing your code, run `rubocop` or `rubocop -a` (autocorrect) and fix 
any formatting or style issues. Make sure RuboCop is using the `.rubocop.yml` 
config file.

**Remember to add type signatures** in `sig/` for any new 
methods/classes/modules!

**Tip**: You can run `bin/console` to experiment with the code or debug any
problems.

This is a relatively small project, so we don't have tests, but it would be 
nice if someone could write some for us (you can open a PR for this without 
writing an issue).

[^ TOC](#table-of-contents)

## Making Your First Contribution

If you're new here or are not familiar with contributing to repositories on 
GitHub, here are some links with information that might help:

- https://docs.github.com/get-started/exploring-projects-on-github/contributing-to-a-project
- https://docs.github.com/get-started/exploring-projects-on-github/contributing-to-open-source
- https://github.com/firstcontributions/first-contributions

[^ TOC](#table-of-contents)


[repo]: https://github.com/TheGittyPerson/morse_trainer
[issues]: https://github.com/TheGittyPerson/morse_trainer/issues
[pull requests]: https://github.com/TheGittyPerson/morse_trainer/pulls
[rubocop]: https://docs.rubocop.org/rubocop/latest/
