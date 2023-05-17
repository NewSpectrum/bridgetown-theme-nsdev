# ChatGPT Guide

## Prompt
> Can you show me how to add PrismJS syntax highlighting to a website that's built using Bridgetown (Ruby), WebPack, and Liquid? The goal is for Markdown files to be parsed with PrismJS syntax highlighting applied to fenced code blocks, like:
>
```js
console.log("test");
```

## First Message
Certainly! To add PrismJS syntax highlighting to your Bridgetown website built with Ruby, WebPack, and Liquid, follow these steps:

Step 1: Install the required dependencies
Make sure you have Bridgetown, WebPack, and Liquid set up in your project. If not, you can install them by following their respective documentation.

Next, install PrismJS and the necessary PrismJS language plugins. In your project directory, run the following command:

```bash
npm install prismjs prismjs/components
```

Step 2: Configure WebPack
In your WebPack configuration file (usually `webpack.config.js` or similar), add the following lines:

```javascript
const webpack = require('webpack');

module.exports = {
  // other configuration options...

  plugins: [
    new webpack.ProvidePlugin({
      'Prism': 'prismjs',
      'window.Prism': 'prismjs',
      'PrismJS': 'prismjs',
      'window.PrismJS': 'prismjs',
    })
  ]
};
```

This configuration ensures that PrismJS is available globally in your application.

Step 3: Include PrismJS styles
In your application's main CSS file, import the PrismJS styles. Create or update the file to include the following line:

```css
@import '~prismjs/themes/prism.css';
```

Step 4: Configure Bridgetown and Liquid
In your Bridgetown configuration file (`bridgetown.config.js`), add the following lines:

```javascript
module.exports = {
  // other configuration options...

  markdown: {
    // other markdown configuration options...

    options: {
      highlight: (code, lang) => {
        const prism = require('prismjs');

        // Check if the specified language is supported by PrismJS
        const language = prism.languages[lang] ? lang : 'markup';

        // Use PrismJS to highlight the code
        const highlightedCode = prism.highlight(code, prism.languages[language], language);

        // Wrap the highlighted code in a <pre><code> block
        return `<pre class="language-${language}"><code>${highlightedCode}</code></pre>`;
      }
    }
  }
};
```

This configuration sets up Bridgetown to use PrismJS for syntax highlighting in Markdown files. The `highlight` function takes the code and language specified in the fenced code block and returns the highlighted HTML.

Step 5: Add code blocks in your Markdown files
Now, you can add fenced code blocks to your Markdown files, specifying the language for syntax highlighting. For example:

<pre lang="markdown">
```javascript
console.log("test");
```
</pre>

Step 6: Build and run your website
Finally, build and run your Bridgetown website using the appropriate commands for your setup. The PrismJS syntax highlighting should now be applied to the fenced code blocks in your Markdown files.

That's it! Your Bridgetown website should now have PrismJS syntax highlighting applied to fenced code blocks.


---

## Second Message

To add PrismJS syntax highlighting to a website built with Bridgetown (Ruby), WebPack, and Liquid, you can follow these steps:

Step 1: Install the required packages
Ensure that you have Bridgetown, Webpacker, and Liquid already set up for your website. Additionally, you'll need to install the necessary packages for PrismJS and syntax highlighting.

```shell
# Install PrismJS and its plugins
npm install prismjs prismjs/components/prism-javascript prismjs/components/prism-css prismjs/components/prism-markup
```

Step 2: Configure Webpacker
Update your Webpacker configuration to include the PrismJS styles and scripts.

In your `config/webpack/environment.js` file, add the following lines:

```javascript
const { environment } = require('@rails/webpacker');

// Add PrismJS styles
environment.loaders.get('sass').use.splice(-1, 0, {
  loader: 'sass-loader',
  options: {
    additionalData: `
      @import "~prismjs/themes/prism.css";
    `
  }
});

// Add PrismJS scripts
environment.loaders.append('prism', {
  test: require.resolve('prismjs'),
  use: [{
    loader: 'expose-loader',
    options: 'Prism'
  }]
});

module.exports = environment;
```

Step 3: Include PrismJS scripts and styles
In your website's layout file (e.g., `layouts/default.liquid`), add the following code to include the PrismJS scripts and styles:

```liquid
{% assign webpacker = site.webpacker %}
{% if webpacker %}
  {% assign asset_paths = webpacker.asset_paths %}
  <script src="{{ asset_paths.javascript.prism }}"></script>
  <link rel="stylesheet" href="{{ asset_paths.stylesheets.prism }}" />
{% endif %}
```

Step 4: Apply syntax highlighting to fenced code blocks
In your CSS file (e.g., `assets/stylesheets/main.scss`), add the following CSS to style the code blocks:

```css
/* Adjust as needed */
pre {
  padding: 1em;
  background-color: #f7f7f7;
}

code[class*="language-"] {
  color: black;
}
```

In your Liquid template files (e.g., `components/code_block.liquid`), modify the code block rendering to include PrismJS classes:

```liquid
{% assign code_block = ... %}  {# Get the code block content #}
{% assign language = ... %}  {# Get the code block language #}

<pre><code class="language-{{ language | default: 'none' }}">
  {{ code_block }}
</code></pre>
```

Ensure that the `language-{{ language }}` class is added to the code block's `<code>` element.

	That's it! Now your website built with Bridgetown, Webpack, and Liquid should have PrismJS syntax highlighting applied to the fenced code blocks in your Markdown files.