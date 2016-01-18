metalsmith = require 'metalsmith'
markdown   = require 'metalsmith-markdown'
layouts    = require 'metalsmith-layouts'
handlebars = require 'handlebars'
fs         = require 'fs'

ROOT_PATH = __dirname
BUILD_PATH = ROOT_PATH + '/build'
TEMPLATE_PATH = ROOT_PATH + '/templates'

# metalsmith-layouts
optLayouts =
  engine: 'handlebars'
  directory: TEMPLATE_PATH + '/layouts'
  partials: TEMPLATE_PATH + '/partials'
  default: 'default.hbs'

metalsmith(__dirname)
  .use markdown()
  .use layouts optLayouts
  .destination BUILD_PATH
  .build()
