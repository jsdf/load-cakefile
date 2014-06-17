fs = require 'fs'
path = require 'path'
CoffeeScript = require 'coffee-script'
merge = require 'xtend'

module.exports = exports = {}
exports.load = loadCakefile = (filepath = 'Cakefile') ->
  tasks = {}
  options = {}
  switches = []

  sandbox = merge global,
    task: (name, description, action) ->
      [action, description] = [description, action] unless action
      tasks[name] = {name, description, action}
    option: (letter, flag, description) ->
      switches.push [letter, flag, description]
    invoke: (name) ->
      missingTask name unless tasks[name]
      tasks[name].action options

  CoffeeScript.eval fs.readFileSync(filepath).toString(),
    filename: 'Cakefile'
    sandbox: sandbox

  {
    tasks,
    options,
    switches,
    exports: sandbox.module.exports
  }

exports.require = requireCakefile = (filepath) ->
  loadCakefile(filepath).exports

exports.tasks = tasksFromCakefile = (filepath) ->
  loadCakefile(filepath).tasks

exports.runTask = runTaskFromCakefile = (filepath, options) ->
  loadCakefile(filepath).tasks
