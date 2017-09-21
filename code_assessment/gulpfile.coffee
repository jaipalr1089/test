gulp        = require 'gulp'
coffee      = require 'gulp-coffee'

gulp.task 'default', ['coffee']

gulp.task 'coffee', ->
  gulp.src './public/coffee/*.coffee'
  .pipe coffee({bare: true})
  .pipe gulp.dest('./public/js/')

watcher = gulp.watch './public/coffee/*.coffee', ['coffee']

watcher.on 'change', (event) ->
  console.log 'File ' + event.path + ' ' + event.type + ', compiling...'