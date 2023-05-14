# ESBuild Notes





# ESBuild Config

## Output Directory
> Update this if you need to configure a destination folder other than `output`<br />
> &nbsp;&nbsp; *-Original Note*

### Default Code
```js
const outputFolder = "output"
```

This one is pretty self-explanatory, for the most part anyway. The `outputFolder` is a [constant](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/const) which determines the location for files generated during the build process. These are the files generated (and subsequently hosted) when you use `bin/bridgetown start`.

> __Warning__<br />
> Unless you know *exactly* what you're doing, it is *very* important that the you __*do not change*__ the name of the `const` used to declare the output directory, which is set to `outputFolder` by default. Doing so will almost certainly break the entire build and hosting process.

### Syntax
```js
const outputFolder = "DESTINATION"
```