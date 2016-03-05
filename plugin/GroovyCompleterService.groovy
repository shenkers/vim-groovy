import groovy.ui.GroovySocketServer

new GroovySocketServer(
    new GroovyShell(),
    true,                     // script is a file name
    'GroovyCompleter.groovy', // script
    true,                     // return result to client
    9999)
