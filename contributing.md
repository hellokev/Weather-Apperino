# Contributing Guidelines

We'll keep it simple and just work in separate feature branches. Once a feature is done, submit a pull request to merge into `master`.
Also, here's a guide for creating good [commit messages](https://chris.beams.io/posts/git-commit/).

## Setting up your dev environment

If you ever get lost, follow Github's [Fork a repo](https://docs.github.com/en/free-pro-team@latest/github/getting-started-with-github/fork-a-repo) guide.

We'll also be using [Git](https://git-scm.com/downloads) so make sure you have it installed.

### Clone the repo

First click the "fork" button to create your own copy of the project.

Then use ssh

```bash
git clone git@github.com:your-username/Weather-Apperino.git
```

Or https

```bash
git clone https://github.com/your-username/Weather-Apperino.git
```

Change to the Weather-Apperino directory

```bash
cd Weather-Apperino
```

Add the upstream repository

```bash
git remote add upstream https://github.com/AnOrdinaryUsername/Weather-Apperino.git
```

### Develop your contribution

Pull the latest changes from upstream

```bash
git checkout master
git pull upstream master
```

Create a branch for feature you want to work on

```bash
git checkout -b branch-feature-name
```

Commit any changes as you make the feature. Remember to use this helpful [guide](https://chris.beams.io/posts/git-commit/).

```bash
git add feature.swift
git commit -m "Meaningful message here"
```

### Submit your contribution

Push changes to your fork

```bash
git push origin your-branch-feature-name
```

Now click the green pull request button, add your title and message, and submit your changes!
