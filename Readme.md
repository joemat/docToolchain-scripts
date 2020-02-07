## Scripts to run docToolchain docker container

These scripts ease the usage of the [docToolchain docker image](https://hub.docker.com/r/rdmueller/doctoolchain).

It customizes the HTML export to provide an expandable table of contents.
Thanks to [rec on stackoverflow](https://stackoverflow.com/users/2511197/rec) to provide 
the code in this [answer on stackoverflow](https://stackoverflow.com/a/34481639/1732287). 

See [docToolchain manual](https://doctoolchain.github.io/docToolchain/) 
for more information about docToolchain.

## Usage

### Create initial arc42 project

Creates a template [arc42](https://arc42.org/) documentation in a `arc42` directory.

```
bash initArg42.sh
```

Optional argument `initArc42` followed by a language suffix (`DE`, `EN`, `ES` or `RU`)

### Render arc42 documentation to HTML 

```
bash render.sh
```

Find the rendered HTML file in [arc42/build/html5/arc42-template.html](arc42/build/html5/arc42-template.html).