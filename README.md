# Armenian Names

A small **Common Lisp** and **HTMX** test project that generates a random Armenian name and a short mini-history.

## What it does

- Randomly generates an Armenian name.
- Prints a small mini-history for the generated name.
- Runs as a simple test application.
- Starts with `sbcl --load run.lisp`.

## Requirements

- SBCL
- HTMX
- Quicklisp
- ASDF
- Common Lisp

## Run

```bash
sbcl --load run.lisp
```

This will load the project, quickload the `armenian-names` system, and start the application.

## `run.lisp`

```lisp
(in-package :cl-user)

(push (uiop:getcwd) asdf:*central-registry*)

(ql:quickload :armenian-names)

(lisp-htmx-app::start-app)

(format t "~%🚀 Application started successfully!~%")
```


## Notes

This is a test project, so the output is intentionally simple and random. The name generator and mini-history text can be implemented with small built-in lists or basic rules.
