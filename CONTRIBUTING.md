# Contributing
These are the contribution guidelines for archiso.
All contributions fall under the terms of the [GPL-3.0-or-later](./LICENSE).

## Editorconfig
A top-level editorconfig file is provided. Please configure your text editor
to use it.

## Changelog
When adding, changing or removing something in a merge request, add a sentence
to the explaining it.
The changelog entry needs to be added to the unreleased section at the top, as
that section is used for the next release.

## Merge requests and signed commits
Merge requests are not required to contain signed commits.
The project maintainers may rebase a given merge request branch at their
discretion (if possible), which may remove signed commits.

The tip of the project's default branch is required to be a signed commit by
the project maintainers. For external contributors this means, that their
merge request will be merged using `--no-ff` in a signed merge commit, while
contributions by the project maintainers may be merged using `--ff` when the
top-most commit of the source branch is signed by a valid PGP key of the given
maintainer.

## Testing
Contributors are expected to test their contributions by building and running 
the resulting image using `run_archiso`.
