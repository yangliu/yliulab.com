metalsmith = require 'metalsmith'
markdown   = require 'metalsmith-markdown'
templates  = require 'metalsmith-templates'
handlebars = require 'handlebars'
fs = require 'fs'


ROOT_PATH = __dirname
BUILD_PATH = ROOT_PATH + '/build'
TEMPLATE_PATH = ROOT_PATH + '/templates'
TEMPLATE_PARTIAL_PATH = TEMPLATE_PATH + '/partials'

handlebars.registerPartial 'header', fs.readFileSync(TEMPLATE_PARTIAL_PATH + '/header.tpl').toString()
handlebars.registerPartial 'footer', fs.readFileSync(TEMPLATE_PARTIAL_PATH + '/footer.tpl').toString()

metalsmith(__dirname)
  .use markdown()
  .use templates 'handlebars'
  .destination BUILD_PATH
  .build()
