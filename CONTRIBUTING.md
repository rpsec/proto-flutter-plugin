# Contributing to Flutter Tool

First off, thanks for taking the time to contribute!

The following is a set of guidelines for contributing to `flutter_tool` and its packages. These are mostly guidelines, not rules. Use your best judgment, and feel free to propose changes to this document in a pull request.

## Reporting Bugs

This section guides you through submitting a bug report.

*   **Use a clear and descriptive title** for the issue to identify the problem.
*   **Describe the exact steps which reproduce the problem** in as much detail as possible.
*   **Provide specific examples** to demonstrate the steps.
*   **Describe the behavior you observed after following the steps** and point out what exactly is the problem with that behavior.
*   **Explain which behavior you expected to see instead** and why.

## Suggesting Enhancements

This section guides you through submitting an enhancement suggestion, including completely new features and minor improvements to existing functionality.

*   **Use a clear and descriptive title** for the issue to identify the suggestion.
*   **Provide a step-by-step description of the suggested enhancement** in as much detail as possible.
*   **Explain why this enhancement would be useful** to most users.

## Pull Requests

The process described here has several goals:

-   Maintain the quality of the product
-   Fix problems that are important to users
-   Engage the community in working toward the best possible product

### Process

1.  Fork the repo and create your branch from `master`.
2.  If you've added code that should be tested, add tests.
3.  If you've changed APIs, update the documentation.
4.  Ensure the test suite passes.
5.  Make sure your code lints.
6.  Issue that pull request!

## Development Environment

For instructions on setting up your development environment, building the project, and running tests, please refer to the [Development Guide](./docs/development.md).

## Code Style

We use `cargo fmt` for code formatting and `cargo clippy` for linting.

You can run the following `moon` tasks to ensure your code meets the standards:

-   **Format**: `moon run :format`
-   **Lint**: `moon run :lint`
-   **Test**: `moon run :test`
-   **Check All**: `moon run :check`
