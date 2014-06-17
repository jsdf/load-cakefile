# load-cakefile

loads/requires tasks and exports from a Cakefile (because normal require() doesn't work with Cakefiles)

### Example

```coffee

loadCakefile = require 'load-cakefile'

# get logical contents of specified Cakefile including task definitions
loadCakefile.load('./Cakefile')
# { tasks:
#    { 'build:lib':
#       { name: 'build:lib',
#         description: 'build client lib',
#         action: [Function] },
#      'build:ui':
#       { name: 'build:ui',
#         description: 'build client ui',
#         action: [Function] },
# ...

# just get tasks
tasks = loadCakefile.tasks('./Cakefile')
# run a task
tasks['build:ui'].action(options)

# just get exports (eg. module.exports), like normal require()
loadCakefile.require('./Cakefile')
# { watchFiles: [Function],
#   buildLib: [Function],
#   buildUI: [Function],
# ...

# with no arguments, implicitly loads Cakefile from current working directory
loadCakefile.load()
# { tasks:
#    { 'build:lib':
#       { name: 'build:lib',
# ...

```


### Installation
```bash
npm install load-cakefile
```
