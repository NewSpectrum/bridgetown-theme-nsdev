import "index.scss"
import "syntax-highlighting.css"
import "bridgetown-quick-search/dist"

// Import all JavaScript & CSS files from src/_components
const componentsContext = require.context("bridgetownComponents", true, /\.(js|css)$/)
componentsContext.keys().forEach(componentsContext)

console.info("Bridgetown is loaded!")
