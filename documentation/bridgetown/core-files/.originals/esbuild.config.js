const build = require("./config/esbuild.defaults.js")
// The comments/notes/instructions that were originally part of this file can now be found in the "esbuild-notes.md" file, located in:
// "/documentation/bridgetown/core-files"

// Update this if you need to configure a destination folder other than `output`
const outputFolder = "output"

// You can customize this as you wish, perhaps to add new esbuild plugins.
//
// ```
// const path = require("path")
// const esbuildCopy = require('esbuild-plugin-copy').default
// const esbuildOptions = {
//   plugins: [
//     esbuildCopy({
//       assets: {
//         from: [path.resolve(__dirname, 'node_modules/somepackage/files/*')],
//         to: [path.resolve(__dirname, 'output/_bridgetown/somepackage/files')],
//       },
//       verbose: false
//     }),
//   ]
// }
// ```
//
// You can also support custom base_path deployments via changing `publicPath`.
//
// ```
// const esbuildOptions = { publicPath: "/my_subfolder/_bridgetown/static" }
// ```

/**
 * @typedef { import("esbuild").BuildOptions } BuildOptions
 * @type {BuildOptions}
 */
const esbuildOptions = {}

build(outputFolder, esbuildOptions)
