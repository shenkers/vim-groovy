package com.thecodesmith.vim.groovy

@Grab('org.spockframework:spock-core:1.0-groovy-2.4')

import groovy.json.*
import spock.lang.*

class GroovyCompleterSpec extends Specification {

    @Shared GroovyCompleter completer

    def setup() {
        completer = new GroovyCompleter()
    }

    @Unroll
    def 'import test'() {
        when:
        def json = new JsonSlurper().parseText(completer.getCandidates(line))

        then:
        json.candidates.sort() == candidates

        where:
        line                | candidates
        'im'                | ['import ', 'import ']
        'import jav'        | ['java.', 'javafx.', 'javax.']
        'import groovy.io.' | ['* ', 'EncodingAwareBufferedWriter ', 'FileType ', 'FileVisitResult ', 'GroovyPrintStream ', 'GroovyPrintWriter ', 'LineColumnReader ', 'PlatformLineWriter ']
    }

    def 'performance test'() {
        setup:
        def start = new Date()

        when:
        completer.getCandidates('import groovy.')

        and:
        def stop = new Date()

        then:
        def result = stop.time - start.time
        result < 500
    }
}
