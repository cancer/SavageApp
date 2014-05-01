module.exports = (grunt) ->

  require('load-grunt-tasks')(grunt)

  grunt.initConfig
    coffee:
      compile:
        files:
          'htdocs/js/app.js': [
            'coffee/app.coffee'
          ]
    concat:
      options:
        separator: ';'
      dist:
        src: [
          'bower_components/angular/angular.min.js'
          'bower_components/jquery/dist/jquery.min.js'
          'bower_components/underscore/underscore.js'
          'bower_components/ratchet/dist/js/ratchet.min.js'
        ]
        dest: 'htdocs/js/vendor.js'
    compass:
      compile:
        options:
          bundleExec: true
          sassDir: 'sass'
          cssDir: 'htdocs/css'
          environment: 'production'
    connect:
      server:
        options:
          livereload: true
          port: '9000'
          base: './htdocs/'
          middleWare: (connect, options) ->
            return [
              connect.static options.base
              require('grunt-connect-proxy/lib/utils').proxyRequest
            ]
    watch:
      options:
        livereload: true
      coffee:
        files: ['coffee/**/*.coffee']
        tasks: ['coffee']
      compass:
        files: ['scss/**/*.scss']
        tasks: ['compass']

  grunt.registerTask 'build', ['coffee', 'concat', 'compass']

  grunt.registerTask 'default', ['connect', 'watch']
