module.exports = (grunt) ->

  require('load-grunt-tasks')(grunt)

  grunt.initConfig
    coffee:
      compile:
        files:
          'app.js': [
            'coffee/app.js'
          ]
    compass:
      compile:
        options:
          sassDir: 'sass'
          cssDir: 'css'
          environment: 'production'
    connect:
      server:
        options:
          port: '9000'
          base: '.'
    watch:
      coffee:
        files: ['coffee/**/*.coffee']
        tasks: ['coffee']
      compass:
        files: ['scss/**/*.scss']
        tasks: ['compass']

  grunt.registerTask 'default', ['connect', 'watch']

