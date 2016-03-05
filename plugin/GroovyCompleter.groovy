package com.thecodesmith.vim.groovy

import groovy.json.JsonOutput
import jline.console.completer.Completer
import org.codehaus.groovy.tools.shell.Groovysh
import org.codehaus.groovy.tools.shell.InteractiveShellRunner
import org.codehaus.groovy.tools.shell.IO

List<Completer> getCompleters() {
    def out = new BufferedOutputStream(new ByteArrayOutputStream())
    def err = new BufferedOutputStream(new ByteArrayOutputStream())
    def io = new IO(new ByteArrayInputStream(), out, err)

    def shell = new Groovysh(io)
    def runner = new InteractiveShellRunner(shell, { '>' })
    runner.run()

    runner.reader.completers
}

List complete(String line, int cursor, List<Completer> completers) throws IOException {
    if (completers.size() == 0) { return [] }

    List candidates = new LinkedList()
    String buffer = line
    int position = -1

    for (Completer completer : completers) {
        if ((position = completer.complete(buffer, cursor, candidates)) != -1) {
            break
        }
    }

    if (candidates.size() == 0) { return [] }

    [candidates, position]
}

String getCandidates(String line) {
    def candidates = []
    def position = line.size()
    def error = ''
    def logs = []

    try {
        logs << "complete($line, $position)"
        (candidates, position) = complete(line, position, completers) ?: [[], position]
    } catch (e) {
        error = e.message
    }

    logs << "$candidates, $position, $error"

    JsonOutput.toJson([
        'candidates': candidates.sort(),
        'position': position,
        'error': error,
        'logs': logs
    ])
}

println getCandidates(line)
