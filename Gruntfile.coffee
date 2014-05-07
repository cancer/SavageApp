module.exports = (grunt) ->

  require('load-grunt-tasks')(grunt)

  grunt.initConfig
    coffee:
      compile:
        files:
          'htdocs/js/app.js': [
            'coffee/app.coffee'
            'coffee/controler/**/*.coffee"'
            'coffee/directive/**/*.coffee'
          ]

    concat:
      vendorjs:
        options:
          separator: ';'
        src: [
          'bower_components/angular/angular.js'
          'bower_components/angular-route/angular-route.js'
          'bower_components/jquery/dist/jquery.js'
          'bower_components/underscore/underscore.js'
          'bower_components/ratchet/dist/js/ratchet.js'
        ]
        dest: 'htdocs/js/vendor.js'

    jade:
      compile:
        options:
          pretty: true
        files: [
          expand: true
          cwd: 'template/'
          src: [
            '**/*.jade'
            '!contents/*.jade'
          ]
          dest: 'htdocs/'
          ext: '.html'
        ]

    copy:
      font:
        files: [
          expand: true
          flatten: true
          src: 'bower_components/ratchet/fonts/*'
          dest: 'htdocs/fonts/'
          filter: 'isFile'
        ]

    compass:
      options:
        bundleExec: true
        config: 'config.rb'
      product:
        options:
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
      jade:
        files: ['template/**/*.jade']
        tasks: ['jade:compile']

  grunt.registerTask 'build', ['copy', 'coffee', 'concat', 'jade', 'compass']

  grunt.registerTask 'default', ['copy', 'connect', 'watch']
